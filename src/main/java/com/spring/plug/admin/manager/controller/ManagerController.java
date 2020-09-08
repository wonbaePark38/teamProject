package com.spring.plug.admin.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.admin.manager.service.ManagerServiceImpl;
import com.spring.plug.admin.manager.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerServiceImpl managerService;
	
	@RequestMapping(value = "/adminPage/production/getUserManager.do")
	public ModelAndView getUserInfo(ModelAndView mav) {
		ManagerVO dbVO = managerService.getUser();
		mav.addObject("vo", dbVO);
		mav.setViewName("admin-User-management.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/LoginSuccess.do")
	public ModelAndView getMain(ModelAndView mav) {
		ManagerVO dbVO = managerService.getUser();
		mav.addObject("vo", dbVO);
		mav.setViewName("admin-Main.jsp");
		return mav;
	}
	
}
