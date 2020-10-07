package com.spring.plug.login.controller;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.common.util.SHA256Util;
import com.spring.plug.common.util.ScanNowTime;
import com.spring.plug.common.util.TempKey;
import com.spring.plug.login.service.UserServiceImpl;
import com.spring.plug.login.vo.UserVO;
//회원가입을 직접 한 사람들이 로그인 시도 했을때의 컨트롤러
@Controller
public class LoginController{

	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public ModelAndView loginView(UserVO vo,ModelAndView mav) {
		mav.setViewName("newlogin.jsp");
		
		return mav;
	}

	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model) {
		/*
		 * 입력한 이메일로 db에 저장된 salt값을 가저온 후에
		 * salt와 입력한 비밀번호를 암호화 시키고
		 * vo에 값 세팅 후에 유저 정보 db에서 가저옴

		 */
		UserVO user = userService.getUser(vo);
		//db에 가입 정보가 없음
		if(user == null) { 
			System.out.println("가입된 회원이 아님");
			mav.setViewName("newlogin.jsp");
			mav.addObject("status", "notJoin");
			return mav;
		}
		
		String inputPassword = vo.getPassword();
		if(user.getPasswordAuthStatus().equals("1") && user.getSocialCompare().equals("N")) { //임시비밀번호가 아닌 사람
			inputPassword = SHA256Util.getEncrypt(vo.getPassword(), user.getSalt()); //사용자가 입력한 비밀번호 암호화
		}
		if(inputPassword.equals(user.getPassword()) && user.getAuthStatus().equals("0")) { //정보는 맞지만 이메일 인증 하지않은 회원
			System.out.println("이메일 인증 하지 않았습니다");
			mav.addObject("status", "notCheckEmail");
			mav.setViewName("newlogin.jsp");
			return mav;
		} else if(!inputPassword.equals(user.getPassword())) { //비밀번호 다르게 입력한 사람
			System.out.println("비밀번호가 틀렸습니다");
			mav.setViewName("newlogin.jsp");
			mav.addObject("status", "passwordFalse");
			return mav;
		}else { //이메일 비번 다 올바르게 입력하고 이메일 인증까지 마친 사람
			
			int id = user.getSeq();
			String prevConnectDevice = user.getConnectDevice();//이전 접속 기계
			String prevLoginTime = user.getLoginDate(); //이전 접속 시간
			String hostName= "";
			String loginDate = ScanNowTime.nowTime();
			ArrayList<String>deviceList = new ArrayList<String>(2);
			ArrayList<String>logList = new ArrayList<String>(2);
		    try {
		    	InetAddress addr;
				addr = InetAddress.getLocalHost();
				hostName = addr.getHostName();
			} catch (UnknownHostException e) {
				System.out.println("정보가 없는 접속임");
				e.printStackTrace();
			}
		    //접속 정보 db에 저장
		    deviceList.add(0,hostName);
		    logList.add(0,loginDate);
		    if(prevLoginTime != null) {
		    	String[] deviceArr = prevConnectDevice.split(",");
			    String[] logTime = prevLoginTime.split(",");
			    deviceList.add(deviceArr[0]); //이전 접속된값 최신값을 리스트에 넣어줌
			    logList.add(logTime[0]);
		    }
		    
		    if(deviceList.size() > 1) {
		    	hostName += ","+deviceList.get(1);
		    	loginDate += ","+logList.get(1);
		    }else {
		    	hostName = deviceList.get(0);
		    	loginDate = logList.get(0);
		    }
		    
		    vo.setSeq(id);
		    vo.setConnectDevice(hostName);
		    vo.setLoginDate(loginDate);
			userService.writeLoginDate(vo);//유저접속 정보 usersetting 테이블에 업데이트
			session.setAttribute("user", user);
			userService.insertConnectionLog(id); //로그 기록 남김
			if(vo.isUseCookie()) {//자동로그인 체크한 경우
				Cookie loginCookie = new Cookie("loginCookie",session.getId());
				loginCookie.setPath("/");
				int amount = 60*60*24*7;
				loginCookie.setMaxAge(amount); //7일
				response.addCookie(loginCookie);//쿠키 생성
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount)); 
				userService.keepLogin(vo.getEmail(), session.getId(), sessionLimit);
			}
			
			if(!user.getPasswordAuthStatus().equals("0")) {//로그인 성공한 사람중에 임시 비밀번호가 아닌사람은 이쪽
				mav.setViewName("projectdir.do");
			}else { //임시 비밀번호로 로그인 성공한 사람은 이쪽
				mav.setViewName("settingPassword.do");
			}
			mav.addObject("login", user);
			return mav;
		}
	}//end login.do

	/*비밀번호 찾을때 db에 이메일이 있는지 체크하는 메소드*/
	@RequestMapping(value="/searchEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public UserVO searchEmail(UserVO vo,Model model,HttpServletRequest request) {
		UserVO check = userService.checkEmail(vo);

		if(check != null && check.getSocialCompare().equals("N")) {
		
			try {//e메일 보내고 db에 status 저장하는 서비스
				userService.sendPasswordCheckEmail(vo);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			vo.setEmailCheck("true");

		}else{
			vo.setEmailCheck("false");
		}
		return vo;
	}
	
	/*임시 비밀번호 발송된 이메일에서 버튼 클릭하면 임시 비밀번호 db에 저장하는 컨트롤러*/
	@RequestMapping("/passlogin.do")
	public ModelAndView loginView(UserVO vo,ModelAndView mav,@RequestParam("email") String email, @RequestParam("password") String password) {
		System.out.println("임시비밀번호" + password);
		vo.setEmail(email);
		vo.setPassword(password);
		vo.setPasswordAuthStatus("0");
		userService.changePasswordBytempPassword(vo);//db에 임시비밀먼호 세팅
		mav.setViewName("newlogin.jsp");
		return mav;
	}
	
}
