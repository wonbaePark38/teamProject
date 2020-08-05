package com.spring.plug.login.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.login.vo.UserVO;


@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO getUser(UserVO vo) {
		System.out.println("--->MyBatis로  login 기능 처리");
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getUser",vo);
	}
	
	public UserVO getSocialUser(UserVO vo) {
		System.out.println("-->MyBatis로 소셜 login 기능 처리");
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getSocialUser",vo);
	}
	
	/*public String getUserEmail(UserVO vo) {
		System.out.println("-->MyBatis로 소셜 login 기능 처리");
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getSocialUser",vo);
	}*/
}

