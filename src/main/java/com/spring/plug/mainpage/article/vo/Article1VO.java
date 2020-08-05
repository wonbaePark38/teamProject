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
   private String writeForm2_title;
   private String writeForm2_content;
   private String writeForm2_latlng;
   
   
   // 업무
   private String workForm3_title;
   private String writeForm3_status;
   private String writeForm3_workersName;
   private String writeForm3_start_date;
   private String writeForm3_end_date;
   private String writeForm3_progress;
   private String writeForm3_order;
   private String writeForm3_content;
   
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

   // 글쓰기 2.0 get,set 끝
   

   // 업무 get,set
   public String getWorkForm3_title() {
      return workForm3_title;
   }

   public void setWorkForm3_title(String workForm3_title) {
      this.workForm3_title = workForm3_title;
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
   
   

   @Override
   public String toString() {
      return "Article1VO [workForm3_title=" + workForm3_title + ", writeForm3_status=" + writeForm3_status
            + ", writeForm3_workersName=" + writeForm3_workersName + ", writeForm3_start_date="
            + writeForm3_start_date + ", writeForm3_end_date=" + writeForm3_end_date + ", writeForm3_progress="
            + writeForm3_progress + ", writeForm3_order=" + writeForm3_order + ", writeForm3_content="
            + writeForm3_content + "]";
   }
   
   

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

}