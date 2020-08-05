package com.spring.plug.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.signup.service.SignupService;

@Controller
public class SignupController {

	@Autowired
	private SignupService signupService;
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String insertMember(UserVO vo) {
		System.out.println("회원가입");
		signupService.insertMember(vo);
		return "index.jsp";
	}
}
