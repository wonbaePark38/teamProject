package com.spring.plug.file.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.file.service.FileService;
import com.spring.plug.file.vo.FileVO;
import com.spring.plug.login.vo.UserVO;

@Controller
@SessionAttributes("file")
public class FileController {
	
	@Autowired
	FileService fileService;
	
	
	@RequestMapping(value="/totalFileView.do", method ={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView totalFileView(FileVO vo,ModelAndView mav) {
		mav.setViewName("totalFile.jsp");
		return mav;
	}
	
	@RequestMapping(value="/fileSearch.do",method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<FileVO> getFileList(FileVO vo,HttpSession session,Model model, @RequestParam Map<String,String> param) {
		UserVO sessionVO = (UserVO)session.getAttribute("user");
	
		int loginUser = sessionVO.getSeq();
		List<FileVO> projectList = fileService.getProjectList(loginUser);
		
		model.addAttribute("projectList", projectList);
		return projectList;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/getRealPath.do", method=RequestMethod.POST)
	public FileVO getRealPath(FileVO vo, HttpSession session) {
		FileVO result = fileService.getRealPath(vo.getArticleId());
		return result;
	}
	
}
