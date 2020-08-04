package com.spring.plug.mainpage.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.maipage.article.service.ArticleService;

@Controller
public class MainPageController {

	@Autowired
	private ArticleService service;
	
	@RequestMapping(value = "/writeform1.do")
	public String insertArticle(Article1VO vo) throws IOException{

		MultipartFile uploadFile = vo.getWriteForm1_file();
		System.out.println("controller" + vo.toString());
		
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
		}
		
		
		service.insertArticle1(vo);
		
		return "mainPage.jsp";
	}
	
}
