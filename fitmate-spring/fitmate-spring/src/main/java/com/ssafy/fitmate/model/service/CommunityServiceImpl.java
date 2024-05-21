package com.ssafy.fitmate.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.fitmate.model.dao.CommunityDao;
import com.ssafy.fitmate.model.dto.Community;
import com.ssafy.fitmate.model.dto.SearchCondition;

@Service
public class CommunityServiceImpl implements CommunityService {

	private final CommunityDao communityDao;
	
	private final ResourceLoader resourceLoader;

	@Autowired
	public CommunityServiceImpl(CommunityDao communityDao, ResourceLoader resourceLoader) {
		this.communityDao = communityDao;
		this.resourceLoader = resourceLoader;
	}

	@Override
	public List<Community> search(SearchCondition condition) {
		return communityDao.search(condition);
	}

	@Override
	public Community readPost(int id) {
		communityDao.updateViewCnt(id);
		return communityDao.selectOne(id);
	}

	@Transactional
	@Override
	public void writePost(Community community) {
		communityDao.insertPost(community);
	}

	@Transactional
	@Override
	public void removePost(int id) {
		communityDao.deletePost(id);
	}

	@Transactional
	@Override
	public void modifyPost(Community community) {
		communityDao.updatePost(community);
	}
	
	@Override
	public void plusCommentCnt(int videoId) {
		communityDao.plusCommentCnt(videoId);
	}

	@Override
	public void minusCommentCnt(int videoId) {
		communityDao.minusCommentCnt(videoId);
	}
	
	@Override
	public void plusLikeCnt(int videoId) {
		communityDao.plusLikeCnt(videoId);
	}

	@Override
	public void minusLikeCnt(int videoId) {
		communityDao.minusLikeCnt(videoId);
	}
}
