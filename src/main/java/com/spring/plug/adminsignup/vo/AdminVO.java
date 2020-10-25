package com.spring.plug.adminsignup.vo;

public class AdminVO {

	private int seq;
	private String username;
	private String email;
	private String password;
	private String salt;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	@Override
	public String toString() {
		return "AdminVO [seq=" + seq + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", salt=" + salt + "]";
	}
	
	
	
}
