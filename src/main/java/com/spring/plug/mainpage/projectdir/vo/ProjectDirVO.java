package com.spring.plug.mainpage.projectdir.vo;

import java.sql.Date;

public class ProjectDirVO {
	
	// 프로젝트 생성 정보
	private int project_id;
	private String project_name;
	private String project_content;
	private int project_type;
	private Date createdate;
	
	// 프로젝트 조회 정보
	private int lookup_id;
	private int member_id;
	// project_id
	private int project_manager;
	private Date joindate;
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_content() {
		return project_content;
	}
	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}
	public int getProject_type() {
		return project_type;
	}
	public void setProject_type(int project_type) {
		this.project_type = project_type;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getLookup_id() {
		return lookup_id;
	}
	public void setLookup_id(int lookup_id) {
		this.lookup_id = lookup_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getProject_manager() {
		return project_manager;
	}
	public void setProject_manager(int project_manager) {
		this.project_manager = project_manager;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	@Override
	public String toString() {
		return "ProjectDirVO [project_id=" + project_id + ", project_name=" + project_name + ", project_content="
				+ project_content + ", project_type=" + project_type + ", createdate=" + createdate + ", lookup_id="
				+ lookup_id + ", member_id=" + member_id + ", project_manager=" + project_manager + ", joindate="
				+ joindate + "]";
	}

	
}
