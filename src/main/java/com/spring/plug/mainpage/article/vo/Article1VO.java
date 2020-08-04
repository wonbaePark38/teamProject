package com.spring.plug.mainpage.article.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Article1VO {
	
	private int project_id;
	private int article_id;
	private String form_name;
	private String writeform1_content;
	private String writeform1_writer;
	private Date regDate;
	private String file_name;
	private String img_name;

	private MultipartFile writeForm1_file;
	private MultipartFile writeForm1_img;

	
	
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

	public String getWriteform1_content() {
		return writeform1_content;
	}

	public void setWriteform1_content(String writeform1_content) {
		this.writeform1_content = writeform1_content;
	}

	public String getWriteform1_writer() {
		return writeform1_writer;
	}

	public void setWriteform1_writer(String writeform1_writer) {
		this.writeform1_writer = writeform1_writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public MultipartFile getWriteForm1_file() {
		return writeForm1_file;
	}

	public void setWriteForm1_file(MultipartFile writeForm1_file) {
		this.writeForm1_file = writeForm1_file;
	}

	public MultipartFile getWriteForm1_img() {
		return writeForm1_img;
	}

	public void setWriteForm1_img(MultipartFile writeForm1_img) {
		this.writeForm1_img = writeForm1_img;
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

	@Override
	public String toString() {
		return "Article1VO [project_id=" + project_id + ", article_id=" + article_id + ", form_name=" + form_name
				+ ", writeform1_content=" + writeform1_content + ", writeform1_writer=" + writeform1_writer
				+ ", regDate=" + regDate + ", file_name=" + file_name + ", img_name=" + img_name + ", writeForm1_file="
				+ writeForm1_file + ", writeForm1_img=" + writeForm1_img + "]";
	}

	
	
	
}
