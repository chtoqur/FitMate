package com.ssafy.fitmate.model.dao;

import java.util.List;
import java.util.Map;

import com.ssafy.fitmate.model.dto.Community;
import com.ssafy.fitmate.model.dto.SearchCondition;

public interface CommunityDao {
	// ID에 해당하는 게시글 하나 가져오기
	public Community selectOne(int id);

	// 게시글 등록
	public int insertPost(Community community);

	// 게시글 삭제
	public int deletePost(int id);

	// 게시글 수정
	public int updatePost(Community community);

	// 조회수 증가
	public void updateViewCnt(int id);
	
	// 검색 기능
	public List<Community> search(SearchCondition searchCondition);
	
	// 검색 기능
	public List<Community> mySearch(Map<String, String> search);
	
	// 댓글수 증가
	public void plusCommentCnt(int id);
	
	// 댓글수 감소
	public void minusCommentCnt(int id);
	
	// 댓글수 증가
	public void plusLikeCnt(int id);
		
	// 댓글수 감소
	public void minusLikeCnt(int id);

}
