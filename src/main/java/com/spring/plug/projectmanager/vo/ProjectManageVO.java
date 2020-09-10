package com.spring.plug.projectmanager.vo;

public class ProjectManageVO {
	private String downProhibition;
	private int projectId;
	
	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getDownProhibition() {
		return downProhibition;
	}

	public void setDownProhibition(String downProhibition) {
		this.downProhibition = downProhibition;
	}

	@Override
	public String toString() {
		return "ProjectManageVO [downProhibition=" + downProhibition + "]";
	}
	
	
	
}
