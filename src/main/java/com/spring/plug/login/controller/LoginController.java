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
//회원가입을 직접 한 사람들이 로그인 시도 했을때의 컨트롤러
@Controller
public class LoginController{
	
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public ModelAndView loginView(UserVO vo,ModelAndView mav) {
		mav.setViewName("newlogin.jsp");
		return mav;
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session,HttpServletRequest request) {
			/*
			 * 입력한 이메일로 db에 저장된 salt값을 가저온 후에
			 * salt와 입력한 비밀번호를 암호화 시키고
			 * vo에 값 세팅 후에 유저 정보 db에서 가저옴
			 * 
			 */
			System.out.println("로그인 컨트롤러 진입");
			String salt = userService.getSaltById(vo.getEmail());
			String inputPassword = SHA256Util.getEncrypt(vo.getPassword(), salt);
			vo.setPassword(inputPassword);
			UserVO user = userService.getUser(vo);
			
			if(user!=null) {
				System.out.println("가입된 사용자 이메일" + user.getEmail());
				session.setAttribute("userEmail", user.getEmail());
				session.setAttribute("name", user.getName());
				mav.addObject("user", user);
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
