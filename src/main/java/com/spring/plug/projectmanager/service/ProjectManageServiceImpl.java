package com.spring.plug.projectmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.projectmanager.dao.ProjectManageDAO;
import com.spring.plug.projectmanager.vo.ProjectManageVO;

@Service
public class ProjectManageServiceImpl implements ProjectManageService{
	@Autowired
	ProjectManageDAO pmDAO;
	
	@Override
	public String getDownProhibition(int projectId) {
		return pmDAO.getDownProhibition(projectId);
	}

	@Override
	public void changeDownProhibitionSetting(ProjectManageVO pmVO) {
		pmDAO.changeDownProhibitionSetting(pmVO);
	}

	@Override
	public List<ProjectManageVO> getUseStatistics(int projectId) {
		return pmDAO.getUseStatistics(projectId);
	}

}
