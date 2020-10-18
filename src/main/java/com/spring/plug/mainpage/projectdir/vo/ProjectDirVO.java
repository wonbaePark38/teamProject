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
	private String member_name;
	
	// 프로젝트 정렬 세팅
	private String viewType;
	
	// 프로젝트 정보
	private int locker_id;
	private int project_favorites;
	private String project_locker;
	private String locker_change;
	
	private int hide_locker;
	private int project_user;
	private int joinuser;
	// 보관함 리스트
	private int locker_list_id;
	private String locker_name;
	
	// 리스트
	private String project_id_list;
	
	
	public String getLocker_change() {
		return locker_change;
	}
	public void setLocker_change(String locker_change) {
		this.locker_change = locker_change;
	}
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
	public int getProject_user() {
		return project_user;
	}
	public void setProject_user(int project_user) {
		this.project_user = project_user;
	}
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	public int getLocker_list_id() {
		return locker_list_id;
	}
	public void setLocker_list_id(int locker_list_id) {
		this.locker_list_id = locker_list_id;
	}
	public String getLocker_name() {
		return locker_name;
	}
	public void setLocker_name(String locker_name) {
		this.locker_name = locker_name;
	}
	public int getJoinuser() {
		return joinuser;
	}
	public void setJoinuser(int joinuser) {
		this.joinuser = joinuser;
	}
	
	public String getProject_id_list() {
		return project_id_list;
	}
	public void setProject_id_list(String project_id_list) {
		this.project_id_list = project_id_list;
	}
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}
