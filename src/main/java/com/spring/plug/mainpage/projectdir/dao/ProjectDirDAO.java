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
	
	public void projectDirInsert(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.projectDirInsert", vo);
		System.out.println("새 프로젝트 생성");
		System.out.println("dao : "+vo.toString());
	}
	public void projectLookup(ProjectDirVO vo) {
		sqlSessionTemplate.insert("ProjectDirDAO.insertProjectLookup", vo);
		System.out.println("프로젝트 가입자 데이터 저장");
		System.out.println("dao : "+vo.toString());
	}
	
	public List<ProjectDirVO> getProjectDirTotalList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirTotalList",vo);
	}
	public List<ProjectDirVO> getProjectDirManagerList(ProjectDirVO vo){
		return sqlSessionTemplate.selectList("ProjectDirDAO.getProjectDirManagerList",vo);
	}
}
