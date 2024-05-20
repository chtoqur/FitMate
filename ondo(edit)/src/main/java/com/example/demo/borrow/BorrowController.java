package com.example.demo.borrow;

import java.util.List;

import org.springframework.beans.BeanUtils;
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
import com.example.demo.comment.CommentDAO;
import com.example.demo.common.GmailSender;
import com.example.demo.common.SessionUtil;
import com.example.demo.overdue.OverdueDAO;
import com.example.demo.overdue.OverdueTblVO;
import com.example.demo.reserve.ReserveDAO;
import com.example.demo.reserve.ReserveTblVO;
import com.example.demo.comment.CommentTblVO;
import com.example.demo.user.UserDAO;
import com.example.demo.user.UserTblVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BorrowController {

    @Autowired
    BorrowDAO borrowDAO;

    @Autowired
    CommentDAO commentDAO;

    @Autowired
    ReserveDAO reserveDAO;

    @Autowired
    UserDAO userDAO;

    @Autowired
    OverdueDAO overdueDAO;

    @PostMapping("/borrowBook")
    @ResponseBody
    public String borrowBook(@RequestBody BorrowTblVO vo, Model model) throws Exception
    {
        // 이미 5권 이상 대출 중인 유저 = return $MAX;
        Integer borrowNum = borrowDAO.getBookCount(vo);
        if (borrowNum == 5)
        {
            return "$MAX";
        }

        // 연체중인 도서가 있는 유저 = return $OVERDUE;
        OverdueTblVO overdueTblVO = new OverdueTblVO();
        overdueTblVO.setUserId(vo.getUserId());

        List<OverdueTblVO> overdueList = overdueDAO.selectOverdueUser(overdueTblVO);

        if (overdueList.size() != 0)
        {
            return "$OVERDUE";
        }
        
        int resultCount = borrowDAO.insertOneBorrow(vo);
        if (resultCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }
    }

    // 반납
    @PostMapping("/returnBook")
    @ResponseBody
    public String returnBook(@RequestBody BorrowTblVO brVO) throws Exception
    {
        // 반납하려는 도서의 isbn으로 예약 테이블을 조회해서 가져온 목록 중 
        // 가장 작은 SEQ 값에 해당하는 유저 정보를 reserveTblVO에 저장
        ReserveTblVO rsVO = new ReserveTblVO();

        rsVO.setIsbn(brVO.getIsbn());
        // 가장 작은 SEQ 값에 해당하는 예약자의 정보
        rsVO = reserveDAO.selectOneReserveUser(rsVO);

        // 예약 없다면 바로 삭제
        if (rsVO == null)
        {
            int deleteCount = borrowDAO.deleteOneBorrow(brVO);
            
            if (deleteCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
        // 예약 존재하는 경우
        else
        {
            // 자신을 제외한 다른 예약자 있는지 확인
            Integer rsNum = reserveDAO.selectReserveCount(rsVO);

            if (rsNum > 1)
            {
                // SEQ 넘버를 -1씩 UPDATE
                Integer updateSeqCount = reserveDAO.updateAllSeq(rsVO);
    
                if (updateSeqCount == 0)
                {
                    return "$FAIL";
                }
            }

            // 1. 대출테이블에서 해당 대출자의 정보 삭제
            int deleteCount = borrowDAO.deleteOneBorrow(brVO);

            if (deleteCount == 1)
            {
                // 가장 작은 SEQ 값에 해당하는 예약자의 정보를 brVO에 복사
                BeanUtils.copyProperties(rsVO, brVO);

                // 2. 복사된 예약자 정보를 대출테이블에 추가
                int insertCount = borrowDAO.insertOneBorrow(brVO);

                if (insertCount == 1)
                {
                    // 3. 자동대출 완료된 사용자는 예약테이블에서 삭제
                    int rsDeleteCount = reserveDAO.deleteOneReserve(rsVO);

                    if (rsDeleteCount == 1)
                    {
                        String senderName = "jwuuuuu6363@gmail.com";
                        String senderPasswd = "roulhlkadlzqvvsz";
                        GmailSender gmailSender = null;
                        
                        if (rsVO != null)
                        {
                            // UserTbl에서 이메일 가져오기
                            UserTblVO userTblVO = new UserTblVO();
                            userTblVO.setUserId(rsVO.getUserId());
                            userTblVO = userDAO.selectOnePw(userTblVO);
                            String userEmail = userTblVO.getEmail();

                            // BorrowTbl에서 책제목 가져오기
                            BorrowTblVO newBrVO = new BorrowTblVO();
                            newBrVO.setUserId(rsVO.getUserId());
                            newBrVO.setIsbn(rsVO.getIsbn());
                            newBrVO = borrowDAO.checkBorrowUser(newBrVO);
                            String title = newBrVO.getTitle();

                            // 자동대출 알림을 메일로 전송
                            gmailSender = new GmailSender(senderName, senderPasswd);

                            // 1param : 받을 사람의 이메일 주소
                            // 2param : 메일 제목
                            // 3param : 메일 내용
                            gmailSender.sendEmail(userEmail, "온라인 도서관", "예약하신 책 '" + title + "'이(가) 반납되어 자동 대출되었음을 알려드립니다.");

                            return "OK";
                            
                        }
                    }
                }
            }
            return "$FAIL";
        }        
    }

    @PostMapping("/writeComment")
    @ResponseBody
    public String writeComment(@RequestBody CommentTblVO vo, Model model) throws Exception
    {
        CommentTblVO isExistComment = commentDAO.selectOneCommentById(vo);
        
        if (isExistComment != null)
        {
            return "$EXIST";
        }
        else
        {
            int resultCount = commentDAO.insertOneComment(vo);
    
            if (resultCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
    }

    @GetMapping("/borrowlist")
    public String borrowList(@ModelAttribute("BorrowTblVO") BorrowTblVO vo, Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);

            BorrowTblVO brVO = new BorrowTblVO();
            brVO.setUserId(userTblVO.getUserId());
            List<BorrowTblVO> resultVO = borrowDAO.selectBrList(brVO);

            // BorrowTblVO 리스트에 BookVO 객체를 포함하여 전달
            for (BorrowTblVO borrowVO : resultVO) 
            {
                // 책 정보를 가져와서 BorrowTblVO에 넣어줍니다.
                BookVO bookVO = getBookInfo(borrowVO.getIsbn()); // 책 정보를 가져오는 메서드를 구현해야합니다.
                borrowVO.setBook(bookVO);
            }
            
            model.addAttribute("book", resultVO);
    
            // 대출 건수 전송
            Integer brNum = borrowDAO.selectBrNum(brVO);
            model.addAttribute("brNum", brNum);
        }
        
        return "borrowlist";
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


    @PostMapping("/renew")
    @ResponseBody
    public String renew(@RequestBody BorrowTblVO vo) throws Exception
    {
        ReserveTblVO rsVO = new ReserveTblVO();
        rsVO.setIsbn(vo.getIsbn());

        // 예약자 카운트 가져오기
        int rsCount = reserveDAO.selectReserveCount(rsVO);

        if (rsCount > 0)
        {
            return "$FAIL";
        }

        BorrowTblVO checkRenew = borrowDAO.selectBorrowByRenew(vo);

        if (checkRenew.getRenew().equals("T"))
        {
            return "$EXIST";
        }
        else
        {
            int rnCount = borrowDAO.updateRenew(vo);
            if (rnCount == 1)
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