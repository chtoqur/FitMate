package com.example.demo.bookrequest;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.bookrequest.RequestVO;
import com.example.demo.reserve.ReserveTblVO;

@Repository
public class RequestDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertOneRequeset(RequestVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneRequest", vo);
    }

    public Integer selectOverlapIsbn(RequestVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOverlapIsbn", vo);
    }

    public int selectBbsRowCount() throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsRowCount");
    }
    
    public int selectBbsRowCountById(RequestVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectBbsRowCountById", vo);
    }

    public List<RequestVO> selectBbsList(RequestVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectBbsList", vo);
    }

    public int updateProcResult(RequestVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateProcResult", vo);
    }

    public Integer selectCancelRequest(RequestVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectCancelRequest", vo);
    }

}
