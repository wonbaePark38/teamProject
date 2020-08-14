package com.spring.plug.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;

@Controller
public class LogoutController {
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(UserVO vo,ModelAndView mav, HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		System.out.println("로그아웃");
		mav.setViewName("/login.do");
		return mav;
	}

}
