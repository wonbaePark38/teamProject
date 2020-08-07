package com.spring.plug.mainpage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleTodoArrVO;
import com.spring.plug.mainpage.article.service.ArticleService;

@Controller
public class MainPageController {

   @Autowired
   private ArticleService service;
   
   private String writeForm5_content;
   private String writeForm5_date;
   private String writeForm5_worker;
   
   
   @RequestMapping(value = "/mainpage.do")
   public ModelAndView articleSelect(Article1VO vo, ModelAndView mav) {
	   
	   return mav;
   }
   
   @RequestMapping(value = "/writeform1.do")
   public String article1Insert(Article1VO vo) throws IOException{

      MultipartFile uploadFile = vo.getWriteForm_file();
      System.out.println("controller" + vo.toString());
      
      
      if(!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
      }
      
      
      service.insertArticle1(vo);
      
      return "mainPage.jsp";
   }
   
   
   
   @RequestMapping(value="/writeform2.do")
   public String article2Insert(Article1VO vo) throws IOException{
      
      MultipartFile uploadFile = vo.getWriteForm_file();
      System.out.println("controller" + vo.toString());
      
      
      if(!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
      }
      
      
      service.insertArticle2(vo);
      
      return "mainPage.jsp";
   }
   
   
   @RequestMapping(value = "/writeform3.do")
   public String article3Insert(Article1VO vo) throws IOException{
      
      service.insertArticle3(vo);
      
      return "mainPage.jsp";
   }
   
   
   @RequestMapping(value = "/writeform4.do")
   public String article4Insert(Article1VO vo) throws IOException{
	   
	   service.insertArticle4(vo);
	   
	   return "mainPage.jsp";
   }
   
   @RequestMapping(value = "/writeform5.do")
	public String article5Insert(ArticleTodoArrVO article) throws IOException {

		Article1VO vo = new Article1VO();
		
		
		System.out.println("controller entrance");

		for (int i = 0; i < article.getWriteForm5_content().length; i++) {
			if (i == 0) {
				writeForm5_content = article.getWriteForm5_content()[i];
				writeForm5_date = article.getWriteForm5_date()[i];
				writeForm5_worker = article.getWriteForm5_worker()[i];
			} else {
				writeForm5_content += ("," + article.getWriteForm5_content()[i]);
				writeForm5_date += ("," + article.getWriteForm5_date()[i]);
				writeForm5_worker += ("," + article.getWriteForm5_worker()[i]);
			}
		}

		vo.setWriteForm5_project_id(article.getWriteForm5_project_id());
		vo.setArticle_id(article.getArticle_id());
		vo.setWriteForm5_form_name(article.getWriteForm5_form_name());
		vo.setWriteForm5_writer(article.getWriteForm5_writer());
		vo.setWriteForm5_regDate(article.getWriteForm5_regDate());
		vo.setWriteForm5_title(article.getWriteForm5_title());
		vo.setWriteForm5_content(writeForm5_content);
		vo.setWriteForm5_date(writeForm5_date);
		vo.setWriteForm5_worker(writeForm5_worker);

		service.insertArticle5(vo);
		return "mainPage.jsp";
	}
   
}