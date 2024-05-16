package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.fitmate.model.dao.CommunityCommentDao;
import com.ssafy.fitmate.model.dto.CommunityComment;

public class CommunityCommentServiceImpl implements CommunityCommentService{

	private final CommunityCommentDao commentDao;
	
	@Autowired
	public CommunityCommentServiceImpl(CommunityCommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Override
	public List<CommunityComment> getCommentList() {
		return commentDao.selectAll();
	}

	@Override
	public List<CommunityComment> getNowPostCommentList(int id) {
		return commentDao.selectNowPost(id);
	}

	@Override
	public void writeComment(CommunityComment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public void modifyComment(CommunityComment comment) {
		commentDao.updateComment(comment);
	}

	@Override
	public void removeComment(int id) {
		commentDao.deleteComment(id);
	}

}
