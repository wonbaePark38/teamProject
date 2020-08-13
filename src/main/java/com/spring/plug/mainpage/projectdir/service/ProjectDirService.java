package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

public interface ProjectDirService {
	// 프로젝트 생성
	void insertProjectDir(ProjectDirVO vo);
	void insertProjectLookup(ProjectDirVO vo);
	void insertProjectLocker(ProjectDirVO vo);
	
	// 프로젝트 정렬
	List<ProjectDirVO> getProjectDirTotalList(int member_id);
	List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo);
	
	// 프로젝트 설정
	void updateProjectFavorites(ProjectDirVO vo);
	void updateProjectHide(ProjectDirVO vo);
	void updateProjectLocker(ProjectDirVO vo);

	// 프로젝트 선택
	void getProjectDir(ProjectDirVO vo);
}
