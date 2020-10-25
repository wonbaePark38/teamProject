package com.spring.plug.adminsignup.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.adminsignup.service.AdminLoginServiceImpl;
import com.spring.plug.adminsignup.vo.AdminVO;
import com.spring.plug.common.util.SHA256Util;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminLoginServiceImpl alService;
	
	@RequestMapping(value = "/adminPage/production/findPassword.do")
	public ModelAndView findPassword(AdminVO vo, ModelAndView mav) {
		AdminVO dbVO = alService.getSaltById(vo);
		if(dbVO == null) {
			System.out.println("아이디 없음");
			mav.addObject("checkId", "false");
			mav.setViewName("admin-Login.jsp");
			return mav;
		}
		
		System.out.println(dbVO.getEmail());
		try {
			alService.defaultPassword(dbVO);
			mav.addObject("findPassword", "true");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("findPassword", "false");
		}
		mav.setViewName("admin-Login.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/changePassword.do")
	public ModelAndView changePassword(@RequestParam("password") String password, @RequestParam("newpassword") String newPassword, ModelAndView mav, HttpSession session) {
		System.out.println("관리자 비밀번호 변경");
		AdminVO vo = (AdminVO) session.getAttribute("user");
		
		String dbSalt = vo.getSalt();
		String encPassword = SHA256Util.getEncrypt(password, dbSalt);
		
		if(encPassword.equals(vo.getPassword())) {
			String salt = SHA256Util.generateSalt();
			String newPW = SHA256Util.getEncrypt(newPassword, salt);
			vo.setSalt(salt);
			vo.setPassword(newPW);
			System.out.println(vo.toString());
			try {
				alService.changePassword(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.addObject("result", "true");
		} else {
			System.out.println("틀림");
			mav.addObject("result", "false");
		}
		
		mav.setViewName("changePass.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/adminLogout.do")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("/adminPage/production/admin-Login.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/adminLogin.do", method = RequestMethod.GET)
	public ModelAndView loginView(AdminVO vo, ModelAndView mav) {
		mav.setViewName("/adminPage/production/admin-Login.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/adminLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(@ModelAttribute("vo") AdminVO vo, ModelAndView mav, HttpSession session) {
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
			session.setAttribute("user", dbVO);
			mav.addObject("vo", dbVO);
			mav.setViewName("LoginSuccess.do");
		} else {
			System.out.println("비번틀림");
			mav.addObject("checkLogin", "false");
			mav.setViewName("admin-Login.jsp");
		}
		return mav;
	}
	
}
