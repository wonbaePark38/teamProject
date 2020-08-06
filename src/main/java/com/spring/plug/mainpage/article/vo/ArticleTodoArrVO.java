package com.spring.plug.mainpage.article.vo;

import java.util.Arrays;
import java.util.Date;


public class ArticleTodoArrVO {

	private int project_id;
	private int article_id;

	private String form_name;
	private Date regDate;
	private String writer;

	private String writeForm5_title;
	private String[] writeForm5_content;
	private String[] writeForm5_date;
	private String[] writeForm5_worker;

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

	public String getForm_name() {
		return form_name;
	}

	public void setForm_name(String form_name) {
		this.form_name = form_name;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriteForm5_title() {
		return writeForm5_title;
	}

	public void setWriteForm5_title(String writeForm5_title) {
		this.writeForm5_title = writeForm5_title;
	}

	public String[] getWriteForm5_content() {
		return writeForm5_content;
	}

	public void setWriteForm5_content(String[] writeForm5_content) {
		this.writeForm5_content = writeForm5_content;
	}

	public String[] getWriteForm5_date() {
		return writeForm5_date;
	}

	public void setWriteForm5_date(String[] writeForm5_date) {
		this.writeForm5_date = writeForm5_date;
	}

	public String[] getWriteForm5_worker() {
		return writeForm5_worker;
	}

	public void setWriteForm5_worker(String[] writeForm5_worker) {
		this.writeForm5_worker = writeForm5_worker;
	}

	@Override
	public String toString() {
		return "ArticleTodoArrVO [project_id=" + project_id + ", article_id=" + article_id + ", form_name=" + form_name
				+ ", regDate=" + regDate + ", writer=" + writer + ", writeForm5_title=" + writeForm5_title
				+ ", writeForm5_content=" + Arrays.toString(writeForm5_content) + ", writeForm5_date="
				+ Arrays.toString(writeForm5_date) + ", writeForm5_worker=" + Arrays.toString(writeForm5_worker) + "]";
	}

	
}
