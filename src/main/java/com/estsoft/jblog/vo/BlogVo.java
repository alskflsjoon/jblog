package com.estsoft.jblog.vo;

public class BlogVo {
	
	long no;
	String id;
	String title;
	String logo;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	@Override
	public String toString() {
		return "BlogVo [no=" + no + ", id=" + id + ", title=" + title + ", logo=" + logo + "]";
	}

}
