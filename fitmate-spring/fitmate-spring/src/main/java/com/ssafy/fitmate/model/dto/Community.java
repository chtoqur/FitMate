package com.ssafy.fitmate.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "게시글 DTO")
public class Community {
	private int id;
	private String title;
	private String writer;
	private String content;
	private String regDate;
	private int likeCnt;
	private int viewCnt;
	private String category;
	private String file;
//	private String fileId;
//	private String fileName;
	
	public Community() {
	}

	public Community(String title, String writer, String content) {
		this.title = title;
		this.writer = writer;
		this.content = content;
	}

	public Community(int id, String title, String writer, String content, String regDate, int viewCnt, int likeCnt, String category) {
		this.id = id;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
		this.likeCnt = likeCnt;
		this.category = category;
	}
	
//	public String getFileId() {
//		return fileId;
//	}
//
//	public void setFileId(String fileId) {
//		this.fileId = fileId;
//	}
//
//	public String getFileName() {
//		return fileName;
//	}
//
//	public void setFileName(String fileName) {
//		this.fileName = fileName;
//	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Community [id=" + id + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + ", likeCnt=" + likeCnt + ", viewCnt=" + viewCnt + ", category=" + category + ", file="
				+ file + "]";
	}

}
