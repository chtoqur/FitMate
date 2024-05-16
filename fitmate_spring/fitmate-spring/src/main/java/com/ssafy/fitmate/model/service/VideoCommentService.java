package com.ssafy.fitmate.model.service;

import java.util.List;

import com.ssafy.fitmate.model.dto.VideoComment;

public interface VideoCommentService {

	public List<VideoComment> getCommentList();
	
	public List<VideoComment> getNowVideoCommentList(int id);
	
	public void writeComment(VideoComment comment);
	
	public void modifyComment(VideoComment comment);
	
	public void removeComment(int id);
}