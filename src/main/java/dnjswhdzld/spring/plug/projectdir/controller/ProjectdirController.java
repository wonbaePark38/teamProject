package dnjswhdzld.spring.plug.projectdir.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dnjswhdzld.spring.plug.projectdir.ProjectdirVO;
import dnjswhdzld.spring.plug.projectdir.service.ProjectdirService;

@Controller
public class ProjectdirController {
	
	@Autowired
	private ProjectdirService service;

	
	@RequestMapping(value = "/content.do")
	public List<ProjectdirVO> getProjectdirList(ProjectdirVO vo){
		return null;
	}
	
}
