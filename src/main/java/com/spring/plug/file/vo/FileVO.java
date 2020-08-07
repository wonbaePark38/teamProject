package com.spring.plug.file.vo;

public class FileVO {
	private String searchFileCondition;
	private String searchFileKeyword;
	private String projectId;
	private String fileType;
	private String fileName;
	private String writer;
	//private String user;
	
	/*public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}*/
	public String getSearchFileCondition() {
		return searchFileCondition;
	}
	public void setSearchFileCondition(String searchFileCondition) {
		this.searchFileCondition = searchFileCondition;
	}
	public String getSearchFileKeyword() {
		return searchFileKeyword;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFile_name(String fileName) {
		this.fileName = fileName;
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
				+ ", projectName=" + projectId + ", fileType=" + fileType + "]";
	}
	
	
}
