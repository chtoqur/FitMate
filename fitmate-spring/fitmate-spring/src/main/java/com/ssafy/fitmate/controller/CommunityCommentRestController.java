package com.ssafy.fitmate.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.CommunityComment;
import com.ssafy.fitmate.model.service.CommunityCommentService;
import com.ssafy.fitmate.model.service.CommunityService;

@RestController
@RequestMapping("/community/comment")
public class CommunityCommentRestController {
	private final CommunityCommentService commentService;
	private final CommunityService communityService;
	
	@Autowired
	public CommunityCommentRestController(CommunityCommentService commentService, CommunityService communityService) {
		this.commentService = commentService;
		this.communityService= communityService;
	}

	@GetMapping("")
	public ResponseEntity<?> list() {
		List<CommunityComment> list = commentService.getCommentList(); // 검색 조회

		if (list == null || list.size() == 0) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CommunityComment>>(list, HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> detail(@PathVariable("id") int id) {
		List<CommunityComment> community = commentService.getNowPostCommentList(id);

		return new ResponseEntity<>(community, HttpStatus.OK);
	}

	@PostMapping("")
	public ResponseEntity<?> write(@RequestBody CommunityComment comment) {
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = now.format(formatter);
        comment.setRegDate(formattedDate);
		commentService.writeComment(comment);
		communityService.plusCommentCnt(comment.getCommunityId());
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@PathVariable("id") int id, @RequestBody CommunityComment comment) {
		comment.setId(id);
		commentService.modifyComment(comment);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

//	@Hidden
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") int id, @RequestParam int communityId) {
		System.out.println(communityId);
		commentService.removeComment(id);
		communityService.minusCommentCnt(communityId);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
