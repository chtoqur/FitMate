package com.ssafy.fitmate.model.service;

import java.util.List;

import com.ssafy.fitmate.model.dto.CommunityComment;

public interface CommunityCommentService {

	public List<CommunityComment> getCommentList();
	
	public List<CommunityComment> getNowPostCommentList(int id);
	
	public void writeComment(CommunityComment comment);
	
	public void modifyComment(CommunityComment comment);
	
	public void removeComment(int id);
}