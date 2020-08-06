package com.spring.plug.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.signup.service.SignupService;

@Controller
public class SignupController {

	@Autowired
	private SignupService signupService;
	
//	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
//	public String insertMember(UserVO vo) {
//		System.out.println("회원가입");
//		try {
//			signupService.insertMember(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "newlogin.jsp";
//	}
	
	@RequestMapping(value="/signupPost.do", method=RequestMethod.POST)
	public String joinPost(@ModelAttribute("vo") UserVO vo) throws Exception {
		System.out.println("currnent join member: " + vo.toString());
		vo.setAuthStatus("0");
		signupService.insertMember(vo);
		return "newlogin.jsp";
	}
	
	@RequestMapping(value="/signConfirm", method=RequestMethod.GET)
	public String emailConfirm(@ModelAttribute("vo") UserVO vo, Model model) throws Exception {
		System.out.println(vo.getEmail() + ": auth confirmed");
		vo.setAuthStatus("1");	// authstatus를 1로,, 권한 업데이트
		signupService.updateAuthstatus(vo);
		
		model.addAttribute("auth_check", 1);
		
		return "newlogin.jsp";
	}
}
