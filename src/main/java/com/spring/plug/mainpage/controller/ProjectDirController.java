package com.spring.plug.mainpage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.service.ProjectDirService;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Controller
public class ProjectDirController {
	
	@Autowired
	private ProjectDirService projectDirService;
	
	public ProjectDirController() {
		System.out.println("projectdir controller start");
	}
	
	@RequestMapping(value = "/newproject.do", method = RequestMethod.POST)
	public String projectDirInsert(ProjectDirVO vo) {
		projectDirService.insertProjectDir(vo);	
		System.out.println("project insert");
		
		projectDirService.insertProjectLookup(vo);
		System.out.println("project lookup insert");
		
		vo.setProject_favorites(0);
		vo.setProject_locker("");
		vo.setHide_locker(0);
		projectDirService.insertProjectLocker(vo);
		System.out.println("project locker insert");
		
		return "projectdir.do";
	}
	
	// 프로젝트 정렬
	// 전체보기
	@RequestMapping(value="/projectdir.do")
	public ModelAndView getProjectDirTotalList(ProjectDirVO vo, ModelAndView mav, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		
		List<ProjectDirVO> list = projectDirService.getProjectDirTotalList(user.getSeq());
		mav.addObject("projectDirList",list);
		mav.setViewName("mainProjectDir.jsp");
		return mav;
	}
	// 관리자인 프로젝트만 보기
	@RequestMapping(value="/projectdir1.do")
	public ModelAndView getProjectDirManagerList(ProjectDirVO vo, ModelAndView mav) {
		List<ProjectDirVO> list = projectDirService.getProjectDirManagerList(vo);
		mav.addObject("projectDirList",list);
		mav.setViewName("mainProjectDir.jsp");
		return mav;
	}

	// 프로젝트 즐겨찾기
	@RequestMapping(value = "/projectfavorites.do", method = RequestMethod.POST)
	public String updateProjectFavorites(ProjectDirVO vo) {
		projectDirService.updateProjectFavorites(vo);
		return "projectdir.do";
	}
	
	// 프로젝트 선택
	@RequestMapping(value = "/projectselect.do", method = RequestMethod.POST)
	public ModelAndView getProjectDir(ProjectDirVO vo, ModelAndView mav) {
		mav.addObject("getProject",vo);
		mav.setViewName("mainpage.do");
		return mav;
	}
}
