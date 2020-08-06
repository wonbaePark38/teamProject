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
	public String getProjectDirList(ProjectDirVO vo, Model model) {
		model.addAttribute("projectDirList",projectDirService.getProjectDirList(vo));
		return "content.jsp";
	}
	
	@RequestMapping(value="/content_total.do")
	public String getProjectDirTotal(ProjectDirVO vo, Model model) {
		model.addAttribute("projectDirList",projectDirService.getProjectDirTotal(vo));
		return "content.jsp";
	}

	@RequestMapping(value="/content_ascending.do")
	public String getProjectListSetAscending(ProjectDirVO vo, Model model) {
		model.addAttribute("projectDirList",projectDirService.getProjectDirAscending(vo));
		return "content.jsp";
	}
	@RequestMapping(value="/content_descending.do")
	public String getProjectListSetDescending(ProjectDirVO vo, Model model) {
		model.addAttribute("projectDirList",projectDirService.getProjectDirDescending(vo));
		return "content.jsp";
	}
	
}
