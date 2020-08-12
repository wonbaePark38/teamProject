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
	
	public void insertProjectDir(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.projectDirInsert", vo);
	}
	public void insertProjectLookup(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLookup", vo);
	}
	
	public void insertProjectLocker(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLocker", vo);
	}
	
	public void projectDirFavorites(ProjectDirVO vo) {
		sqlSessionTemplate.update("ProjectDirDAO.updateProjectFavorites",vo);
	}
	
	public List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirTotalList",vo);
	}
	public List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirManagerList",vo);
	}
}
