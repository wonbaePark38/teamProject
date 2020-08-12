package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

public interface ProjectDirService {
	void insertProjectDir(ProjectDirVO vo);
	void insertProjectLookup(ProjectDirVO vo);
	void getProjectDir(ProjectDirVO vo);
	List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo);
	List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo);
	
	
	
	// project locker
	void insertProjectLocker(ProjectDirVO vo);
	void updateProjectFavorites(ProjectDirVO vo);
	void updateProjectHide(ProjectDirVO vo);
	void updateProjectLocker(ProjectDirVO vo);
}
