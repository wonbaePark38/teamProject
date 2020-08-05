package com.spring.plug.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController{
	
	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public ModelAndView loginView(UserVO vo,ModelAndView mav) {
		System.out.println("로그인 화면으로 이동");
		
		mav.setViewName("login.jsp");
		return mav;
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session,HttpServletRequest request) {
		/*if(vo.getEmail() == null || vo.getEmail().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다");
		}*/
		System.out.println("로그인 정보: " + vo.getEmail());
		UserVO user = userService.getUser(vo);
		
		if(user!=null) {
			session.setAttribute("userName", user.getName());
			session.setAttribute("userEmail", user.getEmail());
			mav.setViewName("getBoardList.do");
			
			return mav;
		}else {
			System.out.println("아이디와 비번이 틀림");
			mav.setViewName("newlogin.jsp");
			mav.addObject("status", "false");
			return mav;
		}
		
		
		
		
	}
	

}
