package dnjswhdzld.spring.plug.projectdir.impl;

import org.mybatis.spring.SqlSessionTemplate;

import dnjswhdzld.spring.plug.projectdir.ProjectdirVO;

public class ProjectdirDAO {
	private SqlSessionTemplate sqlSessionTemplate;
	public void insertProjectDir(ProjectdirVO vo) {
		sqlSessionTemplate.insert("ProjectdirDAO.insertProjectdirInsert",vo);
	}
}
