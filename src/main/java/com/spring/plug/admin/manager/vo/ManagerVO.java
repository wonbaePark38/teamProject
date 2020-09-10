package com.spring.plug.admin.manager.vo;

import java.sql.Date;

public class ManagerVO {

	private int usercount;
	private int procount;
	private String searchCondition;
	private String searchKeyword;
	private String userName;
	private String userEmail;
	private Date regDate;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getProcount() {
		return procount;
	}

	public void setProcount(int procount) {
		this.procount = procount;
	}

	public int getUsercount() {
		return usercount;
	}

	public void setUsercount(int usercount) {
		this.usercount = usercount;
	}
	
}
