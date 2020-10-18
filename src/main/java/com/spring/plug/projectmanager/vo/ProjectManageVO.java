package com.spring.plug.projectmanager.vo;



public class ProjectManageVO {
	private String downProhibition;
	private int projectId;
	private String projectName;
	private int userId;
	private String name;
	private String companyName;
	private String department;
	private String myPosition;
	private String companyCallNumber;
	private String phoneNumber;
	private String email;
	private int writeCount;
	private int replyCount;
	private int connectionCount;
	private String searchTerm;
	private String connectionDate;
	private int accompanyCount;
	private String createDate;
	private int managerStatus;
	private int changedProjectId;
	private int lookup_id;
	private int deskCount;
	private int scheduleCount;
	private int selectMonth;
	
	public int getSelectMonth() {
		return selectMonth;
	}

	public void setSelectMonth(int selectMonth) {
		this.selectMonth = selectMonth;
	}

	public int getScheduleCount() {
		return scheduleCount;
	}

	public void setScheduleCount(int scheduleCount) {
		this.scheduleCount = scheduleCount;
	}

	public int getDeskCount() {
		return deskCount;
	}

	public void setDeskCount(int deskCount) {
		this.deskCount = deskCount;
	}

	public int getLookup_id() {
		return lookup_id;
	}

	public void setLookup_id(int lookup_id) {
		this.lookup_id = lookup_id;
	}

	public int getChangedProjectId() {
		return changedProjectId;
	}

	public void setChangedProjectId(int changedProjectId) {
		this.changedProjectId = changedProjectId;
	}

	public int getManagerStatus() {
		return managerStatus;
	}

	public void setManagerStatus(int managerStatus) {
		this.managerStatus = managerStatus;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getAccompanyCount() {
		return accompanyCount;
	}
	
	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public void setAccompanyCount(int accompanyCount) {
		this.accompanyCount = accompanyCount;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getConnectionDate() {
		return connectionDate;
	}

	public void setConnectionDate(String connectionDate) {
		this.connectionDate = connectionDate;
	}

	public String getSearchTerm() {
		return searchTerm;
	}

	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}

	public int getConnectionCount() {
		return connectionCount;
	}

	public void setConnectionCount(int connectionCount) {
		this.connectionCount = connectionCount;
	}

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
		return "ProjectManageVO [downProhibition=" + downProhibition + ", projectId=" + projectId + ", projectName="
				+ projectName + ", userId=" + userId + ", name=" + name + ", companyName=" + companyName
				+ ", department=" + department + ", myPosition=" + myPosition + ", companyCallNumber="
				+ companyCallNumber + ", phoneNumber=" + phoneNumber + ", email=" + email + ", writeCount=" + writeCount
				+ ", replyCount=" + replyCount + ", connectionCount=" + connectionCount + ", searchTerm=" + searchTerm
				+ ", connectionDate=" + connectionDate + ", accompanyCount=" + accompanyCount + ", createDate="
				+ createDate + ", managerStatus=" + managerStatus + "]";
	}

	

}
