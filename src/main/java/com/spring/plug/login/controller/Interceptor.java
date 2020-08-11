package com.spring.plug.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userEmail");
		if(obj == null) {
			response.sendRedirect("login.do");
			return false;
			// 컨트롤러에 더이상 요청이 가지 않도록 리턴 false
			//preHandle의 return은 컨트롤러로 요청 uri로 가도 되냐 안되냐를 정하는것			
		}
		return true;
	}

	@Override //posthandle은 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메소드
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
