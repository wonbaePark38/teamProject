package com.spring.plug.admin.qna.vo;

import java.sql.Date;

public class QnAVO {

	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date time;

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
				+ time + "]";
	}
	
	
}
