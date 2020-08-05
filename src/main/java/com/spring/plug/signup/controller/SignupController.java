package com.spring.plug.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.plug.signup.service.SignupService;
import com.spring.plug.signup.vo.SignupVO;

@Controller
public class SignupController {

	@Autowired
	private SignupService signupService;
	
	@RequestMapping(value = "/signup.do")
	public String insertMember(SignupVO vo) {
		System.out.println("회원가입");
		signupService.insertMember(vo);
		return "index.jsp";
	}
}
