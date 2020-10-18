package com.spring.plug.admin.manager.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
		dbVO.setProcount(managerService.getProject().getProcount());
		dbVO.setArticlecount(managerService.getArticle().getArticlecount());
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
	
	@RequestMapping(value = "/adminPage/production/projectArticle.do")
	public ModelAndView getProjectArticle(ModelAndView mav, ManagerVO vo, @RequestParam(value = "month", required = false) String keyword) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(new Date());
		vo.setSearchDay(day.toString());
		ManagerVO dbVO = managerService.getUser();
		dbVO.setArticlecount(managerService.getArticle().getArticlecount());
		dbVO.setArticletoday(managerService.getArticleToday(vo).getArticletoday());
		
		if(keyword != null) {
			keyword = day.toString().split("-")[0] + "-" + keyword;
			vo.setSearchDay(keyword);
		} else {
			vo.setSearchDay(day.toString().split("-")[0] + "-" + day.toString().split("-")[1]);
		}
		List<ManagerVO> monthArticle = managerService.getArticleDay(vo);
		ArrayList<ManagerVO> connlist2 = new ArrayList<ManagerVO>();
		String check = null;
		ManagerVO mVO = null;
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				check = "0" + Integer.toString(i);
			} else {
				check = Integer.toString(i);
			}
			mVO = new ManagerVO();
			mVO.setCreatemonth(check);
			mVO.setDaycount(0);
			connlist2.add(i - 1, mVO);
			for(int j = 0; j < monthArticle.size(); j++) {
				if(check.equals(monthArticle.get(j).getCreatemonth())) {
					mVO.setCreatemonth(check);
					mVO.setDaycount(monthArticle.get(j).getDaycount());
					break;
				}
			}
		}
		String str = new String();
		for(ManagerVO user2 : connlist2) {
			str += "['" + user2.getCreatemonth() + "', " + user2.getDaycount() + "],\n";
		}
		str = str.substring(0, str.length() - 2);

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int preyear = year - 1;
		
		vo.setSearchDay(Integer.toString(year));
		List<ManagerVO> yearArticle = managerService.getArticleYear(vo);

		ArrayList<ManagerVO> connlist3 = new ArrayList<ManagerVO>();
		String check2 = null;
		ManagerVO mVO2 = null;
		for(int i = 1; i < 13; i++) {
			if(i < 10) {
				check2 = "0" + Integer.toString(i);
			} else {
				check2 = Integer.toString(i);
			}
			mVO2 = new ManagerVO();
			mVO2.setCreateyear(check2);
			mVO2.setDaycount(0);
			connlist3.add(i - 1, mVO2);
			for(int j = 0; j < yearArticle.size(); j++) {
				if(check2.equals(yearArticle.get(j).getCreateyear())) {
					mVO2.setCreateyear(check2);
					mVO2.setDaycount(yearArticle.get(j).getDaycount());
					break;
				}
			}
		}
		
		vo.setSearchDay(Integer.toString(preyear));
		List<ManagerVO> preyearArticle = managerService.getArticleYear(vo);
		ArrayList<ManagerVO> connlist4 = new ArrayList<ManagerVO>();
		
		String check3 = null;
		ManagerVO mVO3 = null;
		for(int i = 1; i < 13; i++) {
			if(i < 10) {
				check3 = "0" + Integer.toString(i);
			} else {
				check3 = Integer.toString(i);
			}
			mVO3 = new ManagerVO();
			mVO3.setCreateyear(check3);
			mVO3.setDaycount(0);
			connlist4.add(i - 1, mVO3);
			for(int j = 0; j < preyearArticle.size(); j++) {
				if(check3.equals(preyearArticle.get(j).getCreateyear())) {
					mVO3.setCreateyear(check3);
					mVO3.setDaycount(preyearArticle.get(j).getDaycount());
					break;
				}
			}
		}
		String str2 = new String();
		str2 += "['Year', '" + preyear + "', '" + year + "'],\n";
		int num = 0;
		for(ManagerVO data : connlist3) {
			str2 += "['" + data.getCreateyear() + "', " + connlist4.get(num).getDaycount() + ", " + data.getDaycount() + "],\n";
			num++;
		}
		
		str2 = str2.substring(0, str2.length() - 2);
		
		mav.addObject("vo", dbVO);
		mav.addObject("result", str);
		mav.addObject("result2", str2);
		mav.setViewName("admin-Project-article.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/adminPage/production/projectInfo.do")
	public ModelAndView getProjectInfo(ModelAndView mav, ManagerVO vo, @RequestParam(value = "month", required = false) String keyword) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(new Date());
		vo.setSearchDay(day.toString());
		ManagerVO dbVO = managerService.getUser();
		dbVO.setProcount(managerService.getProject().getProcount());
		dbVO.setProtodaycount(managerService.getProjectToday(vo).getProtodaycount());
		List<ManagerVO> projectList = managerService.getProjectRank();
		
		if(keyword != null) {
			keyword = day.toString().split("-")[0] + "-" + keyword;
			vo.setSearchDay(keyword);
		} else {
			vo.setSearchDay(day.toString().split("-")[0] + "-" + day.toString().split("-")[1]);
		}
		List<ManagerVO> monthProject = managerService.getProjectDay(vo);
		ArrayList<ManagerVO> connlist2 = new ArrayList<ManagerVO>();
		String check = null;
		ManagerVO mVO = null;
		for(int i = 1; i < 32; i++) {
			if(i < 10) {
				check = "0" + Integer.toString(i);
			} else {
				check = Integer.toString(i);
			}
			mVO = new ManagerVO();
			mVO.setCreatemonth(check);
			mVO.setDaycount(0);
			connlist2.add(i - 1, mVO);
			for(int j = 0; j < monthProject.size(); j++) {
				if(check.equals(monthProject.get(j).getCreatemonth())) {
					mVO.setCreatemonth(check);
					mVO.setDaycount(monthProject.get(j).getDaycount());
					break;
				}
			}
		}
		String str = new String();
		for(ManagerVO user2 : connlist2) {
			str += "['" + user2.getCreatemonth() + "', " + user2.getDaycount() + "],\n";
		}
		str = str.substring(0, str.length() - 2);

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int preyear = year - 1;
		
		vo.setSearchDay(Integer.toString(year));
		List<ManagerVO> yearProject = managerService.getProjectYear(vo);

		ArrayList<ManagerVO> connlist3 = new ArrayList<ManagerVO>();
		String check2 = null;
		ManagerVO mVO2 = null;
		for(int i = 1; i < 13; i++) {
			if(i < 10) {
				check2 = "0" + Integer.toString(i);
			} else {
				check2 = Integer.toString(i);
			}
			mVO2 = new ManagerVO();
			mVO2.setCreateyear(check2);
			mVO2.setDaycount(0);
			connlist3.add(i - 1, mVO2);
			for(int j = 0; j < yearProject.size(); j++) {
				if(check2.equals(yearProject.get(j).getCreateyear())) {
					mVO2.setCreateyear(check2);
					mVO2.setDaycount(yearProject.get(j).getDaycount());
					break;
				}
			}
		}
		
		vo.setSearchDay(Integer.toString(preyear));
		List<ManagerVO> preyearProject = managerService.getProjectYear(vo);
		ArrayList<ManagerVO> connlist4 = new ArrayList<ManagerVO>();
		
		String check3 = null;
		ManagerVO mVO3 = null;
		for(int i = 1; i < 13; i++) {
			if(i < 10) {
				check3 = "0" + Integer.toString(i);
			} else {
				check3 = Integer.toString(i);
			}
			mVO3 = new ManagerVO();
			mVO3.setCreateyear(check3);
			mVO3.setDaycount(0);
			connlist4.add(i - 1, mVO3);
			for(int j = 0; j < preyearProject.size(); j++) {
				if(check3.equals(preyearProject.get(j).getCreateyear())) {
					mVO3.setCreateyear(check3);
					mVO3.setDaycount(preyearProject.get(j).getDaycount());
					break;
				}
			}
		}
		String str2 = new String();
		str2 += "['Year', '" + preyear + "', '" + year + "'],\n";
		int num = 0;
		for(ManagerVO data : connlist3) {
			str2 += "['" + data.getCreateyear() + "', " + connlist4.get(num).getDaycount() + ", " + data.getDaycount() + "],\n";
			num++;
		}
		
		str2 = str2.substring(0, str2.length() - 2);
		mav.addObject("vo", dbVO);
		mav.addObject("projectList", projectList);
		mav.addObject("result", str);
		mav.addObject("result2", str2);
		mav.setViewName("admin-Project-project.jsp");
		return mav;
	}
	
	
}
