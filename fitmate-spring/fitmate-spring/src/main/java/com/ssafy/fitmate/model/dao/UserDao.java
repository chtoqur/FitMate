package com.ssafy.fitmate.model.dao;

import java.util.List;
import java.util.Map;

import com.ssafy.fitmate.model.dto.User;

public interface UserDao {
	public List<User> selectAll();

	public int insertUser(User user);

	public User selectOne(Map<String, String> info);
	
	public int updateUser(User user);
	
	public int updateLikeVideos(User user);
	
//	public void deleteUser(String id);
}