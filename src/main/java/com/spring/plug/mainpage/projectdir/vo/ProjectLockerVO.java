package com.spring.plug.mainpage.projectdir.vo;

public class ProjectLockerVO {
	private int locker_id;
	private int member_id;
	private int project_id;
	private int project_favorites;
	private String project_locker;
	private int hide_locker;
	public int getLocker_id() {
		return locker_id;
	}
	public void setLocker_id(int locker_id) {
		this.locker_id = locker_id;
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
		return "project_locker [locker_id=" + locker_id + ", member_id=" + member_id + ", project_id=" + project_id
				+ ", project_favorites=" + project_favorites + ", project_locker=" + project_locker + ", hide_locker="
				+ hide_locker + "]";
	}
	
	
}
