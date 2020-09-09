package com.spring.plug.login.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.common.util.ScanNowTime;
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
	    
	    vo.setSeq(user.getSeq());
	    vo.setConnectDevice(hostName);
	    vo.setLoginDate(loginDate);
		userService.writeLoginDate(vo);//유저접속 정보 usersetting 테이블에 업데이트
		session.setAttribute("user", user);
		
		userService.insertConnectionLog(user.getSeq()); //로그 기록 남김
		session.setAttribute("user", user);
		mav.addObject("user" , user);
		mav.setViewName("projectdir.do");
		return mav;
		/*
		 * 
		 */
	}
}
