package com.spring.plug.mainpage.projectdir.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.projectdir.dao.ProjectLockerDAO;
import com.spring.plug.mainpage.projectdir.vo.ProjectLockerVO;

@Service
public class ProjectLockerServiceImpl implements ProjectLockerService {
	
	@Autowired
	private ProjectLockerDAO projectLockerDAO;

	public ProjectLockerServiceImpl() {
		System.out.println("project locker service");
	}
	
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
