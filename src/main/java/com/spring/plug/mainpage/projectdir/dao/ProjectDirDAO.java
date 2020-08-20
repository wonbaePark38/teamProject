package com.spring.plug.mainpage.projectdir.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Repository
public class ProjectDirDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 프로젝트 생성
	public void insertProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.projectDirInsert", vo);
	}
	
	// 양방향 조회 테이블
	public void insertProjectLookup(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLookup", vo);
	}
	
	// 프로젝트 세팅 정보
	public void insertProjectLocker(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLocker", vo);
	}
	
	// 보관함 생성
	public void insertLockerList(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertLockerList",vo);
	}
	
	// 프로젝트 리스트
	public List<ProjectDirVO> getProjectDirTotalList(int member_id){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirTotalList",member_id);
	}

	// 보관함 리스트
	public List<ProjectDirVO> getLockerList(int member_id){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getLockerList",member_id);
	}
	
	// 즐겨찾기 추가
	public void projectDirFavorites(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.updateProjectFavorites",vo);
	}
	
	// 프로젝트 선택
	public void getProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.selectOne("ProjectDirDAO.getProjectDir",vo);
	}
	
	public void deleteLocker(ProjectDirVO vo) {
		sqlSessionTemplate.delete("ProjectDirDAO.deleteLocker",vo);
	}
}
