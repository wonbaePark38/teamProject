package com.spring.plug.adminsignup.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.adminsignup.vo.AdminVO;

@Repository
public class AdminLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminVO getAdmin(AdminVO vo) {
		System.out.println("관리자 로그인 체크");
		return sqlSessionTemplate.selectOne("AdminSignupDAO.getAdmin", vo);
	}
	
	public AdminVO getSaltById(AdminVO vo) {
		System.out.println("-->mybatis로 소트 알아오는 기능 처리");
		return sqlSessionTemplate.selectOne("AdminSignupDAO.getSaltById", vo);
	}
	
	public void defaultPassword(AdminVO vo) {
		System.out.println("패스워드 초기화 처리");
		sqlSessionTemplate.update("AdminSignupDAO.defaultPassword", vo);
	}

	public void changePassword(AdminVO vo) {
		System.out.println("패스워드 변경 처리");
		sqlSessionTemplate.update("AdminSignupDAO.defaultPassword", vo);
	}
	
}
