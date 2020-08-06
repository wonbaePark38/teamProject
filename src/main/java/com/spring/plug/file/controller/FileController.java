package com.spring.plug.file.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView getFileList(FileVO vo,ModelAndView mav) {
		List<FileVO> projectList = fileService.getProjectList(vo);
		
		if(vo.getSearchFileCondition()==null) {
			vo.setSearchFileCondition("FILENAME");
		}
		
		if(vo.getSearchFileKeyword()==null) {
			vo.setSearchFileKeyword("");
		}
		
		System.out.println("파일 목록 검색 처리");
		
		
		return mav;
	}
}
