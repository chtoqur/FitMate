package com.example.demo;

import java.net.URI;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.example.demo.borrow.BorrowDAO;
import com.example.demo.borrow.BorrowTblVO;
import com.example.demo.comment.CommentDAO;
import com.example.demo.common.GmailSender;
import com.example.demo.common.SessionUtil;
import com.example.demo.comment.CommentTblVO;
import com.example.demo.user.UserDAO;
import com.example.demo.user.UserTblVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MainController {

    @Autowired
    UserDAO userDAO;

    @GetMapping("/index")
    public String index(Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        UserTblVO adminTblVO = (UserTblVO)SessionUtil.getAttribute("ADMIN");
        
        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);
        }
        if (adminTblVO != null)
        {
            model.addAttribute("admin", adminTblVO);
        }

        return "index";
    }

    @GetMapping("/login")
    public String login(Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        UserTblVO adminTblVO = (UserTblVO)SessionUtil.getAttribute("ADMIN");

        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);
        }

        if (adminTblVO != null)
        {
            model.addAttribute("admin", adminTblVO);
        }

        return "login";
        
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(@RequestBody UserTblVO vo, HttpServletRequest request, Model model) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO == null)
        {
            return "FAIL";
        }
        else
        {
            if ((vo.getUserId().equals("admin")) && (vo.getUserPw().equals("0000")))
            {
                SessionUtil.set(request, "ADMIN", resultVO);
            }
            else
            {
                SessionUtil.set(request, "USER", resultVO);
            }
            return "OK";
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request,
                        HttpServletResponse response) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        UserTblVO adminTblVO = (UserTblVO)SessionUtil.getAttribute("ADMIN");

        if (userTblVO != null)
        {
            SessionUtil.remove(request, "USER");
        }
        else
        {
            SessionUtil.remove(request, "ADMIN");
        }
        response.sendRedirect("index");
    }

    @PostMapping("/checkid")
    @ResponseBody
    // public String checkId(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    public String checkId(@RequestBody UserTblVO vo) throws Exception
    {
        // 1. 넘어온 데이터(ID)와 일치하는 유저가 DB에 존재하는지 확인
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        // 2. 일치하는 정보가 없다면 회원가입 허용
        if (resultVO == null)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }

    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/join")
    @ResponseBody
    // public String join(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    public String join(@RequestBody UserTblVO vo) throws Exception
    {
        // DB에 insert 시켜준다.
        int insertCount = userDAO.insertOneUser(vo);

        if (insertCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }

    @GetMapping("/idinquiry")
    public String idInquiry()
    {
        return "idinquiry";
    }

    @PostMapping("/idinquiry")
    @ResponseBody
    // public String idInquiry(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    public String idInquiry(@RequestBody UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneId(vo);

        if (resultVO != null)
        {
            String id = resultVO.getUserId();
            String editedId = id.substring(0, id.length() - 2) + "**";
            return editedId;
        }
        else
        {
            return "$FAIL";
        }
    }

    @GetMapping("/pwinquiry")
    public String pwInquiry()
    {
        return "pwinquiry";
    }

    @PostMapping("/pwinquiry")
    @ResponseBody
    // public String pwInquiry(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    public String pwInquiry(@RequestBody UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOnePw(vo);

        String senderName = "jwuuuuu6363@gmail.com";
        String senderPasswd = "roulhlkadlzqvvsz";
        GmailSender gmailSender = null;
        
        if (resultVO != null)
        {
            // 비밀번호를 메일로 전송
            gmailSender = new GmailSender(senderName, senderPasswd);

            // 1param : 받을 사람의 이메일 주소
            // 2param : 메일 제목
            // 3param : 메일 내용
            gmailSender.sendEmail(resultVO.getEmail(), "비밀번호입니다.", "비밀번호 : " + resultVO.getUserPw());

            return "$OK";
        }
        else
        {
            return "$FAIL";
        }
        
    }

    
}