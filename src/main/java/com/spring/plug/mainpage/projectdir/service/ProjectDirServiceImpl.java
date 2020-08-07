package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.projectdir.dao.ProjectDirDAO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Service
public class ProjectDirServiceImpl implements ProjectDirService{

	@Autowired
	private ProjectDirDAO projectDirDAO;
	
	@Override
	public void insertProjectDir(ProjectDirVO vo) {
		projectDirDAO.projectDirInsert(vo);
	}

	@Override
	public void insertProjectLookup(ProjectDirVO vo) {
		projectDirDAO.projectLookup(vo);
	}
	
	@Override
	public void getProjectDir(ProjectDirVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo) {
		return projectDirDAO.getProjectDirTotalList(vo);
	}


	@Override
	public List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo) {
		return projectDirDAO.getProjectDirManagerList(vo);
	}

}
