package com.spring.plug.adminsignup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.adminsignup.dao.AdminLoginDAO;
import com.spring.plug.adminsignup.vo.AdminVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDAO alDAO;
	
	@Override
	public AdminVO getAdmin(AdminVO vo) {
		return alDAO.getAdmin(vo);
	}
	
	@Override
	public AdminVO getSaltById(AdminVO vo) {
		System.out.println("서비스임플 호출");
		return alDAO.getSaltById(vo);
	}

}
