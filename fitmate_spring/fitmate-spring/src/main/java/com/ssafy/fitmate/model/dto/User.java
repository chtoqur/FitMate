package com.ssafy.fitmate.model.dto;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private int age;
	private String fitnessLevel;
	private String postCode;
	private String address;
	private List<Integer> likedVideos;

	public User() {
	}
	
	public User(String id, String password, String name, String nickname, String email, int age, String fitnessLevel,
			String postCode, String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.age = age;
		this.fitnessLevel = fitnessLevel;
		this.postCode = postCode;
		this.address = address;
		this.likedVideos = new ArrayList<>();
	}


	public User(String id, String password, String name, String nickname, String email, int age, String fitnessLevel,
			String postCode, String address, List<Integer> likedVideos) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.age = age;
		this.fitnessLevel = fitnessLevel;
		this.postCode = postCode;
		this.address = address;
		this.likedVideos = likedVideos;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getFitnessLevel() {
		return fitnessLevel;
	}

	public void setFitnessLevel(String fitnessLevel) {
		this.fitnessLevel = fitnessLevel;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Integer> getLikedVideos() {
		return likedVideos;
	}

	public void setLikedVideos(List<Integer> likedVideos) {
		this.likedVideos = likedVideos;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", age=" + age + ", fitnessLevel=" + fitnessLevel + ", postCode=" + postCode + ", address="
				+ address + ", likedVideos=" + likedVideos + "]";
	}
}
