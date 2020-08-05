package dnjswhdzld.spring.plug.client.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dnjswhdzld.spring.plug.client.UserVO;

@Repository
public class UserDAOMybatis extends SqlSessionDaoSupport {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void insertUser(UserVO vo) {
		System.out.println("===> MyBatis로 Insert 처리");
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
	}
	
}
