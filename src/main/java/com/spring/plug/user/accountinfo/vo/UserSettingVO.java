package com.spring.plug.user.accountinfo.vo;

import org.springframework.web.multipart.MultipartFile;

public class UserSettingVO {
	private int id;
	private String name;
	private String email;
	private String changePassword;
	private String phoneNumber;
	private String companyName;
	private String department;
	private String myPosition;
	private String companyCallNumber;
	private String profileFileName;
	private String connectDevice;
	private String loginDate;
	
	public String getConnectDevice() {
		return connectDevice;
	}
	public void setConnectDevice(String connectDevice) {
		this.connectDevice = connectDevice;
	}
	public String getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	
	private MultipartFile profileImg;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProfileFileName() {
		return profileFileName;
	}
	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}
	public String getName() {
		return name;
	}
	public MultipartFile getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	public String getChangePassword() {
		return changePassword;
	}
	public void setChangePassword(String changePassword) {
		this.changePassword = changePassword;
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
	@Override
	public String toString() {
		return "UserSettingVO [id=" + id + ", name=" + name + ", email=" + email + ", changePassword=" + changePassword
				+ ", phoneNumber=" + phoneNumber + ", companyName=" + companyName + ", department=" + department
				+ ", myPosition=" + myPosition + ", companyCallNumber=" + companyCallNumber + ", profileFileName="
				+ profileFileName + ", lockSwitchStatus=" + ", lockTime="
				+ ", profileImg=" + profileImg + "]";
	}
	
	
}
