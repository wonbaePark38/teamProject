package com.spring.plug.projectdir;

public class ProjectdirVO {
	private String projectname;
	private int projectuser;
	private int projectmanager;
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public int getProjectuser() {
		return projectuser;
	}
	public void setProjectuser(int projectuser) {
		this.projectuser = projectuser;
	}
	public int getProjectmanager() {
		return projectmanager;
	}
	public void setProjectmanager(int projectmanager) {
		this.projectmanager = projectmanager;
	}
	@Override
	public String toString() {
		return "ProjectdirVO [projectname=" + projectname + ", projectuser=" + projectuser + ", projectmanager="
				+ projectmanager + "]";
	}
	
	
}
