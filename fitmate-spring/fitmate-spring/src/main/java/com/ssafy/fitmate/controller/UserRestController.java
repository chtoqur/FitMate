package com.ssafy.fitmate.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.fitmate.model.dto.User;
import com.ssafy.fitmate.model.service.UserService;
import com.ssafy.fitmate.util.JwtUtil;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/user")
@Tag(name = "UserRestController", description = "사용자 CRUD")
//@CrossOrigin("*")
public class UserRestController {
	private static final String SUCCESS = "success";
	private static final String Fail = "fail";

	@Autowired
	private JwtUtil jwtUtil;
	private final UserService userService;

	@Autowired
	public UserRestController(UserService userService, JwtUtil jwtUtil) {
		this.userService = userService;
		this.jwtUtil = jwtUtil;
	}


	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody User user) {
//		System.out.println(user.getId());
//		System.out.println(user.getPassword());
		Map<String, Object> result = userService.authenticate(user.getId(), user.getPassword());
		HttpStatus status = result.containsKey("access-token") ? HttpStatus.ACCEPTED : HttpStatus.UNAUTHORIZED;
		return new ResponseEntity<>(result, status);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Map<String, Object>> getUserInfo(@PathVariable String id) {
		System.out.println(id);
		Map<String, Object> result = userService.getUserInfo(id);
		HttpStatus status = result.containsKey("id") ? HttpStatus.ACCEPTED : HttpStatus.UNAUTHORIZED;
	    
	    return new ResponseEntity<>(result, status);
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
	        System.out.println(fileName);
	        String fileExtension = fileName.substring(fileName.lastIndexOf(".")); // 확장자명 가져오기
	        System.out.println(fileExtension);
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
	
	@PostMapping("/{userId}/updatelikedvideos")
    public ResponseEntity<?> updateLikedVideos(@PathVariable String userId, @RequestBody Map<String, String> payload) {
        String likedVideos = payload.get("likedVideos");
        userService.updateLikedVideos(userId, likedVideos);
        return ResponseEntity.ok().body("Liked videos updated successfully.");
    }

}
