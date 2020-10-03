package com.spring.plug.mainpage.projectdir.service;

import java.util.List;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

public interface ProjectDirService {
	// 프로젝트 생성
	void insertProjectDir(ProjectDirVO vo);
	void insertProjectLookup(ProjectDirVO vo);
	void insertProjectLocker(ProjectDirVO vo);
	
	// 프로젝트 정렬
	List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo);
	List<ProjectDirVO> getLockerList(int member_id);
	List<ProjectDirVO> getProjectUserList(ProjectDirVO vo);
	
	// 프로젝트 설정
	void insertLockerList(ProjectDirVO vo);
	void updateProjectFavorites(ProjectDirVO vo);
	void updateProjectHide(ProjectDirVO vo);
	
	
	// 프로젝트 선택
	void getProjectDir(ProjectDirVO vo);
	
	// 보관함
	void updateLockerName(ProjectDirVO vo);
	void updateProjectLocker(ProjectDirVO vo);
	void deleteProjectLocker(ProjectDirVO vo);
	void deleteLocker(ProjectDirVO vo);
	
	// 로그
	public void insertProject_ConnectionLog(ProjectDirVO vo);

	// 업무 리스트
	List<ProjectDirVO> getTaskUser(ProjectDirVO vo);
}
