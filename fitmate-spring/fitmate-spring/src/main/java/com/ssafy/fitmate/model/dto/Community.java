package com.ssafy.fitmate.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "게시글 DTO")
public class Community {
	private int id;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int likeCnt;
	private int viewCnt;
	private String category;
	private int commentCnt;
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

	public Community(int id, String title, String content, String writer, String regDate, int likeCnt, int viewCnt,
			String category, int commentCnt, String file) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
		this.likeCnt = likeCnt;
		this.viewCnt = viewCnt;
		this.category = category;
		this.commentCnt = commentCnt;
		this.file = file;
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

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
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
		return "Community [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", likeCnt=" + likeCnt + ", viewCnt=" + viewCnt + ", category=" + category + ", commentCnt="
				+ commentCnt + ", file=" + file + "]";
	}

	

}
