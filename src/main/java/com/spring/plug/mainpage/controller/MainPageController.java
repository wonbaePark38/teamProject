package com.spring.plug.mainpage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.article.service.ArticleService;
import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;
import com.spring.plug.mainpage.article.vo.ArticleWorkerVO;
import com.spring.plug.mainpage.projectdir.service.ProjectDirService;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Controller
public class MainPageController {

	@Autowired
	private ArticleService service;

	@Autowired 
	private ProjectDirService project_service;
	
	
	
	
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
		
		ArticleWorkerVO wvo = new ArticleWorkerVO();
		wvo.setProject_id(project.getProject_id());

		vo.setProject_id(project.getProject_id());

		rvo.setProject_id(project.getProject_id());

		// 게시글 리스트
		List<Article1VO> articleList = service.selectArticle(vo);

		// 댓글 리스트
		List<ArticleReplyVO> replyList = service.selectReply(rvo);

		// 상단 고정글 리스트
		List<Article1VO> pixedList = service.getArticlePixedList(vo);

		// 프로젝트 사용자 리스트
		List<ProjectDirVO> userList = project_service.getTaskUser(project);
		
		// 업무 담당자
		List<Article1VO> taskList = service.getTaskList(vo);
		
		// 업무 통계
		List<Article1VO> taskStatusList = service.getTaskStatusList(vo);

		// 할일 리스트
		List<ArticleWorkerVO> todoList = service.getTodoList(wvo);
		
		List<Article1VO> containList = service.getArticleLookupList(vo);
		
		mav.addObject("containList",containList);
		mav.addObject("todoList",todoList);
		mav.addObject("taskList",taskList);
		mav.addObject("taskStatusList",taskStatusList);
		mav.addObject("userList",userList);
		mav.addObject("project", project);
		mav.addObject("articleList", articleList);
		mav.addObject("replyList", replyList);
		mav.addObject("pixedList", pixedList);
		mav.setViewName("mainPage.jsp");
		return mav;
	}

	public void fileSave(Article1VO vo, UserVO user, ProjectDirVO project) throws IOException {
		MultipartFile uploadFile = vo.getWriteForm_file();
		if (!uploadFile.isEmpty()) {
			String memberID = Integer.toString(user.getSeq());
			vo.setFile_name(uploadFile.getOriginalFilename());
			String file_path = "/usr/local/tomcat/webapps/plugProject/upload/"+project.getProject_id()+"/"+ memberID + "_" + vo.getFile_name();
			File destdir = new File(file_path);
			 if(!destdir.exists()) {
				 destdir.mkdirs();
			 }
			
			uploadFile.transferTo(new File(file_path));
			vo.setFile_path(file_path);
		} else {
			vo.setFile_name(null);
		}
		
	}
	public void imageSave(Article1VO vo, UserVO user, ProjectDirVO project) throws IOException {
		MultipartFile uploadFile = vo.getWriteForm_img();
		if (!uploadFile.isEmpty()) {
			String memberID = Integer.toString(user.getSeq());
			vo.setImg_name(uploadFile.getOriginalFilename());
			String image_path = "/usr/local/tomcat/webapps/plugProject/upload_image/"+project.getProject_id()+"/"+ memberID + "_" + vo.getImg_name();
			File destdir = new File(image_path);
			 if(!destdir.exists()) {
				 destdir.mkdirs();
			 }
			
			uploadFile.transferTo(new File(image_path));
			vo.setImg_size(image_path);
		} else {
			vo.setImg_name(null);
		}
	}
	
	@RequestMapping(value = "/writeform1.do")
	public String article1Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);
		imageSave(vo, user, project);
		service.insertArticle(vo);

		return "mainpage.do";
	}

	@RequestMapping(value = "/writeform2.do")
	public String article2Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);
		service.insertArticle(vo);
		return "mainpage.do";
	}

	@RequestMapping(value = "/writeform3.do")
	public String article3Insert(Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		if (vo.getWriteForm3_workersName() != null || vo.getWriteForm3_workersName() != "") {
			
			String workerMembers = vo.getWriteForm3_workersName();
			vo.setWriteForm3_workersName(workerMembers.substring(0,workerMembers.length()-1));
		}
		
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);

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
		ArticleWorkerVO workerVO = new ArticleWorkerVO();

		System.out.println(vo.getWriteForm5_worker());
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		String members = "";
		if (vo.getWriteForm5_content() != "" || vo.getWriteForm5_content() != null) {
			members = vo.getWriteForm5_content();
			vo.setWriteForm5_content(members.substring(0,members.length()-1));
		}
		String contents = "";
		if (vo.getWriteForm5_content() != "" || vo.getWriteForm5_content() != null) {
			contents = vo.getWriteForm5_content();
			vo.setWriteForm5_content(contents.substring(0,contents.length()-1));
		}
		String dates = "";
		if (vo.getWriteForm5_date() != "" || vo.getWriteForm5_date() != null) {
			dates = vo.getWriteForm5_date();
			vo.setWriteForm5_date(dates.substring(0,dates.length()-1));
		}
		String workers = "";
		if (vo.getWriteForm5_worker() != "" || vo.getWriteForm5_worker() != null) {
			workers = vo.getWriteForm5_worker();
			vo.setWriteForm5_worker(workers.substring(0,workers.length()-1));
		}
		
		service.insertArticle(vo); // 게시글 등록
		
		
		String[] member = members.split(",");
		String[] content = contents.split(",");
		String[] date = dates.split(",");
		String[] worker = workers.split(",");
		
		for (int i = 0; i < member.length; i++) {
			workerVO.setMember_id(vo.getMember_id());
			workerVO.setProject_id(vo.getProject_id());
			workerVO.setArticle_id(vo.getArticle_id());
			workerVO.setWorker_content(content[i]);
			workerVO.setWorker_date(date[i]);
			workerVO.setWorker_name(worker[i]);
			service.insertWorker(workerVO);
		}
		

		return "mainpage.do";
	}

	// 상단 고정 게시글
	@RequestMapping(value = "/articlepix.do")
	public String updateArticlePix(Article1VO vo, ProjectDirVO project, HttpSession session) {
		System.out.println(vo.toString());
		service.updateArticlePixed(vo);
		return "mainpage.do";
	}
	
	// 파일 불러오기
	public String getFileList(Article1VO vo) {
		
		return "mainpage.do";
	}
	
	@RequestMapping(value = "/todoupdate.do")
	public String updateTodoSuccess(ArticleWorkerVO wvo, ProjectDirVO project, HttpSession session) {
		service.updateTodoSuccess(wvo);
		return "mainpage.do";
	}
	
	@RequestMapping(value = "/deletearticle.do")
	public String deleteArticle(Article1VO vo, ProjectDirVO project, HttpSession session) {
		
		service.deleteArticle(vo);
		
		return "mainpage.do";
	}
	
	@RequestMapping(value = "/deletetodo.do")
	public String deleteTodo(Article1VO vo, ProjectDirVO project, HttpSession session) {
		ArticleWorkerVO wvo = new ArticleWorkerVO();
		wvo.setArticle_id(vo.getArticle_id());
		service.deleteArticle(vo);
		service.deleteTodo(wvo);
		return "mainpage.do";
	}
	
	@RequestMapping(value = "/mergecontain.do")
	public String updateContain(Article1VO vo, ProjectDirVO project, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		System.out.println(vo.getMember_id());
		System.out.println(vo.getArticle_contain());
		System.out.println(vo.getArticle_id());
		service.mergeArticleLookup(vo);
		return "mainpage.do";
	}
	
	@RequestMapping(value = "/articlemodified.do")
	public String articleModified(Article1VO vo, ProjectDirVO project, HttpSession session) {
			service.updateArticleModified(vo);
		return "mainpage.do";
	};
}