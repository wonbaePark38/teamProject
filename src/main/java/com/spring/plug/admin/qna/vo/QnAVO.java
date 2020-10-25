package com.spring.plug.admin.qna.vo;

import java.sql.Date;

public class QnAVO {

	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date time;
	private String searchCondition;
	private String searchKeyword;
	private String email;
	private String reply;
	private String replycontent;
	private Date replytime;
	
	
	

	public Date getReplytime() {
		return replytime;
	}

	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "QnAVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content + ", time="
				+ time + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", email="
				+ email + ", reply=" + reply + ", replycontent=" + replycontent + "]";
	}

	
	
	
}
