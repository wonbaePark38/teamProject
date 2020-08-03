package com.spring.plug.articlewriteform.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.plug.articlewriteform.service.ArticleService;
import com.spring.plug.articlewriteform.vo.ArticleVO;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService service;
	
	@RequestMapping(value = "/writeform1.do")
	public String insertArticle(ArticleVO vo) throws IOException{
		
		MultipartFile uploadFile = vo.getWriteForm1_file();
		
		System.out.println("uploadFile : "+uploadFile);
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/testFile/" + fileName));
		}
		
		System.out.println("controller" + vo.toString());
		
		service.insertArticle(vo);
		
		return "mainPage.jsp";
	}
	
}
