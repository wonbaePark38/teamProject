package com.spring.plug.mainpage.article.vo;

public class ArticleWorkerVO {

	private int todo_id;
	private int article_id;
	private int member_id;
	private int project_id;
	private String worker_content;
	private String worker_date;
	private String worker_name;
	private int todo_success;
	
	public int getTodo_success() {
		return todo_success;
	}
	public void setTodo_success(int todo_success) {
		this.todo_success = todo_success;
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
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
	}
	public String getWorker_content() {
		return worker_content;
	}
	public void setWorker_content(String worker_content) {
		this.worker_content = worker_content;
	}
	public String getWorker_date() {
		return worker_date;
	}
	public void setWorker_date(String worker_date) {
		this.worker_date = worker_date;
	}
	public String getWorker_name() {
		return worker_name;
	}
	public void setWorker_name(String worker_name) {
		this.worker_name = worker_name;
	}
	
}
