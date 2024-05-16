package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.fitmate.model.dao.RoutineDao;
import com.ssafy.fitmate.model.dto.Routine;

public class RoutineServiceImpl implements RoutineService{

	private final RoutineDao routineDao;
	
	@Autowired
	public RoutineServiceImpl(RoutineDao routineDao) {
		this.routineDao = routineDao;
	}
	
	@Override
	public List<Routine> getList() {
		return routineDao.selectAll();
	}

}
