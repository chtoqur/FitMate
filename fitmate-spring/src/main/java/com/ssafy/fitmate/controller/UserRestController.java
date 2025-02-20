package com.ssafy.fitmate.controller;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.fitmate.model.dto.User;
import com.ssafy.fitmate.model.service.CommunityService;
import com.ssafy.fitmate.model.service.UserService;
import com.ssafy.fitmate.util.JwtUtil;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private JwtUtil jwtUtil;
	private final UserService userService;
	private final CommunityService communityService;

	@Autowired
	public UserRestController(UserService userService, JwtUtil jwtUtil, CommunityService communityService) {
		this.userService = userService;
		this.communityService = communityService;
		this.jwtUtil = jwtUtil;
	}

	@PostMapping("/signup")
	public ResponseEntity<?> signup(@RequestBody User user) {
		user.setLikedVideos("[]");
		user.setSavedRoutine("[]");
		user.setPassword(hashPassword(user.getPassword()));

		if (userService.signup(user) == 1) {
			return new ResponseEntity<>(HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody User user) {
		Map<String, Object> result = userService.authenticate(user.getId(), hashPassword(user.getPassword()));
		HttpStatus status = result.containsKey("access-token") ? HttpStatus.ACCEPTED : HttpStatus.UNAUTHORIZED;
		return new ResponseEntity<>(result, status);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Map<String, Object>> getUserInfo(@PathVariable String id) {
		Map<String, Object> result = userService.getUserInfo(id);
		HttpStatus status = result.containsKey("id") ? HttpStatus.ACCEPTED : HttpStatus.UNAUTHORIZED;

		return new ResponseEntity<>(result, status);
	}

	@PutMapping("")
	public ResponseEntity<Map<String, Object>> changeUserInfo(@RequestBody User user) {
		Map<String, Object> result = userService.changeUserInfo(user);
		HttpStatus status = result.containsKey("id") ? HttpStatus.ACCEPTED : HttpStatus.UNAUTHORIZED;

		return new ResponseEntity<>(result, status);
	}

	@GetMapping("/checkpw")
	public boolean checkPassword(@RequestParam String id, @RequestParam String pw) {
		pw = hashPassword(pw);
		return userService.checkPassword(id, pw) > 0;
	}

	@PutMapping("/changepw")
	public ResponseEntity<?> changePassword(@RequestBody User user) {
		user.setPassword(hashPassword(user.getPassword()));
		userService.changePassword(user.getId(), user.getPassword());
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@PostMapping("/image")
	public ResponseEntity<Map<String, Object>> uploadProfileImage(@RequestPart("file") MultipartFile file,
			@RequestPart("userId") String userId) {

		Map<String, Object> result = new HashMap<>();
		if (file.isEmpty()) {
			result.put("message", "fail");
			result.put("error", "업로드할 파일이 없습니다.");
			return ResponseEntity.badRequest().body(result);
		}

		try {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String fileExtension = fileName.substring(fileName.lastIndexOf(".")); // 확장자명 가져오기
			String newFileName = userId + fileExtension;
			Path path = Paths.get("src/main/resources/static/users/" + newFileName);
			// 디렉토리 생성
			Files.createDirectories(path.getParent());
			// 파일 저장
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			// 이미지 경로 반환
			String imageUrl = "/users/" + newFileName;
			userService.updateUserProfileImage(userId, imageUrl);
			result.put("message", "success");
			result.put("imageUrl", imageUrl);
			return ResponseEntity.ok().body(result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			result.put("message", "fail");
			result.put("error", "파일 업로드에 실패했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
		}
	}

	@GetMapping("/check/{id}")
	public boolean checkIdExists(@PathVariable String id) {
		return userService.checkIdExists(id) > 0;
	}

	@PostMapping("/{userId}/update-routine")
	public ResponseEntity<?> updateSavedRoutine(@PathVariable String userId, @RequestBody Map<String, String> payload) {
		String savedRoutine = payload.get("savedRoutine");
		userService.updateSavedRoutine(userId, savedRoutine);
		return ResponseEntity.ok().body("saved Routine updated successfully.");
	}

	@PostMapping("/{userId}/update-likedvideos")
	public ResponseEntity<?> updateLikedVideos(@PathVariable String userId, @RequestBody Map<String, String> payload) {
		String likedVideos = payload.get("likedVideos");
		userService.updateLikedVideos(userId, likedVideos);
		return ResponseEntity.ok().body("Liked videos updated successfully.");
	}

	@PostMapping("/{userId}/update-likedcommunity/{communityId}/{isPlus}")
	public ResponseEntity<?> updateLikedCommunity(@PathVariable String userId, @RequestBody Map<String, String> payload,
			@PathVariable int communityId, @PathVariable int isPlus) {
		String likedCommunity = payload.get("likedCommunity");
		userService.updateLikedCommunity(userId, likedCommunity);
		if (isPlus == 0) {
			communityService.minusLikeCnt(communityId);
		} else {
			communityService.plusLikeCnt(communityId);
		}
		return ResponseEntity.ok().body("Liked community updated successfully.");
	}

	public static String hashPassword(String password) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] encodedhash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
			return Base64.getEncoder().encodeToString(encodedhash);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Error while hashing password", e);
		}
	}
}
