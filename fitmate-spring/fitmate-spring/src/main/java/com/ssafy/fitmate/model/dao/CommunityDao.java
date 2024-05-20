package com.ssafy.fitmate.model.dao;

import java.util.List;

import com.ssafy.fitmate.model.dto.Community;
import com.ssafy.fitmate.model.dto.SearchCondition;

public interface CommunityDao {
	// 전체 게시글을 조회
	public List<Community> selectAll();

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

	//파일 이름, ID 등 저장
	public void insertFile(Community community);

}
