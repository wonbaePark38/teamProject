package com.spring.plug.signup.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.common.util.SHA256Util;
import com.spring.plug.signup.dao.SignupDAO;
import com.spring.plug.login.vo.UserVO;

@Service
public class SignupServiceImpl implements SignupService {
	
	@Autowired
	private SignupDAO signupDAO;
	
	@Override
	public void insertMember(UserVO vo) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		vo.setJoinDate(date); 
		String salt = SHA256Util.generateSalt();
		String password = vo.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		
		vo.setPassword(password);
		signupDAO.insertMember(vo);
	}

}
