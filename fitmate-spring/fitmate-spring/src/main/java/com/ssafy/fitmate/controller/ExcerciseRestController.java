package com.ssafy.fitmate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.Excercise;
import com.ssafy.fitmate.model.service.ExcerciseService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/excercise")
@Tag(name = "ExcerciseRestController", description = "운동 CR")
public class ExcerciseRestController {
	private final ExcerciseService excerciseService;
	
	@Autowired
	public ExcerciseRestController(ExcerciseService excerciseService) {
		this.excerciseService = excerciseService;
	}
	
	@GetMapping("/")
	public ResponseEntity<?> list() {
		List<Excercise> list = excerciseService.getList();
		
		return new ResponseEntity<List<Excercise>>(list, HttpStatus.OK);
	}
}
