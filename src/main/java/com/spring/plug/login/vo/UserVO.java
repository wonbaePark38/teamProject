package com.spring.plug.login.vo;

import java.util.Date;

public class UserVO {
	private int seq;
	private String password;
	private String name;
	private String email;
	private String socialCompare;
	private Date joinDate;
	private String emailCheck;
	private String salt;
	private String authKey;
	private String authStatus;
	private boolean useCookie;
	private String passwordAuthKey;
	private String passwordAuthStatus;
	private String sessionId;
	private String lockSwitchStatus;
	private int lockTime;
	private String pushAlram;
	private String projectAlram;
	private String chatAlram;
	private String connectDevice;
	private String loginDate;
	
	private String connection_times;
	private String user_time;
	private String searchDay;
	
	
	
	public String getSearchDay() {
		return searchDay;
	}
	public void setSearchDay(String searchDay) {
		this.searchDay = searchDay;
	}
	public String getConnection_times() {
		return connection_times;
	}
	public void setConnection_times(String connection_times) {
		this.connection_times = connection_times;
	}
	public String getUser_time() {
		return user_time;
	}
	public void setUser_time(String user_time) {
		this.user_time = user_time;
	}
	public String getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	public String getConnectDevice() {
		return connectDevice;
	}
	public void setConnectDevice(String connectDevice) {
		this.connectDevice = connectDevice;
	}
	public String getPushAlram() {
		return pushAlram;
	}
	public void setPushAlram(String pushAlram) {
		this.pushAlram = pushAlram;
	}
	public String getProjectAlram() {
		return projectAlram;
	}
	public void setProjectAlram(String projectAlram) {
		this.projectAlram = projectAlram;
	}
	public String getChatAlram() {
		return chatAlram;
	}
	public void setChatAlram(String chatAlram) {
		this.chatAlram = chatAlram;
	}
	public String getLockSwitchStatus() {
		return lockSwitchStatus;
	}
	public void setLockSwitchStatus(String lockSwitchStatus) {
		this.lockSwitchStatus = lockSwitchStatus;
	}
	public int getLockTime() {
		return lockTime;
	}
	public void setLockTime(int lockTime) {
		this.lockTime = lockTime;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	public String getPasswordAuthStatus() {
		return passwordAuthStatus;
	}
	public void setPasswordAuthStatus(String passwordAuthStatus) {
		this.passwordAuthStatus = passwordAuthStatus;
	}
	public String getPasswordAuthKey() {
		return passwordAuthKey;
	}
	public void setPasswordAuthKey(String passwordAuthKey) {
		this.passwordAuthKey = passwordAuthKey;
	}
	public String getEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getSocialCompare() {
		return socialCompare;
	}
	public void setSocialCompare(String socialCompare) {
		this.socialCompare = socialCompare;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public String getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "UserVO [seq=" + seq + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", socialCompare=" + socialCompare + ", joinDate=" + joinDate + ", emailCheck=" + emailCheck
				+ ", salt=" + salt + ", authKey=" + authKey + ", authStatus=" + authStatus + ", useCookie=" + useCookie
				+ ", passwordAuthKey=" + passwordAuthKey + ", passwordAuthStatus=" + passwordAuthStatus + ", sessionId="
				+ sessionId + ", lockSwitchStatus=" + lockSwitchStatus + ", lockTime=" + lockTime + ", pushAlram="
				+ pushAlram + ", projectAlram=" + projectAlram + ", chatAlram=" + chatAlram + "]";
	}
	
}
