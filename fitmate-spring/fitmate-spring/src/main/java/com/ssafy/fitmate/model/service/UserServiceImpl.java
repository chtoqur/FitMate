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
	public List<User> getUserList() {
		return userDao.selectAll();
	}

	@Override
	public void signup(User user) {
		userDao.insertUser(user);
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
            System.out.println(user.getImg());
//            result.put("savedRoutine", user.getSavedRoutine());
        } else {
            result.put("message", "로그인 실패");
        }
        return result;
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
	public void updateSavedRoutine(User user) {
		userDao.updateSavedRoutine(user);
	}
}
