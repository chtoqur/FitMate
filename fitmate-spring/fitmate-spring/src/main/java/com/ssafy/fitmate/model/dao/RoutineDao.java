package com.ssafy.fitmate.model.dao;

import java.util.List;

import com.ssafy.fitmate.model.dto.Routine;

public interface RoutineDao {
	
	public List<Routine> selectAll();
	
//	public int insertRountine(Routine routine);
//	
//	public List<Routine> search(SearchCondition searchCondition);
//	
//	public int updateRoutine(Routine routine);
//	
//	public int deleteRoutine(int id);
}
