package com.spring.plug.adminsignup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.adminsignup.service.AdminSignupService;
import com.spring.plug.adminsignup.vo.AdminVO;

@Controller
public class AdminSignupController {

	@Autowired
	private AdminSignupService asService;
		
	@RequestMapping(value="/adminSignup.do", method=RequestMethod.GET)
	public String joinGet(@ModelAttribute("vo") AdminVO vo) {
		System.out.println("1111");
		return "login.jsp";
	}
	
	@RequestMapping(value="/adminPage/production/adminSignup.do", method=RequestMethod.POST)
	public ModelAndView joinPost(@ModelAttribute("vo") AdminVO vo, ModelAndView mav) {
		System.out.println(vo.getAdminEmail());
		try {
			asService.insertAdmin(vo);
			mav.setViewName("newlogin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("중복 이메일");
			mav.addObject("status", "sameEmail");
			mav.setViewName("signup.jsp");
		}
		return mav;
	}
	
}
