package com.spring.plug.projectmanager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.projectmanager.service.ProjectManageService;
import com.spring.plug.projectmanager.vo.ProjectManageVO;

@Controller
public class ProjectManageController {
	@Autowired
	ProjectManageService pmService;
	
	@RequestMapping(value="/downProhibitionView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView downProhibition(ModelAndView mav) {
		mav.setViewName("downloadProhibition.jsp");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="getDownloadSetting.do", method = RequestMethod.POST)
	public String getDownloadSetting(ProjectManageVO vo, HttpSession session) {
		ProjectDirVO pdVO = (ProjectDirVO)session.getAttribute("projectdir");
		String status = pmService.getDownProhibition(pdVO.getProject_id());
		return status;
	}
	
	@ResponseBody
	@RequestMapping(value="changeDownProhibitionSetting.do", method=RequestMethod.POST)
	public void changeDownProhibitionSetting(ProjectManageVO vo, HttpSession session) {
		int projectId = (int)session.getAttribute("projectId");
		vo.setProjectId(projectId);
		pmService.changeDownProhibitionSetting(vo);
	}
}
