package com.ssafy.fitmate.model.dto;

public class Routine {
	private int id;
	private String title;
	private int level;
	private String courses;
	private String part;
	
	public Routine() {
	}

	public Routine(int id, String title, int level, String courses, String part) {
		this.id = id;
		this.title = title;
		this.level = level;
		this.courses = courses;
		this.part = part;
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

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getCourses() {
		return courses;
	}

	public void setCourses(String courses) {
		this.courses = courses;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	@Override
	public String toString() {
		return "Routine [id=" + id + ", title=" + title + ", level=" + level + ", courses=" + courses + ", part=" + part
				+ "]";
	}
}
