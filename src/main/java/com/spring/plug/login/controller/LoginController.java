package com.spring.plug.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.common.util.MailUtils;
import com.spring.plug.common.util.SHA256Util;
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
	public ModelAndView login(UserVO vo,ModelAndView mav, HttpSession session) {
			/*
			 * 입력한 이메일로 db에 저장된 salt값을 가저온 후에
			 * salt와 입력한 비밀번호를 암호화 시키고
			 * vo에 값 세팅 후에 유저 정보 db에서 가저옴
			 * 
			 */
			System.out.println("로그인 컨트롤러 진입");
			String salt = userService.getSaltById(vo.getEmail());
			
			if(salt==null) {
				System.out.println("가입된 회원이 아닙니다");
				mav.setViewName("newlogin.jsp");
				mav.addObject("status", "notJoin");
				return mav;
			}
			
			String inputPassword = SHA256Util.getEncrypt(vo.getPassword(), salt);
			vo.setPassword(inputPassword);
			UserVO user = userService.getUser(vo);
			
			if(user!=null && user.getAuthStatus().equals("1")) {
				
				System.out.println("가입된 사용자 이메일" + user.getEmail());
				session.setAttribute("userEmail", user.getEmail());
				session.setAttribute("name", user.getName());
				mav.addObject("user", user);
				mav.setViewName("totalFile.jsp");
				return mav;
			
			}else if(user != null && user.getAuthStatus().equals("0")) {
				System.out.println("이메일 인증 하지 않았습니다");
				mav.addObject("status", "notCheckEmail");
				mav.setViewName("newlogin.jsp");
				return mav;
			}
			else {
				System.out.println("비밀번호가 틀렸습니다");
				mav.setViewName("newlogin.jsp");
				mav.addObject("status", "passwordFalse");
				return mav;
			}
	}
	
	/*
	 * db에 이메일이 있는지 체크하는 메소드
	 */
	@RequestMapping("searchEmail.do")
	@ResponseBody
	public UserVO searchEmail(UserVO vo,Model model,HttpServletRequest request) {
		
		String checkEmail = request.getParameter("email");
		vo.setEmail(checkEmail);
		UserVO check = userService.checkEmail(vo);
		
		if(check != null && check.getSocialCompare().equals("N")) {
			/*이메일 전송 로직*/
			String authkey = new TempKey().getKey(50, false);//auth키 생성
			vo.setPasswordAuthKey(authkey);//vo에 셋팅
			
			userService.updatePasswordAuthKey(vo); //db에 auth 추가
			try {
				userService.sendPasswordCheckEmail(vo);
			} catch (Exception e) {
				e.printStackTrace();
			} //e메일 보내고 db에 status 저장하는 서비스
			vo.setEmailCheck("true");
			
		}else{
			System.out.println("일치하는 이메일이 없음");
			vo.setEmailCheck("false");
		}
		model.addAttribute("emailCheck", check);
		return vo;
	}
	
	@RequestMapping("/passlogin")
	public ModelAndView loginView(UserVO vo,ModelAndView mav, @RequestParam("email") String email) {
		System.out.println("리턴 이메일"+ email );
		
		mav.setViewName("newlogin.jsp");
		return mav;
	}
}
