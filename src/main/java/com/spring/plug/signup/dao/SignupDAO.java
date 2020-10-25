package com.spring.plug.signup.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.login.vo.UserVO;

@Repository
public class SignupDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertMember(UserVO vo) {
		System.out.println("dao : " + vo.toString());
		sqlSessionTemplate.insert("SignupDAO.insertMember", vo);
	}
	
	public void updateAuthkey(UserVO vo) {
		sqlSessionTemplate.update("SignupDAO.updateAuthkey", vo);
	}

	public UserVO selectAuthkey(UserVO vo) {
		return sqlSessionTemplate.selectOne("SignupDAO.selectAuthkey", vo);
	}

	public void updateAuthstatus(UserVO vo) {
		sqlSessionTemplate.update("SignupDAO.updateAuthstatus", vo);
	}
	
	public void addUserInfo(UserVO vo) {
		sqlSessionTemplate.update("SignupDAO.addUserInfo", vo);
	}
	
}
