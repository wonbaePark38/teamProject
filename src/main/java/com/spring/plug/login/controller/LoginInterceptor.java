package com.spring.plug.login.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.spring.plug.login.service.UserService;
import com.spring.plug.login.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	 @Inject
	 UserService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("prehandle 호출");
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
		if(loginCookie!=null) {
			System.out.println("쿠키 있을까융");
			UserVO vo = service.checkLoginBefore(loginCookie.getValue());
			if(vo != null) {
				session.setAttribute("user", vo);
			}
		}
		return true;
		/*HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			response.sendRedirect(request.getContextPath()+"/");
			System.out.println("세션있음~");
			return false;
		}
		System.out.println("세션 없음~ 즉 쿠키 안쓰는 가입된 회원의  로그인");
		return true;*/
	}
	
	
	/*@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		System.out.println("prehandle 호출");
		if(loginCookie != null) {
			UserVO userVO = userService.checkLoginBefore(loginCookie.getValue());
			if(userVO != null) {
				session.setAttribute("login", userVO);
			}
			
		}
		return true;
	}*/
	
}
