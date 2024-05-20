package com.example.demo.overdue;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.borrow.BorrowTblVO;

@Repository
public class OverdueDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public List<OverdueTblVO> selectOverdueUser(OverdueTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectOverdueUser", vo);
    }

    
}
