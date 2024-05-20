package com.example.demo.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.borrow.BorrowTblVO;
import com.example.demo.comment.CommentTblVO;
import com.example.demo.user.UserTblVO;

@Repository
public class CommentDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertOneComment(CommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneComment", vo);
    }

    public List<CommentTblVO> selectAllComment(CommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectAllComment", vo);
    }

    public CommentTblVO selectOneCommentById(CommentTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneCommentById", vo);
    }
    
}