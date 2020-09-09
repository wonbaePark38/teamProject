package com.spring.plug.log.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.log.vo.Project_ConnectionLogVO;

@Repository
public class Project_ConnectionLogDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertProjectConnectionLog(Project_ConnectionLogVO vo) {
		System.out.println("프로젝트 로그");
		
	}
}
