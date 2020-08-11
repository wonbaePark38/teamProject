package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.projectdir.dao.ProjectDirDAO;
import com.spring.plug.mainpage.projectdir.dao.ProjectLockerDAO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectLockerVO;

@Service
public class ProjectDirServiceImpl implements ProjectDirService{

	@Autowired
	private ProjectDirDAO projectDirDAO;
	@Autowired
	private ProjectLockerDAO projectLockerDAO;
	
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

	
	// project locker
	

	@Override
	public void insertProjectLocker(ProjectLockerVO vo) {
		projectLockerDAO.insertProjectLocker(vo);
	}
	
	@Override
	public void updateProjectFavorites(ProjectLockerVO vo) {
		projectLockerDAO.projectDirFavorites(vo);
	}

	@Override
	public void updateProjectHide(ProjectLockerVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProjectLocker(ProjectLockerVO vo) {
		// TODO Auto-generated method stub
		
	}
}
