package com.spring.plug.admin.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.admin.manager.service.ManagerServiceImpl;
import com.spring.plug.admin.manager.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerServiceImpl managerService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("컨디션맵");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("이름", "NAME");
		conditionMap.put("프로젝트명", "PROJECTNAME");
		return conditionMap;
	}
	
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
	
	@RequestMapping(value = "/adminPage/production/searchUser.do")
	public ModelAndView searchUser(ManagerVO vo, ModelAndView mav) {
		if(vo.getSearchCondition() == null)	vo.setSearchCondition("NAME");
		if(vo.getSearchKeyword() == null)	vo.setSearchKeyword("");
		List<ManagerVO> userList = managerService.getUserList(vo);
		mav.addObject("userList", userList);
		mav.setViewName("admin-User-searchUser.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/getUserLog.do")
	public ModelAndView getTimeLog(ManagerVO vo, ModelAndView mav, @RequestParam(value = "month", required = false) String keyword) {
		if(keyword != null) {
			vo.setSearchKeyword(keyword);
		} else {
			vo.setSearchKeyword(null);
		}
		List<ManagerVO> userTime = managerService.getTimeLog(vo);
		mav.addObject("userTime", userTime);
		mav.setViewName("admin-User-log.jsp");
		return mav;
	}
	
}
