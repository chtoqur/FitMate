package com.example.demo.review.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.borrow.BorrowTblVO;
import com.example.demo.review.ReviewTblVO;

@Repository
public class ReviewCommentDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int writeReviewComment(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("writeReviewComment", vo);
    }

    public int selectCommentCount(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectCommentCount", vo);
    }

    public List<ReviewCommentTblVO> selectCommentList(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectCommentList", vo);
    }

    public int deleteReviewComment(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteReviewComment", vo);
    }

    public int updateSeqDueDelete(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateSeqDueDelete", vo);
    }

    public int updateRegorderDueDelete(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateRegorderDueDelete", vo);
    }

    public int updateSortorderDueDelete(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateSortorderDueDelete", vo);
    }

    public ReviewCommentTblVO findReplyId(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("findReplyId", vo);
    }  
    
    public int editOneReviewComment(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("editOneReviewComment", vo);
    }
    
    public int insertReplyComment(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertReplyComment", vo);
    }

    public int selectMaxSeq() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectMaxSeq");
    }

    public ReviewCommentTblVO selectCommentBySeq(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectCommentBySeq", vo);
    }

    public int updateSortorderDueInsert(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateSortorderDueInsert", vo);
    }

    public int updateReplylevDueDelete(ReviewCommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateReplylevDueDelete", vo);
    }
}
