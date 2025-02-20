package com.ssafy.fitmate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fitmate.model.dto.Video;
import com.ssafy.fitmate.model.service.VideoService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/video")
public class VideoRestController {
	private final VideoService videoService;
	
	@Autowired
	public VideoRestController(VideoService videoService) {
		this.videoService = videoService;
	}

	@GetMapping("")
	public ResponseEntity<?> list() {
		List<Video> list = videoService.getVideoList();

		if (list == null || list.size() == 0) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Video>>(list, HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Video> detail(@PathVariable("id") int id) {
		Video community = videoService.readVideo(id);

		return new ResponseEntity<Video>(community, HttpStatus.OK);
	}

	@PostMapping("")
	public ResponseEntity<?> write(@ModelAttribute Video video) {
		videoService.writeVideo(video);
		
		return new ResponseEntity<Video>(video, HttpStatus.CREATED);
	}
}
