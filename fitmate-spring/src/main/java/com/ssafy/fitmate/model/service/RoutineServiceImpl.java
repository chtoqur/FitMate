package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fitmate.model.dao.RoutineDao;
import com.ssafy.fitmate.model.dto.Routine;

@Service
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
