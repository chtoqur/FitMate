package com.ssafy.fitmate.model.dao;

import java.util.List;

import com.ssafy.fitmate.model.dto.Excercise;

public interface ExcerciseDao {
	
	public List<Excercise> selectAll();
	
//	public int insertExcercise(Excercise excercise);
//	
//	public int updateExcercise(Excercise excercise);
//	
//	public int deleteExcercise(int id);
}
