package com.spring.plug.file.vo;

public class FileVO {
	private String searchFileCondition;
	private String searchFileKeyword;
	private String projectName;
	private String fileType;
	private String file_name;
	private String writer;
	
	
	public String getSearchFileCondition() {
		return searchFileCondition;
	}
	public void setSearchFileCondition(String searchFileCondition) {
		this.searchFileCondition = searchFileCondition;
	}
	public String getSearchFileKeyword() {
		return searchFileKeyword;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
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
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
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
				+ ", projectName=" + projectName + ", fileType=" + fileType + "]";
	}
	
	
}
