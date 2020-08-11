package com.spring.plug.file.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.plug.file.service.FileService;
import com.spring.plug.file.vo.FileVO;

@Controller
@SessionAttributes("file")
public class FileController {
	
	@Autowired
	FileService fileService;
	
	@ModelAttribute("conditionMap")
	public Map<String,String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String,String>();
		conditionMap.put("파일이름", "FILENAME");
		conditionMap.put("올린사람","UPLOADER");
		return conditionMap;
	}
	
	@RequestMapping("fileSearch.do")
	@ResponseBody
	public List<FileVO> getFileList(FileVO vo,HttpSession session,Model model, @RequestParam Map<String,String> param) {
		//유저정보 세션으로 세팅 session.get~~ 후 vo에 유저 셋팅
		System.out.println("현재 접속 사용자 " + session.getAttribute("userEmail"));
		if(param.get("project") == null || param.get("project").equals("전체 프로젝트")) {
			System.out.println("전체프로젝트 선택");
			vo.setTargetProject("2");
		}else {
			vo.setTargetProject(param.get("project"));
		}
		
		vo.setLoginUser("a");
		
		
		List<FileVO> projectList = fileService.getProjectList(vo);
		/*
		 * private String searchFileCondition;
		   private String searchFileKeyword;
		 */
		
		System.out.println(projectList.toString());
		
		/*if(vo.getSearchFileCondition()==null) {
			vo.setSearchFileCondition("FILENAME");
		}
		
		if(vo.getSearchFileKeyword()==null) {
			vo.setSearchFileKeyword("");
		}*/
		
		model.addAttribute("projectList", projectList);
		return projectList;
		//mav.addObject("projectList", projectList);
		//mav.setViewName("totalFile.jsp");
		//return mav;
	}
}
