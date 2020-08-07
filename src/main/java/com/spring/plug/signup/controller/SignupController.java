package com.spring.plug.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.signup.service.SignupService;

@Controller
public class SignupController {

	@Autowired
	private SignupService signupService;
	
	@RequestMapping(value="/signupPost.do", method=RequestMethod.POST)
	public String joinPost(@ModelAttribute("vo") UserVO vo) throws Exception {
		System.out.println("currnent join member: " + vo.getEmail().toString());
		vo.setAuthStatus("0");
		signupService.insertMember(vo);
		return "newlogin.jsp";
	}
	
	@RequestMapping(value="/signConfirm.do", method=RequestMethod.GET)
	public ModelAndView emailConfirm(@ModelAttribute("vo") UserVO vo, ModelAndView mav, @RequestParam("email") String email, @RequestParam("authkey") String authkey) throws Exception {
		UserVO uVo = new UserVO();
		String uEmail = email;
		String uAuthkey = authkey;
		uVo.setEmail(uEmail);
		vo = signupService.selectAuthkey(uVo);
		
		if(vo.getAuthStatus().equals("0")) {
			if(authkey.equals(vo.getAuthKey())) {
				System.out.println("인증키 일치");
			} else {
				System.out.println("인증키 불일치");
			}
			
		} else if(vo.getAuthStatus().equals("1")){
			System.out.println("인증이 완료된 회원");
			mav.setViewName("index.jsp");
		}
		return mav;
	}
	
	
	
}
