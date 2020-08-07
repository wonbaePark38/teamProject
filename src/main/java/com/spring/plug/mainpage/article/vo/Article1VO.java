package com.spring.plug.mainpage.article.vo;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Article1VO {

	// 공통

	private MultipartFile writeForm_file;
	private MultipartFile writeForm_img;
	private int article_id;
	
	// 글쓰기
	private int writeForm1_project_id;

	private String writeForm1_form_name;
	private Date writeForm1_regDate;
	private String writeForm1_file_name;
	private String writeForm1_img_name;
	private String writeForm1_writer;
	private String writeForm1_content;

	// 글쓰기2.0
	private int writeForm2_project_id;
	private String writeForm2_form_name;
	private Date writeForm2_regDate;
	private String writeForm2_file_name;
	private String writeForm2_img_name;
	private String writeForm2_writer;
	private String writeForm2_title;
	private String writeForm2_content;
	private String writeForm2_latlng;

	// 업무
	private int writeForm3_project_id;
	private int writeForm3_tasknum;
	private String writeForm3_form_name;
	private Date writeForm3_regDate;
	private String writeForm3_file_name;
	private String writeForm3_img_name;
	private String writeForm3_writer;
	private String writeForm3_title;
	private String writeForm3_status;
	private String writeForm3_workersName;
	private String writeForm3_start_date;
	private String writeForm3_end_date;
	private String writeForm3_progress;
	private String writeForm3_order;
	private String writeForm3_content;

	// 일정
	private int writeForm4_project_id;
	private String writeForm4_form_name;
	private Date writeForm4_regDate;
	private String writeForm4_writer;
	private String writeForm4_title;
	private String writeForm4_start_date;
	private String writeForm4_start_time;
	private String writeForm4_end_date;
	private String writeForm4_end_time;
	private String writeForm4_alarm_time;
	private String writeForm4_content;
	private String writeForm4_latlng;

	// 할일
	private int writeForm5_project_id;
	private String writeForm5_form_name;
	private Date writeForm5_regDate;
	private String writeForm5_writer;
	private String writeForm5_title;
	private String writeForm5_content;
	private String writeForm5_date;
	private String writeForm5_worker;

	public MultipartFile getWriteForm_file() {
		return writeForm_file;
	}

	public void setWriteForm_file(MultipartFile writeForm_file) {
		this.writeForm_file = writeForm_file;
	}

	public MultipartFile getWriteForm_img() {
		return writeForm_img;
	}
	
	

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	
	

	public void setWriteForm_img(MultipartFile writeForm_img) {
		this.writeForm_img = writeForm_img;
	}

	public int getWriteForm1_project_id() {
		return writeForm1_project_id;
	}

	public void setWriteForm1_project_id(int writeForm1_project_id) {
		this.writeForm1_project_id = writeForm1_project_id;
	}


	public String getWriteForm1_form_name() {
		return writeForm1_form_name;
	}

	public void setWriteForm1_form_name(String writeForm1_form_name) {
		this.writeForm1_form_name = writeForm1_form_name;
	}

	public Date getWriteForm1_regDate() {
		return writeForm1_regDate;
	}

	public void setWriteForm1_regDate(Date writeForm1_regDate) {
		this.writeForm1_regDate = writeForm1_regDate;
	}

	public String getWriteForm1_file_name() {
		return writeForm1_file_name;
	}

	public void setWriteForm1_file_name(String writeForm1_file_name) {
		this.writeForm1_file_name = writeForm1_file_name;
	}

	public String getWriteForm1_img_name() {
		return writeForm1_img_name;
	}

	public void setWriteForm1_img_name(String writeForm1_img_name) {
		this.writeForm1_img_name = writeForm1_img_name;
	}

	public String getWriteForm1_writer() {
		return writeForm1_writer;
	}

	public void setWriteForm1_writer(String writeForm1_writer) {
		this.writeForm1_writer = writeForm1_writer;
	}

	public String getWriteForm1_content() {
		return writeForm1_content;
	}

	public void setWriteForm1_content(String writeForm1_content) {
		this.writeForm1_content = writeForm1_content;
	}

	public int getWriteForm2_project_id() {
		return writeForm2_project_id;
	}

	public void setWriteForm2_project_id(int writeForm2_project_id) {
		this.writeForm2_project_id = writeForm2_project_id;
	}


	public String getWriteForm2_form_name() {
		return writeForm2_form_name;
	}

	public void setWriteForm2_form_name(String writeForm2_form_name) {
		this.writeForm2_form_name = writeForm2_form_name;
	}

	public Date getWriteForm2_regDate() {
		return writeForm2_regDate;
	}

	public void setWriteForm2_regDate(Date writeForm2_regDate) {
		this.writeForm2_regDate = writeForm2_regDate;
	}

	public String getWriteForm2_file_name() {
		return writeForm2_file_name;
	}

	public void setWriteForm2_file_name(String writeForm2_file_name) {
		this.writeForm2_file_name = writeForm2_file_name;
	}

	public String getWriteForm2_img_name() {
		return writeForm2_img_name;
	}

	public void setWriteForm2_img_name(String writeForm2_img_name) {
		this.writeForm2_img_name = writeForm2_img_name;
	}

	public String getWriteForm2_writer() {
		return writeForm2_writer;
	}

	public void setWriteForm2_writer(String writeForm2_writer) {
		this.writeForm2_writer = writeForm2_writer;
	}

	public String getWriteForm2_title() {
		return writeForm2_title;
	}

	public void setWriteForm2_title(String writeForm2_title) {
		this.writeForm2_title = writeForm2_title;
	}

	public String getWriteForm2_content() {
		return writeForm2_content;
	}

	public void setWriteForm2_content(String writeForm2_content) {
		this.writeForm2_content = writeForm2_content;
	}

	public String getWriteForm2_latlng() {
		return writeForm2_latlng;
	}

	public void setWriteForm2_latlng(String writeForm2_latlng) {
		this.writeForm2_latlng = writeForm2_latlng;
	}

	public int getWriteForm3_project_id() {
		return writeForm3_project_id;
	}

	public void setWriteForm3_project_id(int writeForm3_project_id) {
		this.writeForm3_project_id = writeForm3_project_id;
	}


	public int getWriteForm3_tasknum() {
		return writeForm3_tasknum;
	}

	public void setWriteForm3_tasknum(int writeForm3_tasknum) {
		this.writeForm3_tasknum = writeForm3_tasknum;
	}

	public String getWriteForm3_form_name() {
		return writeForm3_form_name;
	}

	public void setWriteForm3_form_name(String writeForm3_form_name) {
		this.writeForm3_form_name = writeForm3_form_name;
	}

	public Date getWriteForm3_regDate() {
		return writeForm3_regDate;
	}

	public void setWriteForm3_regDate(Date writeForm3_regDate) {
		this.writeForm3_regDate = writeForm3_regDate;
	}

	public String getWriteForm3_file_name() {
		return writeForm3_file_name;
	}

	public void setWriteForm3_file_name(String writeForm3_file_name) {
		this.writeForm3_file_name = writeForm3_file_name;
	}

	public String getWriteForm3_img_name() {
		return writeForm3_img_name;
	}

	public void setWriteForm3_img_name(String writeForm3_img_name) {
		this.writeForm3_img_name = writeForm3_img_name;
	}

	public String getWriteForm3_writer() {
		return writeForm3_writer;
	}

	public void setWriteForm3_writer(String writeForm3_writer) {
		this.writeForm3_writer = writeForm3_writer;
	}

	public String getWriteForm3_title() {
		return writeForm3_title;
	}

	public void setWriteForm3_title(String workForm3_title) {
		this.writeForm3_title = workForm3_title;
	}

	public String getWriteForm3_status() {
		return writeForm3_status;
	}

	public void setWriteForm3_status(String writeForm3_status) {
		this.writeForm3_status = writeForm3_status;
	}

	public String getWriteForm3_workersName() {
		return writeForm3_workersName;
	}

	public void setWriteForm3_workersName(String writeForm3_workersName) {
		this.writeForm3_workersName = writeForm3_workersName;
	}

	public String getWriteForm3_start_date() {
		return writeForm3_start_date;
	}

	public void setWriteForm3_start_date(String writeForm3_start_date) {
		this.writeForm3_start_date = writeForm3_start_date;
	}

	public String getWriteForm3_end_date() {
		return writeForm3_end_date;
	}

	public void setWriteForm3_end_date(String writeForm3_end_date) {
		this.writeForm3_end_date = writeForm3_end_date;
	}

	public String getWriteForm3_progress() {
		return writeForm3_progress;
	}

	public void setWriteForm3_progress(String writeForm3_progress) {
		this.writeForm3_progress = writeForm3_progress;
	}

	public String getWriteForm3_order() {
		return writeForm3_order;
	}

	public void setWriteForm3_order(String writeForm3_order) {
		this.writeForm3_order = writeForm3_order;
	}

	public String getWriteForm3_content() {
		return writeForm3_content;
	}

	public void setWriteForm3_content(String writeForm3_content) {
		this.writeForm3_content = writeForm3_content;
	}

	public int getWriteForm4_project_id() {
		return writeForm4_project_id;
	}

	public void setWriteForm4_project_id(int writeForm4_project_id) {
		this.writeForm4_project_id = writeForm4_project_id;
	}


	public String getWriteForm4_form_name() {
		return writeForm4_form_name;
	}

	public void setWriteForm4_form_name(String writeForm4_form_name) {
		this.writeForm4_form_name = writeForm4_form_name;
	}

	public Date getWriteForm4_regDate() {
		return writeForm4_regDate;
	}

	public void setWriteForm4_regDate(Date writeForm4_regDate) {
		this.writeForm4_regDate = writeForm4_regDate;
	}

	public String getWriteForm4_writer() {
		return writeForm4_writer;
	}

	public void setWriteForm4_writer(String writeForm4_writer) {
		this.writeForm4_writer = writeForm4_writer;
	}

	public String getWriteForm4_title() {
		return writeForm4_title;
	}

	public void setWriteForm4_title(String writeForm4_title) {
		this.writeForm4_title = writeForm4_title;
	}

	public String getWriteForm4_start_date() {
		return writeForm4_start_date;
	}

	public void setWriteForm4_start_date(String writeForm4_start_date) {
		this.writeForm4_start_date = writeForm4_start_date;
	}

	public String getWriteForm4_start_time() {
		return writeForm4_start_time;
	}

	public void setWriteForm4_start_time(String writeForm4_start_time) {
		this.writeForm4_start_time = writeForm4_start_time;
	}

	public String getWriteForm4_end_date() {
		return writeForm4_end_date;
	}

	public void setWriteForm4_end_date(String writeForm4_end_date) {
		this.writeForm4_end_date = writeForm4_end_date;
	}

	public String getWriteForm4_end_time() {
		return writeForm4_end_time;
	}

	public void setWriteForm4_end_time(String writeForm4_end_time) {
		this.writeForm4_end_time = writeForm4_end_time;
	}

	public String getWriteForm4_alarm_time() {
		return writeForm4_alarm_time;
	}

	public void setWriteForm4_alarm_time(String writeForm4_alarm_time) {
		this.writeForm4_alarm_time = writeForm4_alarm_time;
	}

	public String getWriteForm4_content() {
		return writeForm4_content;
	}

	public void setWriteForm4_content(String writeForm4_content) {
		this.writeForm4_content = writeForm4_content;
	}

	public String getWriteForm4_latlng() {
		return writeForm4_latlng;
	}

	public void setWriteForm4_latlng(String writeForm4_latlng) {
		this.writeForm4_latlng = writeForm4_latlng;
	}

	public int getWriteForm5_project_id() {
		return writeForm5_project_id;
	}

	public void setWriteForm5_project_id(int writeForm5_project_id) {
		this.writeForm5_project_id = writeForm5_project_id;
	}


	public String getWriteForm5_form_name() {
		return writeForm5_form_name;
	}

	public void setWriteForm5_form_name(String writeForm5_form_name) {
		this.writeForm5_form_name = writeForm5_form_name;
	}

	public Date getWriteForm5_regDate() {
		return writeForm5_regDate;
	}

	public void setWriteForm5_regDate(Date writeForm5_regDate) {
		this.writeForm5_regDate = writeForm5_regDate;
	}

	public String getWriteForm5_writer() {
		return writeForm5_writer;
	}

	public void setWriteForm5_writer(String writeForm5_writer) {
		this.writeForm5_writer = writeForm5_writer;
	}

	public String getWriteForm5_title() {
		return writeForm5_title;
	}

	public void setWriteForm5_title(String writeForm5_title) {
		this.writeForm5_title = writeForm5_title;
	}

	public String getWriteForm5_content() {
		return writeForm5_content;
	}

	public void setWriteForm5_content(String writeForm5_content) {
		this.writeForm5_content = writeForm5_content;
	}

	public String getWriteForm5_date() {
		return writeForm5_date;
	}

	public void setWriteForm5_date(String writeForm5_date) {
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
		return "Article1VO [writeForm4_regDate=" + writeForm4_regDate + ", writeForm4_writer=" + writeForm4_writer
				+ ", writeForm4_title=" + writeForm4_title + ", writeForm4_start_date=" + writeForm4_start_date
				+ ", writeForm4_start_time=" + writeForm4_start_time + ", writeForm4_end_date=" + writeForm4_end_date
				+ ", writeForm4_end_time=" + writeForm4_end_time + ", writeForm4_alarm_time=" + writeForm4_alarm_time
				+ ", writeForm4_content=" + writeForm4_content + ", writeForm4_latlng=" + writeForm4_latlng + "]";
	}

	
	
	
	
	
}