package com.spring.plug.mainpage.article.vo;

import java.sql.Date;

public class ArticleReplyVO {
	private int reply_id;
	private int member_id;
	private int project_id;
	private int article_id;
	private Date reply_regdate;
	private String reply_writer;
	private String reply_content;

	
	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public Date getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	@Override
	public String toString() {
		return "ArticleReplyVO [project_id=" + project_id + ", article_id=" + article_id + ", reply_regdate="
				+ reply_regdate + ", reply_writer=" + reply_writer + ", reply_content=" + reply_content + "]";
	}

}
