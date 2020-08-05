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
	
	@RequestMapping(value = "/newproject.do", method = RequestMethod.POST)
	public String projectDirInsert(ProjectDirVO vo) {
		System.out.println("111");
		projectDirService.insertProjectDir(vo);
		return "mainPage.jsp";
	}
	
	@RequestMapping(value="/content.do", method = RequestMethod.GET)
	public String getProjectDirList(ProjectDirVO vo, Model model) {
		System.out.println("controller 시작");
		vo.setProjectmanager("dnjswhdzld");
		model.addAttribute("projectDirList",projectDirService.getProjectDirList(vo));
		System.out.println("controller 끝");
		return "content.jsp";
	}
	
}
