package com.spring.plug.adminsignup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.adminsignup.service.AdminLoginServiceImpl;
import com.spring.plug.adminsignup.vo.AdminVO;
import com.spring.plug.common.util.SHA256Util;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminLoginServiceImpl alService;
	
	@RequestMapping(value = "/adminPage/production/adminLogout.do")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("/adminPage/production/admin-Login.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/adminLogin.do", method = RequestMethod.GET)
	public ModelAndView loginView(AdminVO vo,ModelAndView mav) {
		mav.setViewName("/adminPage/production/admin-Login.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/adminLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(AdminVO vo, ModelAndView mav, HttpSession session) {
		System.out.println(vo.getUsername());
		AdminVO dbVO = alService.getSaltById(vo);			
		System.out.println(dbVO);
		
		if(dbVO == null) {
			System.out.println("아이디 없음");
			mav.addObject("checkId", "false");
			mav.setViewName("admin-Login.jsp");
			return mav;
		}
		
		String dbSalt = dbVO.getSalt();
		String encPassword = SHA256Util.getEncrypt(vo.getPassword(), dbSalt);
		vo.setPassword(encPassword);
		
		if(dbVO.getPassword().equals(vo.getPassword())) {
			System.out.println("비번 맞음");
			session.setAttribute("userEmail", vo.getEmail());
			session.setAttribute("userName", vo.getUsername());
			mav.addObject("vo", vo);
			mav.setViewName("admin-Main.jsp");
		} else {
			System.out.println("비번틀림");
			mav.addObject("checkLogin", "false");
			mav.setViewName("admin-Login.jsp");
		}
		return mav;
	}
	
}
