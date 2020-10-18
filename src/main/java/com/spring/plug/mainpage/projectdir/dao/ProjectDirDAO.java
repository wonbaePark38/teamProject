package com.spring.plug.mainpage.projectdir.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Repository
public class ProjectDirDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 프로젝트 생성
	public void insertProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.projectDirInsert", vo);
	}
	
	// 양방향 조회 테이블 생성
	public void insertProjectLookup(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLookup", vo);
	}
	
	// 프로젝트 세팅 정보 생성
	public void insertProjectLocker(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLocker", vo);
	}
	
	// 보관함 생성
	public void insertLockerList(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertLockerList",vo);
	}
	
	// 프로젝트 리스트
	public List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirTotalList",vo);
	}
	
	// 프로젝트 유저 리스트
	public List<ProjectDirVO> getProjectUserList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectUserList",vo);
	}
	
	// 보관함 리스트
	public List<ProjectDirVO> getLockerList(int member_id){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getLockerList",member_id);
	}
	
	
	
	// 프로젝트 선택
	public void getProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.selectOne("ProjectDirDAO.getProjectDir",vo);
	}
	
	// 보관함 삭제
	public void deleteLocker(ProjectDirVO vo) {
		sqlSessionTemplate.delete("ProjectDirDAO.deleteLocker",vo);
	}
	// 프로젝트에 등록 보관함 삭제
	public void deleteProjectLocker(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.deleteProjectLocker",vo);
	}
	
	// 즐겨찾기 추가
		public void projectDirFavorites(ProjectDirVO vo) {
			sqlSessionTemplate.update("ProjectDirDAO.updateProjectFavorites",vo);
	}
		
	// 보관함에 넣기
	public void projectUpdateLocker(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.updateProjectLocker",vo);
	}
	// 보관함 이름 수정
	public void updateLockerName(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.updateLockerName",vo);
	}
	
	// 프로젝트 숨기기
	public void projectUpdateHide(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.updateProjectHide",vo);
	}
	
	// 로그
	public void insertProjectConnectionLog(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProject_ConnectionLog",vo);
	}
	
	// 업무 사용자 리스트
	public List<ProjectDirVO> getTaskUser(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getTaskUser",vo);
	}
	
}
