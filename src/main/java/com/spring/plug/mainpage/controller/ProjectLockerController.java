package com.spring.plug.mainpage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.plug.mainpage.projectdir.service.ProjectLockerService;
import com.spring.plug.mainpage.projectdir.vo.ProjectLockerVO;

@Controller
public class ProjectLockerController {
	
	@Autowired
	private ProjectLockerService projectLockerService;
	
	@RequestMapping(value = "/favorites.do")
	public String projectLockerFavorites(ProjectLockerVO vo) {
		projectLockerService.insertProjectLocker(vo);
		return "content.jsp";
	}
}
