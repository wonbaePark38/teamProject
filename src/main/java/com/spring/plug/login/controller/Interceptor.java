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

public class Interceptor extends HandlerInterceptorAdapter {

	
	@Autowired
	UserService userService;
  @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      System.out.println("인터셉터발동!");
      HttpSession session = request.getSession();
      Object obj = session.getAttribute("user");
   
      
      if(obj == null) {//현재 로그인 상태가 아닐때
    	  System.out.println("세션있냐?");
    	  Cookie cookie = WebUtils.getCookie(request, "loginCookie");
    	  if(cookie != null) { // 로그인 안했는데 쿠키는 있는 사람, 즉 자동로그인 체크 했었고 로그인 시도 하려는 사람
    		  String sessionkey = cookie.getValue();
    		  System.out.println("세션 id체크" + sessionkey);
    		  UserVO vo = userService.checkUserWithSessionKey(sessionkey); //쿠키값으로 vo에서 정보 가저옴
    		  if(vo != null) { //그런 사람이 있다면
    			  System.out.println("vo가 널이아닐떄");
    			  session.setAttribute("user", vo);
    			  return true;
    		  }
    	  }
    	  response.sendRedirect("/plugProject/login.do");
		  return false;
    	  
      }
      return true;
      /*if(session.getAttribute("user") == null) {
         System.out.println("회원인증실패!");
         response.sendRedirect("/plugProject/newlogin.jsp");
         return false;
      }
      return true;*/
   }
}