package com.ssafy.fitmate.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.fitmate.model.dto.User;

public interface UserService {
	//전체 사용자 목록 불러오기
	public List<User> getUserList();
	//사용자 등록하기
	public void signup(User user);
	//로그인 하기
	public User login(String id, String password);
	
	Map<String, Object> authenticate(String id, String password);
	
	public void updateLikedVideos(String userId, String likedVideos);
	
	public void updateUserProfileImage(String userId, String imageUrl);
	
	public int checkIdExists(String id);
	
	public void updateSavedRoutine(User user);
	
	public Map<String, Object> getUserInfo(String id);
}
