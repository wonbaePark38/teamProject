package com.spring.plug.client.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.plug.client.UserVO;
import com.spring.plug.common.util.SqlSessionFactoryBean;

public class UserDAO {
	private SqlSession sqlSession;
	public UserDAO() {
		System.out.println("sql conn 시작");
		sqlSession = SqlSessionFactoryBean.getSqlSessionInstance();
		System.out.println(sqlSession);
		System.out.println("sql conn 끝");
	}
	public void insertUser(UserVO vo) {
		System.out.println("insert 시작");
		sqlSession.insert("UserDAO.insertUser",vo);
		System.out.println("insert 끝");
	}
	public UserVO getUser(UserVO vo) {
		return (UserVO) sqlSession.selectList("UserDAO.getUser",vo);
	}
	public List<UserVO> getUserList(UserVO vo){
		System.out.println("리스트");
		return sqlSession.selectList("UserDAO.getUserList",vo);
	}
}
