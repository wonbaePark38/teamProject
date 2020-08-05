package com.spring.plug.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.common.util.SHA256Util;
import com.spring.plug.login.service.UserServiceImpl;
import com.spring.plug.login.vo.UserVO;

@Controller
public class LoginController{
	
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public ModelAndView loginView(UserVO vo,ModelAndView mav) {
		System.out.println("로그인 화면으로 이동");
		
		mav.setViewName("login.jsp");
		return mav;
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session,HttpServletRequest request) {
		/*if(vo.getEmail() == null || vo.getEmail().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다");
		}*/
		System.out.println("로그인 시도 정보: " + vo.getEmail());
		/*
		 * 
		 * 회원 가입한 회원과 소셜 로그인 한 사람을 구분함
		 */
		if(vo.getSocialCompare()!=null) {// 소셜 로그인한 회원은 여기
			
			session.setAttribute("userEmail",vo.getEmail());
			mav.setViewName("content.jsp");
			return mav;
		}else {//회원 가입한 회원은 이쪽
			//String salt = UserDAO.getUserEmail(vo.getEmail()); 
			System.out.println("회원가입한 사람 비밀번호" + vo.getPassword());
			String encryptPassword = vo.getPassword();
			//encryptPassword = SHA256Util.getEncrypt(encryptPassword, salt);
			
			UserVO user = userService.getUser(vo);
			
			if(user!=null) {
				System.out.println("가입된 사용자 로그인 정보" + user.getName());
				session.setAttribute("userName", user.getName());
				session.setAttribute("userEmail", user.getEmail());
				mav.setViewName("content.jsp");
				
				return mav;
			}else {
				System.out.println("아이디와 비번이 틀림");
				mav.setViewName("newlogin.jsp");
				mav.addObject("status", "false");
				return mav;
			}
			
		}
		
		
		
		
		
	}
	

}
