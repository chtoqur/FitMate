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
	public List<Community> getPostList() {
		return communityDao.selectAll();
	}

	@Override
	public Community readPost(int id) {
		System.out.println(id + "번 게시글을 읽어옵니다.");
		communityDao.updateViewCnt(id);
		return communityDao.selectOne(id);
	}

	@Transactional
	@Override
	public void writePost(Community community) {
//		board.setId(1000);
		System.out.println("게시글 작성합니다.");
		communityDao.insertPost(community);
//		boardDao.insertBoard(board);
	}

	@Transactional
	@Override
	public void removePost(int id) {
		System.out.println(id+"번 게시글을 삭제하겠습니다.");
		communityDao.deletePost(id);
	}

	@Transactional
	@Override
	public void modifyPost(Community community) {
		System.out.println("게시글 수정");
		communityDao.updatePost(community);
	}

	@Override
	public List<Community> search(SearchCondition searchCondition) {
		return communityDao.search(searchCondition);
	}

	@Override
	public void filePost(MultipartFile multipartFile, Community community) {
		if (multipartFile != null && multipartFile.getSize() > 0) {
			try {
				String fileName = multipartFile.getOriginalFilename();
				String fileId = UUID.randomUUID().toString();
				
				community.setFileId(fileId);
				community.setFileName(fileName);
				
				Resource resource = resourceLoader.getResource("classpath:/static/img");
				multipartFile.transferTo(new File(resource.getFile(), fileId));
				
				communityDao.insertPost(community);
				communityDao.insertFile(community);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			
			
		}
	}

}
