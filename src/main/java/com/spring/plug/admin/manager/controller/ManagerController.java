package com.spring.plug.admin.manager.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.spring.plug.login.service.UserService;
import com.spring.plug.login.vo.UserVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerServiceImpl managerService;
	
	@Autowired 
	private UserService user_service; 
	
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("컨디션맵");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("이름", "NAME");
		conditionMap.put("프로젝트명", "PROJECTNAME");
		return conditionMap;
	}
	
	@RequestMapping(value = "/adminPage/production/getUserManager.do")
	public ModelAndView getUserInfo(ModelAndView mav, UserVO vo) {
		// 시간대별 유저	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(new Date());
		vo.setSearchDay(day.toString());
		List<UserVO> connlist = user_service.userConnectionTime(vo);
		ArrayList<UserVO> connlist2 = new ArrayList<UserVO>();
		String check = null;
		UserVO user = null;
		for(int i = 0; i < 24; i++) {
			if(i < 10) {
				check = "0" + Integer.toString(i);
			} else {
				check = Integer.toString(i);
			}
			user = new UserVO();
			user.setConnection_times(check);
			user.setUser_time("0");
			connlist2.add(i, user);
			for(int j = 0; j < connlist.size(); j++) {
				if(check.equals(connlist.get(j).getConnection_times())) {
					user.setConnection_times(check);
					user.setUser_time(connlist.get(j).getUser_time());
					break;
				}
			}
		}
		String str = new String();
		for(UserVO user2 : connlist2) {
			str += "['" + user2.getConnection_times() + "', " + user2.getUser_time() + "],\n";
		}
		str = str.substring(0, str.length() - 2);
		
		ManagerVO dbVO = managerService.getUser();
		mav.addObject("vo", dbVO);
		mav.addObject("result", str);
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
