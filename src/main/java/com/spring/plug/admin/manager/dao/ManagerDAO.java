package com.spring.plug.admin.manager.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.admin.manager.vo.ManagerVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ManagerVO getUser() {
		System.out.println("회원수 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getUser");
	}
	
	public ManagerVO getProject() {
		System.out.println("프로젝트 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getProject");
	}
	
}
