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
		projectDirService.insertProjectDir(vo);
		projectDirService.insertProjectLookup(vo);
		return "mainPage.jsp";
	}
	
	@RequestMapping(value="/content.do", method = RequestMethod.GET)
	public String getProjectDirTotalList(ProjectDirVO vo, Model model) {
		vo.setUsername("dnjswhdzld");
		model.addAttribute("projectDirList",projectDirService.getProjectDirTotalList(vo));
		return "content.jsp";
	}
	
	@RequestMapping(value="/content_manager.do")
	public String getProjectDirManagerList(ProjectDirVO vo, Model model) {
		vo.setUsername("dnjswhdzld");
		model.addAttribute("projectDirList",projectDirService.getProjectDirManagerList(vo));
		return "content.jsp";
	}
	
	@RequestMapping(value="/start.do", method = RequestMethod.POST)
	public String getStart() {
		return "mainPage.jsp";
	}
	@RequestMapping(value="/start.do", method = RequestMethod.GET)
	public String getStart2() {
		return "content.jsp";
	}
}
