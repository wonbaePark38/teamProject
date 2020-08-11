package com.spring.plug.mainpage.article.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ArticleTodoArrVO {

	 private String writeForm5_content;
	 private Date writeForm5_date;
	 private String writeForm5_worker;
	public String getWriteForm5_content() {
		return writeForm5_content;
	}
	public void setWriteForm5_content(String writeForm5_content) {
		this.writeForm5_content = writeForm5_content;
	}
	public Date getWriteForm5_date() {
		return writeForm5_date;
	}
	public void setWriteForm5_date(Date writeForm5_date) {
		this.writeForm5_date = writeForm5_date;
	}
	public String getWriteForm5_worker() {
		return writeForm5_worker;
	}
	public void setWriteForm5_worker(String writeForm5_worker) {
		this.writeForm5_worker = writeForm5_worker;
	}
	@Override
	public String toString() {
		return "ArticleTodoArrVO [writeForm5_content=" + writeForm5_content + ", writeForm5_date=" + writeForm5_date
				+ ", writeForm5_worker=" + writeForm5_worker + "]";
	}
	 
	 
	
}
