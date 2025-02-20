package com.ssafy.fitmate.model.dto;

public class Exercise {
	private int id;
	private String name;
	private String gifSrc;
	private String description;
	private String part;
	
	public Exercise() {
	}

	public Exercise(int id, String name, String gifSrc, String description, String part) {
		this.id = id;
		this.name = name;
		this.gifSrc = gifSrc;
		this.description = description;
		this.part = part;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGifSrc() {
		return gifSrc;
	}

	public void setGifSrc(String gifSrc) {
		this.gifSrc = gifSrc;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	@Override
	public String toString() {
		return "Exercies [id=" + id + ", name=" + name + ", gifSrc=" + gifSrc + ", description=" + description
				+ ", part=" + part + "]";
	}
	
	
}
