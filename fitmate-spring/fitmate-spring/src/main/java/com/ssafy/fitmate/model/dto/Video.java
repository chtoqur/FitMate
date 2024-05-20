package com.ssafy.fitmate.model.dto;

public class Video {
	private int id;
	private String title;
	private String description;
	private String thumbnail;
	private String channelName;
	private int viewCnt;
	private String youtubeVideoId;
	
	public Video() {
	}
	
	public Video(int id, String title, String description, String thumbnail, String channelName,
			String youtubeVideoId) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.thumbnail = thumbnail;
		this.channelName = channelName;
		this.youtubeVideoId = youtubeVideoId;
	}

	public Video(int id, String title, String description, String thumbnail, String channelName, int viewCnt,
			String youtubeVideoId) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.thumbnail = thumbnail;
		this.channelName = channelName;
		this.viewCnt = viewCnt;
		this.youtubeVideoId = youtubeVideoId;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getYoutubeVideoId() {
		return youtubeVideoId;
	}

	public void setYoutubeVideoId(String youtubeVideoId) {
		this.youtubeVideoId = youtubeVideoId;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", description=" + description + ", thumbnail=" + thumbnail
				+ ", channelName=" + channelName + ", viewCnt=" + viewCnt + ", youtubeVideoId=" + youtubeVideoId + "]";
	}
	
	
}
