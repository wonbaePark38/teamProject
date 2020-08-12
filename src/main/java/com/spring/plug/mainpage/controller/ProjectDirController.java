package com.spring.plug.mainpage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.mainpage.projectdir.service.ProjectDirService;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Controller
public class ProjectDirController {
	
	@Autowired
	private ProjectDirService projectDirService;
	
	
	@RequestMapping(value = "/newproject.do", method = RequestMethod.POST)
	public String projectDirInsert(ProjectDirVO vo) {
		vo.setMember_id(1);
		projectDirService.insertProjectDir(vo);	
		System.out.println("ProjectDir 생성");
		
		projectDirService.insertProjectLookup(vo);
		System.out.println("ProjectLookup 생성");
		
		vo.setProject_favorites(0);
		vo.setProject_locker("");
		vo.setHide_locker(0);
		projectDirService.insertProjectLocker(vo);
		System.out.println(vo.toString());
		System.out.println("ProjectLocker 생성");
		
		return "projectdir.do";
	}
	
	
	// 프로젝트 정렬
	// 전체보기
	@RequestMapping(value="/projectdir.do")
	public ModelAndView getProjectDirTotalList(ProjectDirVO vo, ModelAndView mav) {
		vo.setMember_id(1);
		vo.setProject_manager(0);
		List<ProjectDirVO> list = projectDirService.getProjectDirTotalList(vo);
		mav.addObject("projectDirList",list);
		mav.setViewName("mainProjectDir.jsp");
		return mav;
	}
	// 관리자인 프로젝트만 보기
	@RequestMapping(value="/projectdir1.do")
	public ModelAndView getProjectDirManagerList(ProjectDirVO vo, ModelAndView mav) {
		vo.setMember_id(1);
		vo.setProject_manager(1);
		List<ProjectDirVO> list = projectDirService.getProjectDirManagerList(vo);
		mav.addObject("projectDirList",list);
		mav.setViewName("mainProjectDir.jsp");
		return mav;
	}

	// 프로젝트 즐겨찾기
	@RequestMapping(value = "/projectfavorites.do")
	public String updateProjectFavorites(ProjectDirVO vo) {
		vo.setMember_id(1);
//		System.out.println(vo.getProject_id());
//		System.out.println(vo.getProject_favorites());
		projectDirService.updateProjectFavorites(vo);
		return "projectdir.do";
	}
}
