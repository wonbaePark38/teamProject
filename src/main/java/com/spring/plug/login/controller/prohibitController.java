package com.spring.plug.login.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/*
 * 로그인이 된 상태에서 다시 로그인 페이지 눌렀을때 
 * project 목록 뿌려주는 페이지로 인터셉트 이용해서 구현한 클래스
 */
public class prohibitController extends HandlerInterceptorAdapter{
	 
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
     
      HttpSession session = request.getSession();
      Object obj = session.getAttribute("user");
      if(obj != null) { //로그인 세션이 있나 체크(로그인 상태인지 아닌지)
    	  
    	  String uri = request.getRequestURI(); 
    	  System.out.println("uri 체크" + uri);
    	  if(uri.equals("/plugProject/login.do") || uri.equals("/plugProject/slogin.do")) { //uri 비교해서  로그인 요청이면
    		  System.out.println("uri 체크 if체크");
    		  response.sendRedirect("/plugProject/projectdir.do");
    	  }
      }
      return true;
   }
	
	
}