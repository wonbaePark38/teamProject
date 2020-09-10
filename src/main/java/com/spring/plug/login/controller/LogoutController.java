package com.spring.plug.login.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.spring.plug.login.service.UserServiceImpl;
import com.spring.plug.login.vo.UserVO;

@Controller
public class LogoutController {
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value="/logout.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView logout(UserVO vo,ModelAndView mav, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		vo = (UserVO)session.getAttribute("user");
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie !=null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);//쿠키 유효시간 재설정
			response.addCookie(loginCookie);
			Date sessionLimit = new Date(System.currentTimeMillis());
			userService.keepLogin(vo.getEmail(), session.getId(), sessionLimit); //db에 반영
		}
		if(vo != null) {
			userService.updateDisconnectionLog(vo.getSeq());
		}
		session.removeAttribute("user");
		session.invalidate();
		System.out.println("로그아웃");
		mav.setViewName("newlogin.jsp");
		return mav;
	}

}
