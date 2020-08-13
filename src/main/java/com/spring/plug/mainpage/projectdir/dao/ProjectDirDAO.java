package com.spring.plug.mainpage.projectdir.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Repository
public class ProjectDirDAO {
	
	public ProjectDirDAO() {
		System.out.println("project dir DAO start");
	}
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 프로젝트 생성
	public void insertProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.projectDirInsert", vo);
	}
	
	public void insertProjectLookup(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLookup", vo);
	}
	
	public void insertProjectLocker(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLocker", vo);
	}
	
	public List<ProjectDirVO> getProjectDirTotalList(int member_id){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirTotalList",member_id);
	}
	public List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirManagerList",vo);
	}
	
	public void projectDirFavorites(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.updateProjectFavorites",vo);
	}
	
	public void getProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.selectOne("ProjectDirDAO.getProjectDir",vo);
	}
}
