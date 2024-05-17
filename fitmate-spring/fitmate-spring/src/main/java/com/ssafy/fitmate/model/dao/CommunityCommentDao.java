package com.ssafy.fitmate.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssafy.fitmate.model.dto.CommunityComment;

@Repository
public interface CommunityCommentDao {

	public List<CommunityComment> selectAll();
	
	public List<CommunityComment> selectNowPost(int id);
	
	public int insertComment(CommunityComment comment);
	
	public int updateComment(CommunityComment comment);
	
	public int deleteComment(int id);
	
}
