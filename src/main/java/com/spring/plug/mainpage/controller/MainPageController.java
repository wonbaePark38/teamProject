package com.spring.plug.mainpage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;
import com.spring.plug.mainpage.article.vo.ArticleWorkerVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.article.service.ArticleService;

@Controller
public class MainPageController {

   @Autowired
   private ArticleService service;

   private String[] arr;
   private int count;

   @RequestMapping(value = "/articlereply.do")
   public String articleReplyInsert(ArticleReplyVO vo) {
	   
	   System.out.println(vo.toString());
	   
	   service.insertReply(vo);
	   
	   return "mainpage.do";
   }
   
   
   @RequestMapping(value = "/mainpage.do")
   public ModelAndView articleSelect(ProjectDirVO project, ArticleReplyVO rvo ,Article1VO vo, ModelAndView mav, HttpSession session) {
	   
	   
	   System.out.println("worker : " + vo.getWriteForm3_workersName());
	   
	   vo.setProject_id(project.getProject_id());
	   rvo.setProject_id(project.getProject_id());
	   
	   List<Article1VO> articleList = service.selectArticle(vo);
	   
   
	   List<ArticleReplyVO> replyList = service.selectReply(rvo);

	   
	   mav.addObject("project", project);
	   mav.addObject("articleList",articleList);
	   mav.addObject("replyList",replyList);
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

      return "mainpage.do";
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
      return "mainpage.do";
   }

   @RequestMapping(value = "/writeform3.do")
   @ResponseBody
   public String article3Insert(Article1VO vo) throws IOException {

	  System.out.println("pid : " + vo.getProject_id());
	  System.out.println("worker : " + vo.getWriteForm3_workersName());
	   
      MultipartFile uploadFile = vo.getWriteForm_file();

      if (!uploadFile.isEmpty()) {
         String fileName = uploadFile.getOriginalFilename();
         uploadFile.transferTo(new File("C:\\testFile\\" + fileName));
      }
      
      ArticleWorkerVO workerVO = new ArticleWorkerVO();
      workerVO.setProject_id(vo.getProject_id());
      workerVO.setArticle_id(vo.getArticle_id());
      
      service.insertArticle(vo);
      return "mainpage.do";
   }

   @RequestMapping(value = "/writeform4.do")
   public String article4Insert(Article1VO vo) throws IOException {

      service.insertArticle(vo);
      return "mainpage.do";
   }

   @RequestMapping(value = "/writeform5.do")
   public String article5Insert(Article1VO vo) throws IOException {
	   
	  System.out.println("test : "+vo.getWriteForm5_content());
	  System.out.println("test : "+vo.getWriteForm5_date());
	  System.out.println("test : "+vo.getWriteForm5_worker());
	  
	  service.insertArticle(vo);
	  
      return "mainpage.do";
   }

}