package com.ssafy.fitmate.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.User;
import com.ssafy.fitmate.util.JwtUtil;

@RestController
@RequestMapping("/api-board")
//@CrossOrigin("*")
public class UserRestController {
	private static final String SUCCESS = "success";
	private static final String Fail = "fail";
	
	@Autowired
	private JwtUtil jwtUtil;
	
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody User user){
		Map<String, Object> result = new HashMap<>();
		HttpStatus status = null;
		
		if(user.getId() != null) {
			result.put("message", SUCCESS);
			result.put("access-token", jwtUtil.createToken(user.getId()));
			status = HttpStatus.ACCEPTED;
		} else {
			status = HttpStatus.NO_CONTENT;
		}
		
		return new ResponseEntity<>(result, status);
	}
}
