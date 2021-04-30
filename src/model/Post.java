package model;

import java.sql.Date;

public class Post {
	
	int id, uid;
	String page, text, uname;
	Date date;
	
	public Post(int id, int uid, String page, String text, Date date) {
		this.id = id;
		this.uid = uid;
		this.page = page;
		this.text = text;
		this.date = date;
	}
	
	public Post() {}
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "Post (id=" + id + ", uid=" + uid + ", page=" + page + ", text=" + text + ", date=" + date + ")";
	}
	
}
