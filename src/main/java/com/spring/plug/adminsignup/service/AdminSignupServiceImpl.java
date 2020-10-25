package com.spring.plug.adminsignup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.plug.adminsignup.dao.AdminSignupDAO;
import com.spring.plug.adminsignup.vo.AdminVO;
import com.spring.plug.common.util.SHA256Util;

@Service
public class AdminSignupServiceImpl implements AdminSignupService {
	
	@Autowired
	private AdminSignupDAO asDAO;
	
	@Override
	@Transactional
	public void insertAdmin(AdminVO vo) {
		String salt = SHA256Util.generateSalt();
		String password = vo.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		vo.setSalt(salt);
		vo.setPassword(password);
		asDAO.insertAdmin(vo);
	}

}
