package com.spring.plug.projectmanager.service;

import java.util.List;

import com.spring.plug.projectmanager.vo.ProjectManageVO;

public interface ProjectManageService {
	String getDownProhibition(int projectId);
	void changeDownProhibitionSetting(ProjectManageVO pmVO);
	List<ProjectManageVO> getUseStatistics(int projectId);
}
