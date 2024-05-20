package com.example.demo.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.bookrequest.RequestMstVO;
import com.example.demo.bookrequest.RequestVO;
import com.example.demo.common.SessionUtil;
import com.example.demo.review.ReviewTblVO;
import com.example.demo.user.UserTblVO;

@Controller
public class NoticeController {

    @Autowired
    NoticeDAO noticeDAO;

    @GetMapping("/notice/notice")
    public String notice(@RequestParam(defaultValue = "0") int page, Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        UserTblVO adminTblVO = (UserTblVO)SessionUtil.getAttribute("ADMIN");

        int rowCount = noticeDAO.selectNoticeRowCount();
        
        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);
        }
        if (adminTblVO != null)
        {
            model.addAttribute("admin", adminTblVO);
        }

        model.addAttribute("page", page);
        model.addAttribute("rowCount", rowCount);

        return "/notice/notice";
    }

    @PostMapping("/notice")
    @ResponseBody
    public NoticeMstVO notice(@RequestBody NoticeVO vo, Model model) throws Exception
    {
        NoticeMstVO noticeMstVO = new NoticeMstVO();

        // 1. 전체 row의 개수를 가지고 온다.
        int rowCount = noticeDAO.selectNoticeRowCount();

        // 2. page에 해당하는 BBS데이터를 가지고 온다.
        List<NoticeVO> list = noticeDAO.selectNoticeList(vo);

        // 3. NoticeMstVO 저장하고 전송한다.
        noticeMstVO.setRowCount(rowCount);
        noticeMstVO.setNoticeList(list);

        // 4. wrdate 시간을 제외한 날짜부만 전송한다.
        for (int i = 0; i < list.size(); i++)
        {
            NoticeVO notice = list.get(i);
            String[] wrdates = notice.getWrdate().split(" ");
            String wrdate = wrdates[0];
            list.get(i).setWrdate(wrdate);
        }

        return noticeMstVO;
    }

    @GetMapping("/notice/writenotice")
    public String writeNotice(Model model) throws Exception
    {
        UserTblVO adminTblVO = (UserTblVO)SessionUtil.getAttribute("ADMIN");
        if (adminTblVO != null)
        {
            model.addAttribute("admin", adminTblVO);
        }

        return "/notice/writenotice";
    }

    @PostMapping("/writenotice")
    @ResponseBody  
    public String writeNotice(@RequestBody NoticeVO vo) throws Exception
    {
        int insertCount = noticeDAO.insertNoticeContent(vo);

        if (insertCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }
    }

    @GetMapping("/notice/noticedetail")
    public String noticeDetail(@ModelAttribute("NoticeVO") NoticeVO vo,
                                @RequestParam("writer") String writer,
                                @RequestParam("seq") String seq,
                                @RequestParam("userId") String userId,
                                @RequestParam("title") String title,
                                @RequestParam("content") String content,
                                @RequestParam("wrdate") String wrdate,
                                @RequestParam("divi") String divi,
                                @RequestParam("views") String views,
                                Model model) throws Exception
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

        NoticeVO resultVO = noticeDAO.selectNoticeContent(vo);
        
        model.addAttribute("session", resultVO);
        model.addAttribute("writer", writer);
        model.addAttribute("seq", seq);
        model.addAttribute("userId", userId);
        model.addAttribute("title", title);
        model.addAttribute("content", content);
        model.addAttribute("wrdate", wrdate);
        model.addAttribute("divi", divi);
        
        int viewVO = noticeDAO.updateViewCount(vo);
        NoticeVO realViewCount = noticeDAO.selectViewCount(vo);
        model.addAttribute("views", realViewCount.getViews());

        return "/notice/noticedetail";
    }

    @PostMapping("/noticedetail")
    @ResponseBody  
    public String noticeDetail(@RequestBody NoticeVO vo) throws Exception
    {
        int updateCount = noticeDAO.updateNoticeContent(vo);

        if (updateCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }
    }

    @PostMapping("/deletenotice")
    @ResponseBody  
    public String deleteNotice(@RequestBody NoticeVO vo) throws Exception
    {
        int deleteCount = noticeDAO.deleteNoticeContent(vo);

        if (deleteCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }
    }
    
}
