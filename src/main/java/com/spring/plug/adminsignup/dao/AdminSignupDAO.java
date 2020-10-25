package com.spring.plug.adminsignup.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.adminsignup.vo.AdminVO;

@Repository
public class AdminSignupDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertAdmin(AdminVO vo) {
		System.out.println("Admin 회원 가입 시작");
		sqlSessionTemplate.insert("AdminSignupDAO.insertAdmin", vo);
	}
	
}
