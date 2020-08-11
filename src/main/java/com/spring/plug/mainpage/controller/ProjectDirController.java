package com.spring.plug.mainpage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.plug.mainpage.projectdir.service.ProjectDirService;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Controller
public class ProjectDirController {
	
	@Autowired
	private ProjectDirService projectDirService;
	
	// 새 프로젝트 생성하기
	@RequestMapping(value = "/newproject.do", method = RequestMethod.POST)
	public String projectDirInsert(ProjectDirVO vo) {
		projectDirService.insertProjectDir(vo);
		projectDirService.insertProjectLookup(vo);
		return "mainPage.jsp";
	}
	
	// 가입된 모든 프로젝트 보기
	@RequestMapping(value="/content.do", method = RequestMethod.GET)
	public String getProjectDirTotalList(ProjectDirVO vo, Model model) {
		vo.setUsername("dnjswhdzld");
		model.addAttribute("projectDirList",projectDirService.getProjectDirTotalList(vo));
		return "content.jsp";
	}
	
	// 내가 관리자인 프로젝트만 보기
	@RequestMapping(value="/content_manager.do")
	public String getProjectDirManagerList(ProjectDirVO vo, Model model) {
		vo.setUsername("dnjswhdzld");
		model.addAttribute("projectDirList",projectDirService.getProjectDirManagerList(vo));
		return "content.jsp";
	}
	
	// 테스트 인덱스 페이지
	@RequestMapping(value="/start.do", method = RequestMethod.POST)
	public String getStart() {
		return "mainPage.jsp";
	}
	@RequestMapping(value="/start.do", method = RequestMethod.GET)
	public String getStart2() {
		return "content.jsp";
	}
	
	// 보관함 추가하기
	@RequestMapping(value="/newlocker.do", method = RequestMethod.POST)
	public String newlocker() {
		
		return "mainPage.jsp";
	}
}
