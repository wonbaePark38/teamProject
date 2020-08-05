package com.spring.plug.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.login.dao.UserDAO;
import com.spring.plug.login.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}


	@Override
	public UserVO getSocialUser(UserVO vo) {
		return userDAO.getSocialUser(vo);
	}


	@Override
	public String getUserEmail() {
		
		return null;
	}
	
}
