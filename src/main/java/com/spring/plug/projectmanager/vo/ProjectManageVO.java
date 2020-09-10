package com.spring.plug.projectmanager.vo;

public class ProjectManageVO {
	private String downProhibition;
	private int projectId;
	private int userId;
	private String name;
	private String companyName;
	private String department;
	private String myPosition;
	private String companyCallNumber;
	private String email;
	private int writeCount;
	private int replyCount;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getMyPosition() {
		return myPosition;
	}

	public void setMyPosition(String myPosition) {
		this.myPosition = myPosition;
	}

	public String getCompanyCallNumber() {
		return companyCallNumber;
	}

	public void setCompanyCallNumber(String companyCallNumber) {
		this.companyCallNumber = companyCallNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getWriteCount() {
		return writeCount;
	}

	public void setWriteCount(int writeCount) {
		this.writeCount = writeCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getDownProhibition() {
		return downProhibition;
	}

	public void setDownProhibition(String downProhibition) {
		this.downProhibition = downProhibition;
	}

	@Override
	public String toString() {
		return "ProjectManageVO [downProhibition=" + downProhibition + ", projectId=" + projectId + ", userId=" + userId
				+ ", name=" + name + ", companyName=" + companyName + ", department=" + department + ", myPosition="
				+ myPosition + ", companyCallNumber=" + companyCallNumber + ", email=" + email + ", writeCount="
				+ writeCount + ", replyCount=" + replyCount + "]";
	}



}
