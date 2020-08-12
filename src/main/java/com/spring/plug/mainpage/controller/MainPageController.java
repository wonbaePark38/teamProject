package com.spring.plug.mainpage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.service.ArticleService;

@Controller
public class MainPageController {

   @Autowired
   private ArticleService service;

   private String[] arr;
   private int count;

   @RequestMapping(value = "/mainpage.do")
   public ModelAndView articleSelect(Article1VO vo, ModelAndView mav) {

	   List<Article1VO> articleList = service.selectArticle(vo);
	   
	   for (int i = 0; i < articleList.size(); i++) {
		System.out.println(articleList.get(i).toString());
	   }
	   
	   mav.addObject("articleList",articleList);
	   mav.setViewName("mainPage.jsp");
      return mav;
   }

   @RequestMapping(value = "/writeform1.do")
   public String article1Insert(Article1VO vo) throws IOException {

      MultipartFile uploadFile = vo.getWriteForm_file();
      System.out.println("controller" + vo.toString());

      if (!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
      }

      service.insertArticle(vo);

      return "mainPage.jsp";
   }

   @RequestMapping(value = "/writeform2.do")
   public String article2Insert(Article1VO vo) throws IOException {

      MultipartFile uploadFile = vo.getWriteForm_file();
      System.out.println("controller" + vo.toString());

      if (!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
      }

      service.insertArticle(vo);
      return "mainPage.jsp";
   }

   @RequestMapping(value = "/writeform3.do")
   public String article3Insert(Article1VO vo) throws IOException {

      MultipartFile uploadFile = vo.getWriteForm_file();

      if (!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
      }

      service.insertArticle(vo);
      return "mainPage.jsp";
   }

   @RequestMapping(value = "/writeform4.do")
   public String article4Insert(Article1VO vo) throws IOException {

      service.insertArticle(vo);
      return "mainPage.jsp";
   }

   @RequestMapping(value = "/writeform5.do")
   public String article5Insert(Article1VO vo) throws IOException {
	   
	  System.out.println("test : "+vo.getWriteForm5_content());
	  System.out.println("test : "+vo.getWriteForm5_date());
	  System.out.println("test : "+vo.getWriteForm5_worker());
	  
	  service.insertArticle(vo);
	  
      return "mainPage.jsp";
   }

}