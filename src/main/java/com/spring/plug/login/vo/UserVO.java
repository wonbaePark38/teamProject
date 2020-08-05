package com.spring.plug.login.vo;


public class UserVO {
	
	private String password;
	private String name;
	private String email;
	
	
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
