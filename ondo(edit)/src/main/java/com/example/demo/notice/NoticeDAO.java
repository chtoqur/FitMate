package com.example.demo.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.bookrequest.RequestVO;

@Repository
public class NoticeDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int selectNoticeRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectNoticeRowCount");
    }

    public List<NoticeVO> selectNoticeList(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectNoticeList", vo);
    }

    public int insertNoticeContent(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertNoticeContent", vo);
    }

    public NoticeVO selectNoticeContent(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectNoticeContent", vo);
    }

    public int updateNoticeContent(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateNoticeContent", vo);
    }

    public int deleteNoticeContent(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteNoticeContent", vo);
    }

    public int updateViewCount(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateViewCount", vo);
    }

    public NoticeVO selectViewCount(NoticeVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectViewCount", vo);
    }

}
