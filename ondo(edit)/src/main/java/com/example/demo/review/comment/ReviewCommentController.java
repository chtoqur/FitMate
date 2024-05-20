package com.example.demo.review.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.review.ReviewDAO;

@Controller
public class ReviewCommentController {

    @Autowired
    ReviewCommentDAO reviewCommentDAO;
    
    @PostMapping("/writeReviewComment")
    @ResponseBody
    public String writeReviewComment(@RequestBody ReviewCommentTblVO vo) throws Exception
    {
        int insertCount = reviewCommentDAO.writeReviewComment(vo);

        if (insertCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }

    }

    @PostMapping("/deleteReviewComment")
    @ResponseBody
    public String deleteReviewComment(@RequestBody ReviewCommentTblVO vo) throws Exception
    {
        // 리뷰 댓글 삭제
        int deleteCount = reviewCommentDAO.deleteReviewComment(vo);

        // 댓글이 원댓글인지, 대댓글인지 확인해야함

        reviewCommentDAO.updateSeqDueDelete(vo);        // 1. seq
        reviewCommentDAO.updateSortorderDueDelete(vo);  // 2. sortOrder

        if (vo.getReplyLev().equals("0"))
        {
            // 원댓글인 경우
            reviewCommentDAO.updateRegorderDueDelete(vo);   // 3. regOrder
        }
        else
        {
            // 대댓글인 경우
            reviewCommentDAO.updateReplylevDueDelete(vo);   // 3. replyLev
        }

        if (deleteCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }

    }

    @PostMapping("/editReviewComment")
    @ResponseBody
    public String editReviewComment(@RequestBody ReviewCommentTblVO vo) throws Exception
    {
        int updateCount = reviewCommentDAO.editOneReviewComment(vo);

        if (updateCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }

    @PostMapping("/replyReviewComment")
    @ResponseBody
    public String replyReviewComment(@RequestBody ReviewCommentTblVO vo) throws Exception
    {
        // sortOrder 업데이트
        reviewCommentDAO.updateSortorderDueInsert(vo);

        int insertCount = reviewCommentDAO.insertReplyComment(vo);

        if (insertCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }

    }
    

    // @PostMapping("/commentList")
    // @ResponseBody
    // public ReviewCommentMstVO commentList(@RequestBody ReviewCommentTblVO vo) throws Exception
    // {
    //     System.out.println("vo = " + vo);
    //     ReviewCommentMstVO rvCmtMstVO = new ReviewCommentMstVO();

    //     int commentCount = reviewCommentDAO.selectCommentCount(vo);
    //     System.out.println("commentCount = " + commentCount);

    //     List<ReviewCommentTblVO> cmtList = reviewCommentDAO.selectCommentList(vo);
    //     System.out.println("cmtList = " + cmtList);

    //     rvCmtMstVO.setCommentCount(commentCount);
    //     rvCmtMstVO.setCommentList(cmtList);

    //     return rvCmtMstVO;
    // }
}
