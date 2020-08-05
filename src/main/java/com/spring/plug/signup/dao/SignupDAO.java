package com.spring.plug.signup.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.signup.vo.SignupVO;

@Repository
public class SignupDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertMember(SignupVO vo) {
		System.out.println("insert 기능 처리");
		System.out.println("dao : " + vo.toString());
		sqlSessionTemplate.insert("SignupDAO.insertMember",vo);
	}
	
}
