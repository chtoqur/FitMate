package com.ssafy.fitmate.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ssafy.fitmate.model.dto.Community;
import com.ssafy.fitmate.model.dto.SearchCondition;

public interface CommunityService {
	// 게시글 상세조회
	public Community readPost(int id);

	// 게시글 작성
	public void writePost(Community community);

	/// 게시글 삭제
	public void removePost(int id);

	// 게시글 수정
	public void modifyPost(Community community);

	// 게시글 검색
	public List<Community> search(SearchCondition searchCondition);
	
	// 댓글수 증가
	public void plusCommentCnt(int videoId);
	
	// 댓글수 감소
	public void minusCommentCnt(int videoId);
	
	// 좋아요수 증가
	public void plusLikeCnt(int videoId);
		
	// 좋아요수 감소
	public void minusLikeCnt(int videoId);
}
