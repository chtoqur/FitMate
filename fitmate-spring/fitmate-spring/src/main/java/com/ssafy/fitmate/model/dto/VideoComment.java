package com.ssafy.fitmate.model.dto;

public class VideoComment {
	private int id;
	private int videoId;
	private String writer;
	private String content;
	private String regDate;
	private int parent;
	
	public VideoComment() {
	}
	
	public VideoComment(int id, int videoId, String writer, String content) {
		this.id = id;
		this.videoId = videoId;
		this.writer = writer;
		this.content = content;
	}

	public VideoComment(int id, int videoId, String writer, String content, String regDate) {
		this.id = id;
		this.videoId = videoId;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}

	public VideoComment(int id, int videoId, String writer, String content, String regDate, int parent) {
		this.id = id;
		this.videoId = videoId;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.parent = parent;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return "VideoComment [id=" + id + ", videoId=" + videoId + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", parent=" + parent + "]";
	}
	
}
