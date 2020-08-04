package com.spring.plug.mainpage.article.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Article1VO {

	// 공통
	private int project_id;
	private int article_id;

	private MultipartFile writeForm_file;
	private MultipartFile writeForm_img;
	private String form_name;
	private Date regDate;
	private String file_name;
	private String img_name;
	private String writer;
	
	// 글쓰기
	private String writeform1_content;

	
	//글쓰기2.0
	private String writeform2_title;
	private String writeform2_content;
	private String writeform2_latlng;
	
	// 공동 get, set
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

	public MultipartFile getWriteForm_file() {
		return writeForm_file;
	}

	public void setWriteForm_file(MultipartFile writeForm_file) {
		this.writeForm_file = writeForm_file;
	}

	public MultipartFile getWriteForm_img() {
		return writeForm_img;
	}

	public void setWriteForm_img(MultipartFile writeForm_img) {
		this.writeForm_img = writeForm_img;
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	
	// 글쓰기 get,set
	public String getWriteform1_content() {
		return writeform1_content;
	}

	public void setWriteform1_content(String writeform1_content) {
		this.writeform1_content = writeform1_content;
	}
	// 글쓰기 get,set 끝

	
	// 글쓰기 2.0 get,set
	public String getWriteform2_title() {
		return writeform2_title;
	}

	public void setWriteform2_title(String writeform2_title) {
		this.writeform2_title = writeform2_title;
	}

	public String getWriteform2_content() {
		return writeform2_content;
	}

	public void setWriteform2_content(String writeform2_content) {
		this.writeform2_content = writeform2_content;
	}

	public String getWriteform2_latlng() {
		return writeform2_latlng;
	}

	public void setWriteform2_latlng(String writeform2_latlng) {
		this.writeform2_latlng = writeform2_latlng;
	}
	// 글쓰기 2.0 get,set 끝

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
