package dnjswhdzld.spring.plug.projectdir.impl;

import org.apache.ibatis.session.SqlSession;

import dnjswhdzld.spring.plug.projectdir.ProjectdirVO;
import dnjswhdzld.spring.plug.util.SqlSessionFactoryBean;

public class ProjectdirDAO {
	private SqlSession sqlSession;
	public ProjectdirDAO() {
		sqlSession = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	public void insertProjectDir(ProjectdirVO vo) {
	}
}
