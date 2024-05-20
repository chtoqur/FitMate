package com.example.demo.review;

import java.io.StringBufferInputStream;
import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.example.demo.review.comment.ReviewCommentDAO;
import com.example.demo.review.comment.ReviewCommentMstVO;
import com.example.demo.review.comment.ReviewCommentTblVO;
import com.example.demo.user.UserTblVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ReviewController {

    @Autowired
    ReviewDAO reviewDAO;

    @Autowired
    ReviewCommentDAO reviewCommentDAO;

    @GetMapping("/review/reviewMain")
    public String reviewMain(@RequestParam(defaultValue = "0") int page, Model model) throws Exception
    {
        // 1. index를 요청한 대상에 세션이 존재하는지 여부 확인
        //    USER라는 대상의 VO를 가져옴
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        int rowCount = reviewDAO.selectReviewRowCount();

        if (userTblVO != null)
        {
            // 2-1. 세션O : model에 사용자 정보 저장 후 index.jsp로 전송
            model.addAttribute("vo", userTblVO);
        }
        
        model.addAttribute("page", page);
        model.addAttribute("rowCount", rowCount);
        
        // 2-2. 세션X : 정보 전송 없이 index.jsp 전송
        return "review/reviewMain";
    }


    @PostMapping("/review/list")
    @ResponseBody
    public ReviewMstVO reviewList(@RequestBody ReviewTblVO vo) throws Exception
    {

        ReviewMstVO reviewMstVO = new ReviewMstVO();

        // 1. 전체 row의 개수를 가지고 온다.
        int rowCount = reviewDAO.selectReviewRowCount();

        // 2. page에 해당하는 BBS 데이터를 가지고 온다.
        List<ReviewTblVO> list = reviewDAO.selectReviewList(vo);

        // 3. Master VO에 가져온 데이터를 저장하고 전송한다.
        reviewMstVO.setRowCount(rowCount);
        reviewMstVO.setReviewList(list);

        // 4. regDate에서 시간을 제외한 날짜부만 전송한다.
        for (int i = 0; i < list.size(); i++)
        {
            ReviewTblVO review = list.get(i);
            String[] regDates = review.getRegDate().split(" ");
            String regDate = regDates[0];
            list.get(i).setRegDate(regDate);
        }

        return reviewMstVO;
    }

    @GetMapping("/review/reviewContent")
    public String content(@ModelAttribute("ReviewTblVO") ReviewTblVO vo, Model model) throws Exception
    {
        // 조회수 증가
        System.out.println("review VO = " + vo);
        // 코드 작성
        reviewDAO.updateViewCount(vo);

        // userId, seq에 맞는 게시물을 가지고 온다.
        ReviewTblVO reviewVO = reviewDAO.selectReviewContent(vo);

        // 세션 정보를 가지고 온다.
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        // vo의 isbn을 가지고 도서 정보 전송하기
        String isbn = reviewVO.getIsbn();

        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((isbn == null) || (isbn.length() ==0))
        {
            return  "review/writeReview";
        }
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/book.json")
        		  .queryParam("query", isbn)
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
        
        List<BookVO> books = resultVO.getItems();
        if (books.size() > 0) {
            BookVO book = books.get(0);
            model.addAttribute("book", book);
        }
        
        // 게시판 정보와 사용자 세션 정보를 모델에 저장한다.
        model.addAttribute("vo", reviewVO);         // content row 정보
        model.addAttribute("session", userTblVO);   // log-in user 정보

        // 리뷰 정보 전송
        String reviewCode = reviewVO.getSeq() + "-" + reviewVO.getUserId();
        ReviewCommentTblVO rvCmtVO = new ReviewCommentTblVO();
        rvCmtVO.setReviewCode(reviewCode);

        int commentCount = reviewCommentDAO.selectCommentCount(rvCmtVO);
        List<ReviewCommentTblVO> cmtList = reviewCommentDAO.selectCommentList(rvCmtVO);

        for (int i = 0; i < cmtList.size(); i++)
        {
            ReviewCommentTblVO findVO = new ReviewCommentTblVO();
            findVO = reviewCommentDAO.findReplyId(cmtList.get(i));
            cmtList.get(i).setReplyToUserId(findVO.getReplyToUserId());
        }

        model.addAttribute("commentCount", commentCount);
        model.addAttribute("comments", cmtList);


        return "review/reviewContent";
    }

    @GetMapping("/review/searchBook")
    public String searchBook(String text, Model model) throws Exception 
    {
        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((text == null) || (text.length() ==0))
        {
            return "review/searchBook";
        }
        
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
        
        List<BookVO> books = resultVO.getItems();
        model.addAttribute("books", books);
        model.addAttribute("keyword", text);

        return "review/searchBook";
    }

    
    @GetMapping("/review/writeReview")
    public String writeReview(@RequestParam("isbn") String isbn, Model model) throws Exception
    {
        // 어느 계정으로 로그인 된 상태인지 세션 정보를 전송함
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("session", userTblVO);      // log-in user 정보

        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((isbn == null) || (isbn.length() ==0))
        {
            return  "review/writeReview";
        }
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/book.json")
        		  .queryParam("query", isbn)
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
        
        List<BookVO> books = resultVO.getItems();
        if (books.size() > 0) {
            BookVO book = books.get(0);
            model.addAttribute("book", book);
        }

        return "review/writeReview";
    }

    @PostMapping("/review/writeReview")
    @ResponseBody
    public int writeReview(@RequestBody ReviewTblVO vo) throws Exception
    {
        int insertCount = reviewDAO.insertOneReview(vo);
        
        if (insertCount == 1)
        {
            ReviewMstVO reviewMstVO = new ReviewMstVO();
            int rowCount = reviewDAO.selectReviewRowCount();
            reviewMstVO.setRowCount(rowCount);
            return rowCount;
        }
        else
        {
            return -1;
        }
    }

    @PostMapping("/editReview")
    @ResponseBody
    public int editReview(@RequestBody ReviewTblVO vo) throws Exception
    {
        int updateCount = reviewDAO.updateReviewContent(vo);

        if (updateCount == 1)
        {
            ReviewMstVO reviewMstVO = new ReviewMstVO();
            int rowCount = reviewDAO.selectReviewRowCount();
            reviewMstVO.setRowCount(rowCount);
            return rowCount;
        }
        else
        {
            return -1;
        }
    }

    @PostMapping("/deleteReview")
    @ResponseBody
    public String deleteReview(@RequestBody ReviewTblVO vo) throws Exception
    {
        int deleteCount = reviewDAO.deleteOneReview(vo);

        if (deleteCount == 1)
        {
            reviewDAO.updateReviewSeq(vo);
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }
    
}
