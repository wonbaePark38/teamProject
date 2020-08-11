package com.spring.plug.file.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	public List<FileVO> getFileList(FileVO vo,HttpSession session,ModelAndView mav) {
		//유저정보 세션으로 세팅 session.get~~ 후 vo에 유저 셋팅
		String user = "a"; //테스트값
		List<FileVO> projectList = fileService.getProjectList(user);
		/*for(FileVO temp : projectList ) {
			System.out.println("검색된 프로젝트" + temp.getProjectId());
			System.out.println("검색된 파일" + temp.getFileName());
		}*/
		System.out.println(projectList.toString());
		if(vo.getSearchFileCondition()==null) {
			vo.setSearchFileCondition("FILENAME");
		}
		
		if(vo.getSearchFileKeyword()==null) {
			vo.setSearchFileKeyword("");
		}
		
		//mav.addObject("projectList", projectList);
		//mav.setViewName("totalFile.jsp");
		return projectList;
	}
}