package com.spring.plug.mainpage.projectdir.vo;

import java.sql.Date;

public class ProjectDirVO {
	
	// 프로젝트 생성 정보
	private int project_id;
	private String project_name;
	private String project_content;
	private int project_type;
	private Date createdate;
	
	// 프로젝트 사용자 정보
	private int lookup_id;
	private int member_id;
	private int project_manager;
	private Date joindate;
	
	// 프로젝트 정보
	private int locker_id;
	private int project_favorites;
	private String project_locker;
	private int hide_locker;

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
	public int getLocker_id() {
		return locker_id;
	}
	public void setLocker_id(int locker_id) {
		this.locker_id = locker_id;
	}
	public int getProject_favorites() {
		return project_favorites;
	}
	public void setProject_favorites(int project_favorites) {
		this.project_favorites = project_favorites;
	}
	public String getProject_locker() {
		return project_locker;
	}
	public void setProject_locker(String project_locker) {
		this.project_locker = project_locker;
	}
	public int getHide_locker() {
		return hide_locker;
	}
	public void setHide_locker(int hide_locker) {
		this.hide_locker = hide_locker;
	}
	
	@Override
	public String toString() {
		return "ProjectDirVO [project_id=" + project_id + ", project_name=" + project_name + ", project_content="
				+ project_content + ", project_type=" + project_type + ", createdate=" + createdate + ", lookup_id="
				+ lookup_id + ", member_id=" + member_id + ", project_manager=" + project_manager + ", joindate="
				+ joindate + ", locker_id=" + locker_id + ", project_favorites=" + project_favorites
				+ ", project_locker=" + project_locker + ", hide_locker=" + hide_locker + "]";
	}
	
}
