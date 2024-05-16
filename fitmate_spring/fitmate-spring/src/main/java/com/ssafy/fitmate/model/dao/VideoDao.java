package com.ssafy.fitmate.model.dao;

import java.util.List;

import com.ssafy.fitmate.model.dto.Video;

public interface VideoDao {
	public List<Video> selectAll();
	
	public Video selectOne(int id);
	
	public int insertVideo(Video video);
	
//	public void updateVideo(Video video);
	
//	public void deleteVideo(int id);
	
//	public List<Video> search(SearchCondition searchCondition);
}
