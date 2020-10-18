<<<<<<< HEAD
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
		
	
	@RequestMapping(value="/adminPage/production/adminSignup.do", method=RequestMethod.POST)
	public ModelAndView joinPost(@ModelAttribute("AdminVO") AdminVO vo, ModelAndView mav) {
		try {
			asService.insertAdmin(vo);
			mav.addObject("status", "signupok");
			mav.setViewName("/adminPage/production/admin-Login.jsp#login");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("중복 이메일");
			mav.addObject("status", "sameEmail");
			mav.setViewName("/adminPage/production/admin-Login.jsp#signup");
		}
		return mav;
	}
	
}
=======
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
		
	
	@RequestMapping(value="/adminPage/production/adminSignup.do", method=RequestMethod.POST)
	public ModelAndView joinPost(@ModelAttribute("AdminVO") AdminVO vo, ModelAndView mav) {
		try {
			asService.insertAdmin(vo);
			mav.addObject("status", "signupok");
			mav.setViewName("/adminPage/production/admin-Login.jsp#login");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("중복 이메일");
			mav.addObject("status", "sameEmail");
			mav.setViewName("/adminPage/production/admin-Login.jsp#signup");
		}
		return mav;
	}
	
}
>>>>>>> 2485aa6b5ca5b2210f0a2d564b19fea2b1ba724f
