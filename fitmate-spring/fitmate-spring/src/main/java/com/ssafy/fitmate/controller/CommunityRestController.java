package com.ssafy.fitmate.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.Community;
import com.ssafy.fitmate.model.dto.SearchCondition;
import com.ssafy.fitmate.model.service.CommunityService;

import io.swagger.v3.oas.annotations.Hidden;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	private final CommunityService communityService;
	
	@Autowired
	public CommunityRestController(CommunityService communityService) {
		this.communityService = communityService;
	}

	@GetMapping("")
	public ResponseEntity<?> list(@ModelAttribute SearchCondition condition) {
		List<Community> list = communityService.search(condition);

		if (list == null || list.size() == 0) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Community>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/{userId}")
	public ResponseEntity<?> myList(@ModelAttribute SearchCondition condition, @PathVariable("userId") String userId) {
		List<Community> list = communityService.mySearch(condition, userId);

		if (list == null || list.size() == 0) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Community>>(list, HttpStatus.OK);
	}

	@GetMapping("/{id}/{cnt}")
	public ResponseEntity<Community> detail(@PathVariable("id") int id, @PathVariable("cnt") int cnt) {
		Community community = communityService.readPost(id, cnt);

		return new ResponseEntity<Community>(community, HttpStatus.OK);
	}
	
	@PostMapping("")
	public ResponseEntity<Community> write(@RequestBody Community community) {
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = now.format(formatter);
        community.setRegDate(formattedDate);
		System.out.println(community);
		communityService.writePost(community);
		return new ResponseEntity<Community>(community, HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@PathVariable("id") int id, @RequestBody Community community) {
		community.setId(id);
		communityService.modifyPost(community);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// 게시글 삭제
	@Hidden
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {
		communityService.removePost(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
