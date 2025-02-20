package com.ssafy.fitmate.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.fitmate.model.dto.User;

public interface UserService {
	//사용자 등록하기
	public int signup(User user);
	//로그인 하기
	public User login(String id, String password);
	
	Map<String, Object> authenticate(String id, String password);
	
	public void updateLikedVideos(String userId, String likedVideos);
	
	public void updateLikedCommunity(String userId, String likedCommunity);
	
	public void updateUserProfileImage(String userId, String imageUrl);
	
	public int checkIdExists(String id);
	
	public void updateSavedRoutine(String userId, String savedRoutine);
	
	public Map<String, Object> getUserInfo(String id);
	
	public int checkPassword(String id, String pw);
	
	public int changePassword(String id, String editPw);
	
	public Map<String, Object> changeUserInfo(User user);
}
