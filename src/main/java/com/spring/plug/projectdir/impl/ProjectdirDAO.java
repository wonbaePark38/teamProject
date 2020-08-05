package com.spring.plug.projectdir.impl;

import org.apache.ibatis.session.SqlSession;

import com.spring.plug.projectdir.ProjectdirVO;
import com.spring.plug.util.SqlSessionFactoryBean;

public class ProjectdirDAO {
	private SqlSession sqlSession;
	public ProjectdirDAO() {
		sqlSession = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	public void insertProjectDir(ProjectdirVO vo) {
	}
}
