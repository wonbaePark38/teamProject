package com.spring.plug.mainpage.article.vo;

public class ArticleWorkerVO {

	private int project_id;
	private int article_id;
	private String worker_name;

	
	
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

	public String getWorker_name() {
		return worker_name;
	}

	public void setWorker_name(String worker_name) {
		this.worker_name = worker_name;
	}

	@Override
	public String toString() {
		return "ArticleWorkerVO [proejct_id=" + project_id + ", article_id=" + article_id + ", worker_name="
				+ worker_name + "]";
	}

	

}
