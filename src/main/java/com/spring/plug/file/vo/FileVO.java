package com.spring.plug.file.vo;

import java.util.Date;

public class FileVO {
	private String searchFileCondition;
	private String searchFileKeyword;
	private String projectId;
	private String fileName;
	private String fileType;
	private String writer;
	private Date writeDate;
	private String targetProject;
	private String user;
	private String loginUser;
	private String projectName;
	private String fileSize;
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getTargetProject() {
		return targetProject;
	}
	public void setTargetProject(String targetProject) {
		this.targetProject = targetProject;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getSearchFileCondition() {
		return searchFileCondition;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setSearchFileCondition(String searchFileCondition) {
		this.searchFileCondition = searchFileCondition;
	}
	public String getSearchFileKeyword() {
		return searchFileKeyword;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setSearchFileKeyword(String searchFileKeyword) {
		this.searchFileKeyword = searchFileKeyword;
	}
	
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	@Override
	public String toString() {
		return "FileVO [searchFileCondition=" + searchFileCondition + ", searchFileKeyword=" + searchFileKeyword
				+ ", projectId=" + projectId + ", fileName=" + fileName + ", fileType=" + fileType + ", writer="
				+ writer + ", writeDate=" + writeDate + "]";
	}
	
	
	
	
}
