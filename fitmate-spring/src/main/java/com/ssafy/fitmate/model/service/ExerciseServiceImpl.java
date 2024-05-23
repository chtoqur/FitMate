package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fitmate.model.dao.ExerciseDao;
import com.ssafy.fitmate.model.dto.Exercise;

@Service
public class ExerciseServiceImpl implements ExerciseService{

	private final ExerciseDao exerciseDao;
	
	@Autowired
	public ExerciseServiceImpl(ExerciseDao exerciseDao) {
		this.exerciseDao = exerciseDao;
	}
	
	@Override
	public List<Exercise> getList() {
		return exerciseDao.selectAll();
	}

}
