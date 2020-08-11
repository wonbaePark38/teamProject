package com.spring.plug.mainpage.projectdir.vo;

import java.sql.Date;

public class ProjectDirVO {
	
	// 프로젝트 생성 정보
	private int projectnum;
	private String projectname;
	private String projectcontent;
	private String projecttype;
	private Date createdate;
	
	// 프로젝트 조회 정보
	private int lookupnum;
	private String username;
	private int projectmanager;
	private Date joindate;
	
	
	
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
	public String getProjectcontent() {
		return projectcontent;
	}
	public void setProjectcontent(String projectcontent) {
		this.projectcontent = projectcontent;
	}
	public String getProjecttype() {
		return projecttype;
	}
	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getLookupnum() {
		return lookupnum;
	}
	public void setLookupnum(int lookupnum) {
		this.lookupnum = lookupnum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getProjectmanager() {
		return projectmanager;
	}
	public void setProjectmanager(int projectmanager) {
		this.projectmanager = projectmanager;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	@Override
	public String toString() {
		return "ProjectDirVO [projectnum=" + projectnum + ", projectname=" + projectname + ", projectcontent="
				+ projectcontent + ", projecttype=" + projecttype + ", createdate=" + createdate + ", lookupnum=" + lookupnum + ", username=" + username + ", projectmanager=" + projectmanager
				+ ", joindate=" + joindate + "]";
	}
	

	
	
}
