package com.example.demo.reserve;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.borrow.BorrowTblVO;

@Repository
public class ReserveDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public int insertOneReserve(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.insert("insertOneReserve", vo);
    }

    public int selectReserveCount(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectReserveCount", vo);
    }

    public Integer selectReserveNum(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectReserveNum", vo);
    }

    public ReserveTblVO checkReserveUser(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("checkReserveUser", vo);
    }

    public Integer deleteOneReserve(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.delete("deleteOneReserve", vo);
    }

    public ReserveTblVO selectOneReserveUser(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneReserveUser", vo);
    }

    public List<ReserveTblVO> selectRsList(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectRsList", vo);
    }

    public Integer updateSeq(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateSeq", vo);
    }

    public Integer updateAllSeq(ReserveTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("updateAllSeq", vo);
    }
}
