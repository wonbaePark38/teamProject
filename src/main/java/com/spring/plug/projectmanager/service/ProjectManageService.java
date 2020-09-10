package com.spring.plug.projectmanager.service;

import com.spring.plug.projectmanager.vo.ProjectManageVO;

public interface ProjectManageService {
	String getDownProhibition(int projectId);
	void changeDownProhibitionSetting(ProjectManageVO pmVO);
}
