package com.spring.plug.mainpage.projectdir.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Repository
public class ProjectDirDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void projectDirInsert(ProjectDirVO vo) {
		System.out.println("새 프로젝트 생성");
		System.out.println("dao : "+vo.toString());
		sqlSessionTemplate.insert("ProjectDirDAO.projectDirInsert", vo);
	}
}
