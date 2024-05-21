package com.ssafy.fitmate.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ssafy.fitmate.model.dto.User;

public interface UserDao {
	public List<User> selectAll();

	public int insertUser(User user);

	public User selectOne(Map<String, String> info);

	public int updateUser(User user);

	public int updateLikedVideos(User user);
	
	public int updateLikedCommunity(User user);
	
	public void updateSavedRoutine(User user);

	public void updateUserProfileImage(@Param("userId") String userId, @Param("imageUrl") String imageUrl);

	public int checkIdExists(String id);
	
	public User findById(String userId);
	
	public int checkPassword(Map<String, String> info);
	
	public int changePassword(Map<String, String> info);
	
//	public void deleteUser(String id);
}