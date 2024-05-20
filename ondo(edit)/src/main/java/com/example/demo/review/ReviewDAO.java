package com.example.demo.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int selectReviewRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectReviewRowCount");
    }
    public List<ReviewTblVO> selectReviewList(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectReviewList", vo);
    }

    public ReviewTblVO selectReviewContent(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectReviewContent", vo);
    }

    public int updateReviewContent(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateReviewContent", vo);
    }

    public int insertOneReview(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneReview", vo);
    }

    public int deleteOneReview(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteOneReview", vo);
    }

    public int updateReviewSeq(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateReviewSeq", vo);
    }

    public List<ReviewTblVO> selectAllReview(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectAllReview", vo);
    }

    public int updateViewCount(ReviewTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateViewCount", vo);
    }
    
}
