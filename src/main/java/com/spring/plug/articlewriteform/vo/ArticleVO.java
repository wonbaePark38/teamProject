package com.spring.plug.articlewriteform.vo;

import org.springframework.web.multipart.MultipartFile;

public class ArticleVO {

	private int article_id;
	private String writeform1_content;
	private MultipartFile writeForm1_file;
	private MultipartFile writeForm1_img;
	
	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getWriteform1_content() {
		return writeform1_content;
	}

	public void setWriteform1_content(String writeform1_content) {
		this.writeform1_content = writeform1_content;
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

	@Override
	public String toString() {
		return "ArticleVO [article_id=" + article_id + ", writeform1_content=" + writeform1_content
				+ ", writeForm1_file=" + writeForm1_file + ", writeForm1_img=" + writeForm1_img + "]";
	}

	

	

	
	


	

}
