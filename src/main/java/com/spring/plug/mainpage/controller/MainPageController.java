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
	public String articleReplyInsert(ArticleReplyVO vo, ProjectDirVO project, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		System.out.println(vo.toString());

		service.insertReply(vo);

		return "mainpage.do";
	}

	@RequestMapping(value = "/mainpage.do")
	public ModelAndView articleSelect(ProjectDirVO project, ArticleReplyVO rvo, Article1VO vo, ModelAndView mav,
			HttpSession session) {

		System.out.println(project.toString());

		vo.setProject_id(project.getProject_id());

		rvo.setProject_id(project.getProject_id());

		// 게시글 리스트
		List<Article1VO> articleList = service.selectArticle(vo);

		// 댓글 리스트
		List<ArticleReplyVO> replyList = service.selectReply(rvo);

		// 상단 고정글 리스트
		List<Article1VO> pixedList = service.getArticlePixedList(vo);

		mav.addObject("project", project);
		mav.addObject("articleList", articleList);
		mav.addObject("replyList", replyList);
		mav.addObject("pixedList", pixedList);
		mav.setViewName("mainPage.jsp");
		return mav;
	}

	public void fileSave(Article1VO vo, UserVO user, ProjectDirVO project) throws IOException {
		MultipartFile uploadFile = vo.getWriteForm_file();
		String file_path = "";
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String memberID = Integer.toString(user.getSeq());
			file_path = "C:\\plug\\"+project.getProject_id()+"\\"+ memberID + "_" + fileName;
			uploadFile.transferTo(new File(file_path));
		}
		vo.setFile_path(file_path);
		
	}
	
	@RequestMapping(value = "/writeform1.do")
	public String article1Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);
		service.insertArticle(vo);

		return "mainpage.do";
	}

	@RequestMapping(value = "/writeform2.do")
	public String article2Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		fileSave(vo,user,project);
		vo.setMember_id(user.getSeq());

		service.insertArticle(vo);
		return "mainpage.do";
	}

	@RequestMapping(value = "/writeform3.do")
	@ResponseBody
	public String article3Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("pid : " + vo.getProject_id());
		System.out.println("worker : " + vo.getWriteForm3_workersName());
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);


		ArticleWorkerVO workerVO = new ArticleWorkerVO();
		workerVO.setProject_id(vo.getProject_id());
		workerVO.setArticle_id(vo.getArticle_id());

		service.insertArticle(vo);
		return "mainpage.do";
	}

	@RequestMapping(value = "/writeform4.do")
	public String article4Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		service.insertArticle(vo);
		return "mainpage.do";
	}

	@RequestMapping(value = "/writeform5.do")
	public String article5Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		System.out.println("test : " + vo.getWriteForm5_content());
		System.out.println("test : " + vo.getWriteForm5_date());
		System.out.println("test : " + vo.getWriteForm5_worker());
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
	
		service.insertArticle(vo);

		return "mainpage.do";
	}

	// 상단 고정 게시글
	@RequestMapping(value = "/articlepix.do")
	public String updateArticlePix(Article1VO vo, ProjectDirVO project) {
		System.out.println(vo.toString());
		service.updateArticlePixed(vo);
		return "mainpage.do";
	}
	
	// 파일 불러오기
	public String getFileList(Article1VO vo) {
		
		return "mainpage.do";
	}
	
}