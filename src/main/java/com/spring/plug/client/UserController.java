package com.spring.plug.client;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/gogogo.do")
	public String insertBoard(UserVO vo) throws IOException {
		System.out.println("User 추가");
		userService.insertUser(vo);
		return "https://www.naver.com/";	
	}
	
}