package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.dao.ProjectDirDAO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Service
public class ProjectDirServiceImpl implements ProjectDirService{

	@Autowired
	private ProjectDirDAO projectDirDAO;
	
	
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
	public List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo) {
		return projectDirDAO.getProjectDirTotalList(vo);
	}

	public List<ProjectDirVO> getLockerList(int member_id) {
		return projectDirDAO.getLockerList(member_id);
	}

	
	// project locker

	@Override
	public void insertProjectLocker(ProjectDirVO vo) {
		projectDirDAO.insertProjectLocker(vo);
	}
	@Override
	public void insertLockerList(ProjectDirVO vo) {
		projectDirDAO.insertLockerList(vo);
	}
	@Override
	public void updateProjectFavorites(ProjectDirVO vo) {
		projectDirDAO.projectDirFavorites(vo);
	}
	@Override
	public void updateProjectHide(ProjectDirVO vo) {
		projectDirDAO.projectUpdateHide(vo);
	}
	@Override
	public void updateProjectLocker(ProjectDirVO vo) {
		projectDirDAO.projectUpdateLocker(vo);
	}

	@Override
	public void deleteLocker(ProjectDirVO vo) {
		projectDirDAO.deleteLocker(vo);
	}

	@Override
	public void deleteProjectLocker(ProjectDirVO vo) {
		projectDirDAO.deleteProjectLocker(vo);
	}
	
	@Override
	public void insertProject_ConnectionLog(ProjectDirVO vo) {
		projectDirDAO.insertProjectConnectionLog(vo);
	}


	@Override
	public List<ProjectDirVO> getTaskUser(ProjectDirVO vo) {
		return projectDirDAO.getTaskUser(vo);
	}

	@Override
	public void updateLockerName(ProjectDirVO vo) {
		projectDirDAO.updateLockerName(vo);
	}

	@Override
	public  List<ProjectDirVO> getProjectUserList(ProjectDirVO vo) {
		return projectDirDAO.getProjectUserList(vo);
	}
	
}
