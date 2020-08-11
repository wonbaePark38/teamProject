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
		
		
		projectDirService.insertProjectLookup(vo);
		return "mainProjectDir.jsp";
	}
	
	@RequestMapping(value="/projectdir.do", method = RequestMethod.GET)
	public ModelAndView getProjectDirTotalList(ProjectDirVO vo, ModelAndView mav) {
		vo.setMember_id(1);
		List<ProjectDirVO> list = projectDirService.getProjectDirTotalList(vo);
		
		mav.addObject("projectDirList",list);
		mav.setViewName("mainProjectDir.jsp");
		return mav;
	}
	
}