package com.ssafy.fitmate.model.service;

import java.util.List;

import com.ssafy.fitmate.model.dto.Video;

public interface VideoService {
	// 게시글 전체 조회
	public List<Video> getVideoList();

	// 게시글 상세조회
	public Video readVideo(int id);

	// 게시글 작성
	public void writeVideo(Video video);
}
