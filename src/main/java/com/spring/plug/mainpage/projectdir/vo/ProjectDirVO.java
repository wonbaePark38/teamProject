package com.spring.plug.mainpage.projectdir.vo;

public class ProjectDirVO {
	private int projectnum;
	private String projectname;
	private String projectuser;
	private String projecttype;
	private String projectmanager;
	private String projectcontent;
	
	public int getProjectnum() {
		return projectnum;
	}
	public void setProjectnum(int projectnum) {
		this.projectnum = projectnum;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getProjectuser() {
		return projectuser;
	}
	public void setProjectuser(String projectuser) {
		this.projectuser = projectuser;
	}
	public String getProjecttype() {
		return projecttype;
	}
	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}
	public String getProjectmanager() {
		return projectmanager;
	}
	public void setProjectmanager(String projectmanager) {
		this.projectmanager = projectmanager;
	}
	
	public String getProjectcontent() {
		return projectcontent;
	}
	public void setProjectcontent(String projectcontent) {
		this.projectcontent = projectcontent;
	}
	@Override
	public String toString() {
		return "ProjectDirVO [projectname=" + projectname + ", projectuser=" + projectuser + ", projecttype="
				+ projecttype + ", projectmanager=" + projectmanager + ", projectcontent=" + projectcontent + "]";
	}
	
	
}
