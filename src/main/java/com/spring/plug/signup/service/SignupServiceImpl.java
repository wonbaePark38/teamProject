package com.spring.plug.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.common.util.SHA256Util;
import com.spring.plug.signup.dao.SignupDAO;
import com.spring.plug.signup.vo.SignupVO;

@Service
public class SignupServiceImpl implements SignupService {
	
	@Autowired
	private SignupDAO signupDAO;
	
	@Override
	public void insertMember(SignupVO vo) {
		String salt = SHA256Util.generateSalt();
		vo.setSalt(salt);
		
		String password = vo.getUserPw();
		password = SHA256Util.getEncrypt(password, salt);
		
		vo.setUserPw(password);
		signupDAO.insertMember(vo);
	}

}
