package com.spring.plug.login.vo;

import java.util.Date;

public class UserVO {
	private int seq;
	private String password;
	private String name;
	private String email;
	private String socialCompare;
	private Date joinDate;
	private String salt;
	private String authKey;
	private String authStatus;
	
	

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
		return "UserVO [password=" + password + ", name=" + name + ", email=" + email + "]";
	}
}