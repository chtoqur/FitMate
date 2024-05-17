package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fitmate.model.dao.VideoCommentDao;
import com.ssafy.fitmate.model.dto.VideoComment;

@Service
public class VideoCommentServiceImpl implements VideoCommentService{

	private final VideoCommentDao commentDao;
	
	@Autowired
	public VideoCommentServiceImpl(VideoCommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	@Override
	public List<VideoComment> getCommentList() {
		return commentDao.selectAll();
	}

	@Override
	public List<VideoComment> getNowVideoCommentList(int id) {
		return commentDao.selectNowVideo(id);
	}

	@Override
	public void writeComment(VideoComment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public void modifyComment(VideoComment comment) {
		commentDao.updateComment(comment);
	}

	@Override
	public void removeComment(int id) {
		commentDao.deleteComment(id);
	}

}
