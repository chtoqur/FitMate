package com.ssafy.fitmate.model.dao;

import java.util.List;

import com.ssafy.fitmate.model.dto.Exercise;

public interface ExerciseDao {
	
	public List<Exercise> selectAll();
	
//	public int insertExcercise(Exercise exercise);
//	
//	public int updateExcercise(Exercise exercise);
//	
//	public int deleteExcercise(int id);
}
