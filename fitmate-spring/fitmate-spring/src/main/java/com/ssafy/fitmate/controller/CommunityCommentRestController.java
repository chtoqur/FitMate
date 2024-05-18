package com.ssafy.fitmate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
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

import com.ssafy.fitmate.model.dto.CommunityComment;
import com.ssafy.fitmate.model.service.CommunityCommentService;

import io.swagger.v3.oas.annotations.Hidden;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/community/comment")
@Tag(name = "CommunityCommentRestController", description = "게시판 댓글 CRUD")
public class CommunityCommentRestController {
	private final CommunityCommentService commentService;

	@Autowired
	private ResourceLoader loader;
	
	@Autowired
	public CommunityCommentRestController(CommunityCommentService commentService) {
		this.commentService = commentService;
	}

	@GetMapping("/")
	@Operation(summary = "댓글 전체 조회", description = "댓글 전체 조회 가넝")
	public ResponseEntity<?> list() {
		List<CommunityComment> list = commentService.getCommentList(); // 검색 조회

		if (list == null || list.size() == 0) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CommunityComment>>(list, HttpStatus.OK);
	}

	@GetMapping("/{videoId}")
	public ResponseEntity<?> detail(@PathVariable("videoId") int videoId) {
		List<CommunityComment> community = commentService.getNowPostCommentList(videoId);

		return new ResponseEntity<>(community, HttpStatus.OK);
	}

	@PostMapping("/")
	public ResponseEntity<?> write(@ModelAttribute CommunityComment comment) {
		commentService.writeComment(comment);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Void> update(@PathVariable("id") int id, @RequestBody CommunityComment comment) {
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

//	@PostMapping("/file1")
//	public ResponseEntity<Void> fileUpload(@RequestParam("file") MultipartFile multipartFile) throws IllegalStateException, IOException {
//
//		if (multipartFile != null && multipartFile.getSize() > 0) {
//			String fileName = multipartFile.getOriginalFilename();
//			
//			Resource resource = loader.getResource("classpath:/static/img");
//			multipartFile.transferTo(new File(resource.getFile(), fileName));
//		}
//
//		return new ResponseEntity<>(HttpStatus.OK);
//	}
	
//	@PostMapping("/file2")
//	public ResponseEntity<Void> fileUpload2(@RequestParam("file") MultipartFile multipartFile, @ModelAttribute CommunityComment community){
//		
//		commentService.filePost(multipartFile, community);
//		return new ResponseEntity<>(HttpStatus.OK);
//	}
}
