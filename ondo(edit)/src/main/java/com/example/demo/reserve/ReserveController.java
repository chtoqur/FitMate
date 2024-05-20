package com.example.demo.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.example.demo.book.BookVO;
import com.example.demo.book.NaverResultVO;
import com.example.demo.borrow.BorrowDAO;
import com.example.demo.common.SessionUtil;
import com.example.demo.overdue.OverdueDAO;
import com.example.demo.overdue.OverdueTblVO;
import com.example.demo.user.UserTblVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ReserveController {

    @Autowired
    ReserveDAO reserveDAO;

    @Autowired
    BorrowDAO borrowDAO;

    @Autowired
    OverdueDAO overdueDAO;

    @GetMapping("/reservelist")
    public String reserveList(@ModelAttribute("ReserveTblVO") ReserveTblVO vo, Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);

            ReserveTblVO rsVO = new ReserveTblVO();
            rsVO.setUserId(userTblVO.getUserId());
            List<ReserveTblVO> resultVO = reserveDAO.selectRsList(rsVO);
    
            // ReserveTblVO 리스트에 BookVO 객체를 포함하여 전달
            for (ReserveTblVO reserveVO : resultVO) 
            {
                // 책 정보를 가져와서 ReserveTblVO 넣어줍니다.
                BookVO bookVO = getBookInfo(reserveVO.getIsbn()); // 책 정보를 가져오는 메서드를 구현해야합니다.
                reserveVO.setBook(bookVO);
            }
            
            model.addAttribute("book", resultVO);
        }


        return "reservelist";
    }

    private BookVO getBookInfo(String isbn) {
        String clientId = "48nxdPZ14ojZRBfJ7zW7";
        String clientSecret = "tO37rq0RyH";

        RestTemplate restTemplate = new RestTemplate();

        // 네이버 도서 검색 API 호출
        String apiUrl = "https://openapi.naver.com/v1/search/book.json?query=" + isbn;
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", clientId);
        headers.set("X-Naver-Client-Secret", clientSecret);
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

        ObjectMapper objectMapper = new ObjectMapper();
        NaverResultVO resultVO;
        try {
            resultVO = objectMapper.readValue(response.getBody(), NaverResultVO.class);
            if (resultVO.getItems() != null && !resultVO.getItems().isEmpty()) {
                BookVO bookVO = resultVO.getItems().get(0); // 첫 번째 검색 결과 가져옴
                return bookVO;
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return null;
    }

    @PostMapping("/reservationStatus")
    @ResponseBody
    public ReservationResultDTO reservationStatus(@RequestBody ReserveTblVO rsVO, Model model) throws Exception
    {
        // SEQ를 포함한 예약자의 모든 정보 조회
        ReserveTblVO realVO = reserveDAO.checkReserveUser(rsVO);

        // 예약건수
        Integer rsNum = reserveDAO.selectReserveNum(rsVO);
        // 예약자 순번
        Integer userSeq = Integer.parseInt(realVO.getSeq());

        // 두 가지 정보를 담을 객체 생성
        ReservationResultDTO resultDTO = new ReservationResultDTO();
        resultDTO.setRsNum(rsNum);
        resultDTO.setUserSeq(userSeq);
        
        return resultDTO;
    }
    
    @PostMapping("/reserveBook")
    @ResponseBody
    public String reserveBook(@RequestBody ReserveTblVO vo) throws Exception
    {
        int rsCount = reserveDAO.selectReserveCount(vo);
        
        if (rsCount == 5)
        {
            return "$MAX";
        }

        OverdueTblVO overdueVO = new OverdueTblVO();
        overdueVO.setUserId(vo.getUserId());
        List<OverdueTblVO> overdueList = overdueDAO.selectOverdueUser(overdueVO);

        if (overdueList != null)
        {
            return "$OVERDUE";
        }

        
        int resultCount = reserveDAO.insertOneReserve(vo);
        
        if (resultCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }
    }

    @PostMapping("/cancelReservation")
    @ResponseBody
    public String cancelReservation(@RequestBody ReserveTblVO vo) throws Exception
    {
        // 예약 취소 대상의 모든 정보 = realVO
        ReserveTblVO realVO = reserveDAO.checkReserveUser(vo);

        // 자신을 제외한 다른 예약자 있는지 확인
        Integer rsNum = reserveDAO.selectReserveCount(realVO);
        // 자신 이외의 예약자가 있는 경우
        if (rsNum > 1)
        {
            // SEQ 넘버를 -1씩 UPDATE
            Integer updateSeqCount = reserveDAO.updateSeq(realVO);

            if (updateSeqCount == 0)
            {
                return "$FAIL";
            }
        }

        int calcelCount = reserveDAO.deleteOneReserve(vo);

        if (calcelCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }        
    }
}
