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
	
	public ProjectDirServiceImpl() {
		System.out.println("project dir service start");
	}
	
	@Override
	public void insertProjectDir(ProjectDirVO vo) {
		projectDirDAO.insertProjectDir(vo);
	}

	@Override
	public void insertProjectLookup(ProjectDirVO vo) {
		projectDirDAO.insertProjectLookup(vo);
	}
	
	@Override
	public void getProjectDir(ProjectDirVO vo) {
		projectDirDAO.getProjectDir(vo);
	}

	@Override
	public List<ProjectDirVO> getProjectDirTotalList(int member_id) {
		return projectDirDAO.getProjectDirTotalList(member_id);
	}


	@Override
	public List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo) {
		return projectDirDAO.getProjectDirManagerList(vo);
	}


	
	// project locker

	@Override
	public void insertProjectLocker(ProjectDirVO vo) {
		projectDirDAO.insertProjectLocker(vo);
	}

	@Override
	public void updateProjectFavorites(ProjectDirVO vo) {
		projectDirDAO.projectDirFavorites(vo);
		
	}

	@Override
	public void updateProjectHide(ProjectDirVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProjectLocker(ProjectDirVO vo) {
		// TODO Auto-generated method stub
		
	}


}
