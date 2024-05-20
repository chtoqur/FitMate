package com.ssafy.fitmate.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.VideoComment;
import com.ssafy.fitmate.model.service.VideoCommentService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/video/comment")
@Tag(name = "VideoCommentRestController", description = "동영상 댓글 CRUD")
public class VideoCommentRestController {
	private final VideoCommentService commentService;

	@Autowired
	private ResourceLoader loader;
	
	@Autowired
	public VideoCommentRestController(VideoCommentService commentService) {
		this.commentService = commentService;
	}

	@GetMapping("")
	@Operation(summary = "댓글 전체 조회", description = "댓글 전체 조회 가넝")
	public ResponseEntity<?> list() {
		List<VideoComment> list = commentService.getCommentList(); // 검색 조회

		if (list == null || list.size() == 0) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<VideoComment>>(list, HttpStatus.OK);
	}

	@GetMapping("/{videoId}")
	public ResponseEntity<?> detail(@PathVariable("videoId") int videoId) {
		List<VideoComment> community = commentService.getNowVideoCommentList(videoId);

		return new ResponseEntity<>(community, HttpStatus.OK);
	}

	@PostMapping("")
	public ResponseEntity<?> write(@RequestBody VideoComment comment) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = now.format(formatter);
		comment.setRegDate(formattedDate);
		commentService.writeComment(comment);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@PathVariable("id") int id, @RequestBody VideoComment comment) {
		comment.setId(id);
		commentService.modifyComment(comment);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// 게시글 삭제
//	@Hidden
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {
		commentService.removeComment(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
