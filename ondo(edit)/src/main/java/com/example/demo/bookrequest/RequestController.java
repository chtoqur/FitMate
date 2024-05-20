package com.example.demo.bookrequest;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.trace.http.HttpTrace.Request;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.demo.book.BookVO;
import com.example.demo.book.NaverResultVO;
import com.example.demo.common.SessionUtil;
import com.example.demo.user.UserTblVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RequestController {

    @Autowired
    RequestDAO requestDAO;
    
    @GetMapping("/request/requestbooklist")
    public String requestbooklist(String text, Model model) throws Exception 
    {      
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("vo", userTblVO);
        
        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((text == null) || (text.length() ==0))
        {
            return  "/request/requestbooklist";
        }
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/book.json")
        		  .queryParam("query", text)
        		  .queryParam("display", 10)
        		  .queryParam("start", 1)
        		  .queryParam("sort", "sim")
        		  .encode()
        		  .build()
        		  .toUri();
        		  
        // Spring에서 HTTP 요청을 나타내는 클래스 : RequestEntity 
        RequestEntity<Void> req = RequestEntity
        						 .get(uri)
        						 .header("X-Naver-Client-Id", clientId)
        						 .header("X-Naver-Client-Secret", clientSecret)
        						 .build();

        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        NaverResultVO resultVO = null;
        
        try {
        	resultVO = om.readValue(resp.getBody(), NaverResultVO.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        
        List<BookVO> books = resultVO.getItems();	// books를 list.html에 출력 -> model 선언
        model.addAttribute("books", books);

        return "/request/requestbooklist";
	}

    @GetMapping("/request/requestbook")
    public String requestbook(@RequestParam("isbn") String isbn,
                            @RequestParam("title") String title,
                            @RequestParam("author") String author,
                            @RequestParam("publisher") String publisher,
                            @RequestParam("pubdate") String pubdate,
                            @RequestParam("discount") String discount,
                            Model model) throws Exception {

        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("vo", userTblVO);

        model.addAttribute("isbn", isbn);
        model.addAttribute("title", title);
        model.addAttribute("author", author);
        model.addAttribute("publisher", publisher);
        model.addAttribute("pubdate", pubdate);
        model.addAttribute("discount", discount);

        return "/request/requestbook";
    }

     @PostMapping("/request/requestbook")
     @ResponseBody
     public String requestbook(@RequestBody RequestVO vo, Model model) throws Exception
     {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("vo", userTblVO);

        vo.setUserId(userTblVO.getUserId());

        Integer selectCount = requestDAO.selectOverlapIsbn(vo);
        
        // 중복신청이 아닌 경우
        if (selectCount == 0)
        {
            int insertCount = requestDAO.insertOneRequeset(vo);

            if (insertCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
        // 중복신청인 경우
        else
        {
            return "$OVERLAP";
        }
        
     }

    @GetMapping("/request/requestbbs")
    public String requestBbs(@RequestParam(defaultValue = "0") int page, Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        
        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);

            RequestVO requestVO = new RequestVO();
            requestVO.setUserId(userTblVO.getUserId());
            
            int rowCount = requestDAO.selectBbsRowCountById(requestVO);
            model.addAttribute("rowCount", rowCount);
        }

        model.addAttribute("page", page);

        return "/request/requestbbs";
    }

    @PostMapping("/request/requestbbs")
    @ResponseBody
    public RequestMstVO requestBbs(@ModelAttribute("RequestVO") RequestVO vo, Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("vo", userTblVO);

        RequestMstVO requestMstVO = new RequestMstVO();

        // 1. 전체 row의 개수를 가지고 온다.
        int rowCount = requestDAO.selectBbsRowCount();

        // 2. page에 해당하는 BBS데이터를 가지고 온다.
        List<RequestVO> list = requestDAO.selectBbsList(vo);

        // 3. RequestMstVO에 저장하고 전송한다.
        requestMstVO.setRowCount(rowCount);
        requestMstVO.setRequestList(list);

        return requestMstVO;
    }

    @GetMapping("/request/requestdetail")
    public String requestDetail(@RequestParam("isbn") String isbn,
                                @RequestParam("reqdate") String reqdate,
                                @RequestParam("title") String title,
                                @RequestParam("author") String author,
                                @RequestParam("publisher") String publisher,
                                @RequestParam("pubdate") String pubdate,
                                @RequestParam("discount") String discount,
                                @RequestParam("note") String note,
                                 Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("vo", userTblVO);

        model.addAttribute("isbn", isbn);
        model.addAttribute("reqdate", reqdate);
        model.addAttribute("title", title);
        model.addAttribute("author", author);
        model.addAttribute("publisher", publisher);
        model.addAttribute("pubdate", pubdate);
        model.addAttribute("discount", discount);
        model.addAttribute("note", note);

        return "/request/requestdetail";
    }

    @PostMapping("/cancelrequest")
    @ResponseBody
    public String cancelRequest(@RequestBody RequestVO vo) throws Exception
    {
        Integer selectCount = requestDAO.selectCancelRequest(vo);
        if (selectCount >= 1)
        {
            return "$OVERLAP";
        }
        else
        {
            int updateCount = requestDAO.updateProcResult(vo);
        
            if (updateCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
        
    }

}
