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

/*소셜 로그인 한 사람들이 로그인 클릭 했을때의 컨트롤러*/

@Controller
public class SocialLoginController{
	
	@Autowired
	private UserServiceImpl userService;
	
	
	@RequestMapping(value="/slogin.do",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session,HttpServletRequest request) {
		
			System.out.println("소셜 컨트롤러 진입");
			System.out.println(vo.toString());
			UserVO user = userService.getSocialUser(vo);
			System.out.println(user.toString());
			session.setAttribute("user", user);
			if(user != null) { // 이미 소셜 이메일로 로그인 이력 있던 사람
				System.out.println("소셜 로그인 로그인 이력있는 사람");
				mav.setViewName("totalFileView.do");
				mav.addObject("user" , user);
				return mav;
			}else {//소셜 이메일로 처음 로그인 시도 한 사람
				System.out.println("소셜 처음 로그인한 사람");
				userService.addSocialUser(vo);
			}
			
			mav.setViewName("totalFileView.do");
			return mav;
	}
}
