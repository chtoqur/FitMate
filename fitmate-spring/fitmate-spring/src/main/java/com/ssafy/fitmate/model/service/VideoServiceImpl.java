package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fitmate.model.dao.VideoDao;
import com.ssafy.fitmate.model.dto.Video;

@Service
public class VideoServiceImpl implements VideoService{

	private final VideoDao videoDao;
	
	@Autowired
	public VideoServiceImpl(VideoDao videoDao) {
		this.videoDao = videoDao;
	}
	
	@Override
	public List<Video> getVideoList() {
		return videoDao.selectAll();
	}

	@Override
	public Video readVideo(int id) {
		return videoDao.selectOne(id);
	}

	@Override
	public void writeVideo(Video video) {
		videoDao.insertVideo(video);
	}

}
