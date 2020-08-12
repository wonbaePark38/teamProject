package com.spring.plug.login.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.spring.plug.login.service.UserService;
import com.spring.plug.login.vo.UserVO;



public class AutoLoginInterceptor extends HandlerInterceptorAdapter{

   @Autowired
   private UserService service;
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      HttpSession session = request.getSession();
      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
      if(loginCookie != null) {
    	  UserVO vo = service.checkLoginBefore(loginCookie.getValue());
         if(vo != null) {
            session.setAttribute("user", vo);
         }
      }
      return true;
      
   }
}