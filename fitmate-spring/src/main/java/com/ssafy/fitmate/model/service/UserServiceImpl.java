package com.ssafy.fitmate.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fitmate.model.dao.UserDao;
import com.ssafy.fitmate.model.dto.User;
import com.ssafy.fitmate.util.JwtUtil;

@Service
public class UserServiceImpl implements UserService {

	private JwtUtil jwtUtil;
	private final UserDao userDao;

	@Autowired
	public UserServiceImpl(UserDao userDao, JwtUtil jwtUtil) {
		this.userDao = userDao;
		this.jwtUtil = jwtUtil;
	}

	@Override
	public int signup(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public User login(String id, String password) {
		Map<String, String> info = new HashMap<>();
		info.put("id", id);
		info.put("password", password);
		return userDao.selectOne(info);
	}
	
	@Override
    public Map<String, Object> authenticate(String id, String password) {
        User user = login(id, password);
        Map<String, Object> result = new HashMap<>();
        if (user != null) {
            String token = jwtUtil.createToken(user.getId());
            result.put("access-token", token);
            result.put("id", user.getId());
            result.put("name", user.getName());
            result.put("nickname", user.getNickname());
            result.put("email", user.getEmail());
            result.put("image", user.getImg());
            result.put("age", user.getAge());
            result.put("fitnessLevel", user.getFitnessLevel());
            result.put("postCode", user.getPostCode());
            result.put("address", user.getAddress());
            result.put("likedVideos", user.getLikedVideos());
            result.put("savedRoutine", user.getSavedRoutine());
            result.put("likedCommunity", user.getLikedCommunity());
        } else {
            result.put("message", "로그인 실패");
        }
        return result;
    }
	
	@Override
    public void updateLikedVideos(String userId, String likedVideos) {
        User user = userDao.findById(userId);
        if (user != null) {
            user.setLikedVideos(likedVideos);
            userDao.updateLikedVideos(user);
        }
    }
	
	@Override
    public void updateLikedCommunity(String userId, String likedCommunity) {
        User user = userDao.findById(userId);
        if (user != null) {
            user.setLikedCommunity(likedCommunity);
            userDao.updateLikedCommunity(user);
        }
    }

	@Override
	public void updateUserProfileImage(String userId, String imageUrl) {
        userDao.updateUserProfileImage(userId, imageUrl);
    }
	
	@Override
    public int checkIdExists(String id) {
        return userDao.checkIdExists(id);
    }
	
	@Override
	public int checkPassword(String id, String pw) {
		Map<String, String> info = new HashMap<>();
		info.put("id", id);
		info.put("password", pw);
		return userDao.checkPassword(info);
	}
	
	@Override
	public int changePassword(String id, String editPw) {
		Map<String, String> info = new HashMap<>();
		info.put("id", id);
		info.put("password", editPw);
		return userDao.changePassword(info);
	}

	@Override
	public void updateSavedRoutine(String userId, String savedRoutine) {
		User user = userDao.findById(userId);
        if (user != null) {
            user.setSavedRoutine(savedRoutine);
            userDao.updateSavedRoutine(user);
        }
	}
	
	@Override
	public Map<String, Object> getUserInfo(String id) {
		User user = userDao.findById(id);
        Map<String, Object> result = new HashMap<>();
        result.put("id", user.getId());
        result.put("name", user.getName());
        result.put("nickname", user.getNickname());
        result.put("email", user.getEmail());
        result.put("image", user.getImg());
        result.put("age", user.getAge());
        result.put("fitnessLevel", user.getFitnessLevel());
        result.put("postCode", user.getPostCode());
        result.put("address", user.getAddress());
        result.put("likedVideos", user.getLikedVideos());
        result.put("savedRoutine", user.getSavedRoutine());
        result.put("likedCommunity", user.getLikedCommunity());
        return result;
    }

	@Override
	public Map<String, Object> changeUserInfo(User user) {
		userDao.updateUser(user);
        Map<String, Object> result = new HashMap<>();
        result.put("id", user.getId());
        result.put("name", user.getName());
        result.put("nickname", user.getNickname());
        result.put("email", user.getEmail());
        result.put("image", user.getImg());
        result.put("age", user.getAge());
        result.put("fitnessLevel", user.getFitnessLevel());
        result.put("postCode", user.getPostCode());
        result.put("address", user.getAddress());
        result.put("likedVideos", user.getLikedVideos());
        result.put("savedRoutine", user.getSavedRoutine());
        result.put("likedCommunity", user.getLikedCommunity());
        return result;
	}

}
