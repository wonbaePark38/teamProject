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
	public void getProjectDir(ProjectDirVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProjectDirVO> getProjectDirList(ProjectDirVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
