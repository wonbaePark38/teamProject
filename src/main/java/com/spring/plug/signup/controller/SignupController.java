package com.spring.plug.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.admin.manager.service.ManagerServiceImpl;
import com.spring.plug.admin.manager.vo.ManagerVO;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.signup.service.SignupService;

@Controller
public class SignupController {

	@Autowired
	private SignupService signupService;
	
	@Autowired
	private ManagerServiceImpl managerService;
	
	@RequestMapping(value="/index.do")
	public ModelAndView index(ManagerVO vo, ModelAndView mav) {
		System.out.println("인덱스 화면 진입");
		vo = managerService.getUser();
		vo.setProcount(managerService.getProject().getProcount());
		vo.setArticlecount(managerService.getArticle().getArticlecount());
		mav.addObject("vo", vo);
		mav.setViewName("index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/signupPost.do", method=RequestMethod.POST)
	public ModelAndView joinPost(@ModelAttribute("vo") UserVO vo, ModelAndView mav) {
		System.out.println("currnent join member: " + vo.getEmail().toString());
		vo.setAuthStatus("0");
		try {
			signupService.insertMember(vo);
			signupService.addUserInfo(vo);
			mav.addObject("status", "success");
			mav.setViewName("signup.jsp");
		} catch (Exception e) {
			System.out.println("중복 이메일");
			e.printStackTrace();
			mav.addObject("status", "sameEmail");
			mav.setViewName("signup.jsp");
		}
		return mav;
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
				vo.setAuthStatus("1");
				signupService.updateAuthstatus(vo);
				mav.setViewName("authsuccess.jsp");
			} else {
				System.out.println("인증키 불일치");
				mav.setViewName("authfailed.jsp");
			}
			
		} else if(vo.getAuthStatus().equals("1")){
			System.out.println("인증이 완료된 회원");
			mav.setViewName("alreadyauth.jsp");
		}
		return mav;
	}
	
	
	
}
