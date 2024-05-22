package com.ssafy.fitmate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.Exercise;
import com.ssafy.fitmate.model.service.ExerciseService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/excercise")
public class ExerciseRestController {
	private final ExerciseService exerciseService;
	
	@Autowired
	public ExerciseRestController(ExerciseService exerciseService) {
		this.exerciseService = exerciseService;
	}
	
	@GetMapping("")
	public ResponseEntity<?> list() {
		List<Exercise> list = exerciseService.getList();
		
		return new ResponseEntity<List<Exercise>>(list, HttpStatus.OK);
	}
}
