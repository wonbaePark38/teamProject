package com.spring.plug.log.vo;

public class Project_ConnectionLogVO {
	private int project_connection_seq;
	private int member_id;
	private int project_id;
	private String project_connection_start;
	private String project_connection_end;
	
	public int getProject_connection_seq() {
		return project_connection_seq;
	}
	public void setProject_connection_seq(int project_connection_seq) {
		this.project_connection_seq = project_connection_seq;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getProject_connection_start() {
		return project_connection_start;
	}
	public void setProject_connection_start(String project_connection_start) {
		this.project_connection_start = project_connection_start;
	}
	public String getProject_connection_end() {
		return project_connection_end;
	}
	public void setProject_connection_end(String project_connection_end) {
		this.project_connection_end = project_connection_end;
	}
	
	
}

