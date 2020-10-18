package com.spring.plug.admin.manager.vo;

import java.sql.Date;

public class ManagerVO {

	private int usercount;
	private int procount;
	private int articlecount;
	private int articletoday;
	private int protodaycount;
	private String searchCondition;
	private String searchKeyword;
	private String userName;
	private String userEmail;
	private Date regDate;
	private String startTime;
	private String endTime;
	private String searchDay;
	private String projectname;
	private int projectusercount;
	private int projectrank;
	private String createmonth;
	private int daycount;
	private String createyear;
	private int sharework;
	
	
	
	public int getSharework() {
		return sharework;
	}

	public void setSharework(int sharework) {
		this.sharework = sharework;
	}

	public String getCreateyear() {
		return createyear;
	}

	public void setCreateyear(String createyear) {
		this.createyear = createyear;
	}

	public String getCreatemonth() {
		return createmonth;
	}

	public void setCreatemonth(String createmonth) {
		this.createmonth = createmonth;
	}

	public int getDaycount() {
		return daycount;
	}

	public void setDaycount(int daycount) {
		this.daycount = daycount;
	}

	public int getProjectrank() {
		return projectrank;
	}

	public void setProjectrank(int projectrank) {
		this.projectrank = projectrank;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public int getProjectusercount() {
		return projectusercount;
	}

	public void setProjectusercount(int projectusercount) {
		this.projectusercount = projectusercount;
	}

	public int getProtodaycount() {
		return protodaycount;
	}

	public void setProtodaycount(int protodaycount) {
		this.protodaycount = protodaycount;
	}

	public int getArticletoday() {
		return articletoday;
	}

	public void setArticletoday(int articletoday) {
		this.articletoday = articletoday;
	}

	public int getArticlecount() {
		return articlecount;
	}

	public void setArticlecount(int articlecount) {
		this.articlecount = articlecount;
	}

	public String getSearchDay() {
		return searchDay;
	}

	public void setSearchDay(String searchDay) {
		this.searchDay = searchDay;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

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
