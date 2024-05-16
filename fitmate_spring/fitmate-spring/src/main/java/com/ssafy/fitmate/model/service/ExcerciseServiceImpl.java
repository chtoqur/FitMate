package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.fitmate.model.dao.ExcerciseDao;
import com.ssafy.fitmate.model.dto.Excercise;

public class ExcerciseServiceImpl implements ExcerciseService{

	private final ExcerciseDao excerciseDao;
	
	@Autowired
	public ExcerciseServiceImpl(ExcerciseDao excerciseDao) {
		this.excerciseDao = excerciseDao;
	}
	
	@Override
	public List<Excercise> getList() {
		return excerciseDao.selectAll();
	}

}
