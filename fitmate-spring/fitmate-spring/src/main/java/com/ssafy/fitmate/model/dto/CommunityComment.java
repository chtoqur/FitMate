package com.ssafy.fitmate.model.dto;

public class CommunityComment {
	private int id;
	private int communityId;
	private String writer;
	private String content;
	private String regDate;
	private int parent;
	
	public CommunityComment() {
	}
	
	public CommunityComment(int id, int communityId, String writer, String content, String regDate) {
		this.id = id;
		this.communityId = communityId;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}

	public CommunityComment(int id, int communityId, String writer, String content, String regDate, int parent) {
		this.id = id;
		this.communityId = communityId;
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

	public int getCommunityId() {
		return communityId;
	}

	public void setCommunityId(int communityId) {
		this.communityId = communityId;
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
		return "CommunityComment [id=" + id + ", communityId=" + communityId + ", writer=" + writer + ", content="
				+ content + ", regDate=" + regDate + ", parent=" + parent + "]";
	}

	
}
