package com.estsoft.jblog.vo;

public class CategoryVo {
	long no;
	long blogNo;
	String title;
	String desc;
	String postNo;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public long getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(long blogNo) {
		this.blogNo = blogNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	@Override
	public String toString() {
		return "CategoryVo [no=" + no + ", blogNo=" + blogNo + ", title=" + title + ", desc=" + desc + ", postNo="
				+ postNo + "]";
	}
}
