package com.ssafy.fitmate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.Routine;
import com.ssafy.fitmate.model.service.RoutineService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/routine")
public class RoutineRestController {
	private final RoutineService routineService;
	
	@Autowired
	public RoutineRestController(RoutineService routineService) {
		this.routineService = routineService;
	}
	
	@GetMapping("")
	public ResponseEntity<?> list() {
		List<Routine> list = routineService.getList();
		
		return new ResponseEntity<List<Routine>>(list, HttpStatus.OK);
	}
}
