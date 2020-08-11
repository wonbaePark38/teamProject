package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectLockerVO;

public interface ProjectDirService {
	void insertProjectDir(ProjectDirVO vo);
	void insertProjectLookup(ProjectDirVO vo);
	void getProjectDir(ProjectDirVO vo);
	List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo);
	List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo);
	
	
	
	// project locker
	void insertProjectLocker(ProjectLockerVO vo);
	void updateProjectFavorites(ProjectLockerVO vo);
	void updateProjectHide(ProjectLockerVO vo);
	void updateProjectLocker(ProjectLockerVO vo);
}
