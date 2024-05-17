package com.ssafy.fitmate.model.dao;

import java.util.List;

import com.ssafy.fitmate.model.dto.VideoComment;

public interface VideoCommentDao {
	public List<VideoComment> selectAll();
	
	public int insertComment(VideoComment comment);
	
	public List<VideoComment> selectNowVideo(int videoId);
	
	public int updateComment(VideoComment comment);
	
	public int deleteComment(int id);
}
