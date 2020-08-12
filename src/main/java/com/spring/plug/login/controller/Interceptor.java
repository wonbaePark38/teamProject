package com.spring.plug.login.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

  @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      System.out.println("인터셉터발동!");
      HttpSession session = request.getSession();
      
      if(session.getAttribute("user") == null) {
         System.out.println("회원인증실패!");
         response.sendRedirect("/plugProject/newlogin.jsp");
         return false;
      }
      return true;
   }
}