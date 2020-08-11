package com.spring.plug.mainpage.projectdir.service;

import com.spring.plug.mainpage.projectdir.vo.ProjectLockerVO;

public interface ProjectLockerService {
	void insertProjectLocker(ProjectLockerVO vo);
	void updateProjectFavorites(ProjectLockerVO vo);
	void updateProjectHide(ProjectLockerVO vo);
	void updateProjectLocker(ProjectLockerVO vo);
	
}
