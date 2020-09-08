package com.spring.plug.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.service.UserServiceImpl;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.signup.service.SignupService;
import com.spring.plug.user.accountinfo.service.UserSettingServiceImpl;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

/*소셜 버튼으로  로그인 클릭 했을때의 컨트롤러*/

@Controller
public class SocialLoginController{
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private SignupService signupService;
	
	@RequestMapping(value="/slogin.do",method=RequestMethod.GET)
	public ModelAndView loginView(UserVO vo,ModelAndView mav) {
		mav.setViewName("login.do");

		return mav;
	}
	
	@RequestMapping(value="/slogin.do",method = RequestMethod.POST)
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session,HttpServletRequest request) {
		UserVO user = userService.getSocialUser(vo);
		
		if(user == null) { // 소셜 로그인으로 처음 로그인한 사람
			System.out.println("소셜 유저 추가");
			userService.addSocialUser(vo); //db에 정보 추가
			signupService.addUserInfo(vo); //usersetting 테이블에 정보 insert
			user = userService.getSocialUser(vo);
		}
		
		session.setAttribute("user", user);
		mav.addObject("user" , user);
		mav.setViewName("projectdir.do");
		return mav;
	}
}
