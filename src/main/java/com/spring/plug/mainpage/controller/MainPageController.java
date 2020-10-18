package com.spring.plug.mainpage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
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
	public String articleReplyInsert(Model model,ArticleReplyVO vo, ProjectDirVO project, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());

		service.insertReply(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/updatereply.do")
	public String articleReplyUpdate(Model model,ArticleReplyVO vo, ProjectDirVO project, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		service.updateReply(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "deletereply.do")
	public String articleReplyDelete(Model model, ArticleReplyVO vo, ProjectDirVO project, HttpSession session) {
		service.deleteReply(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("project_name",project.getProject_name());
		
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/mainpage.do")
	public ModelAndView articleSelect(Model model,ProjectDirVO project, ArticleReplyVO rvo, Article1VO vo, ModelAndView mav,
			HttpSession session,@ModelAttribute(value="pvo")ProjectDirVO pvo) {

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
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		
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
		List<MultipartFile> uploadImg = vo.getWriteForm_img();
		if (!uploadImg.get(0).isEmpty()) {
			String memberID = Integer.toString(user.getSeq());
			String image_path = "/plugProject/upload_image/"+project.getProject_id()+"/"+memberID+"_";
			String imageList = "";
			try {
				for (MultipartFile multipartFile : uploadImg) {
					imageList += multipartFile.getOriginalFilename()+",";
					File destdir = new File("/usr/local/tomcat/webapps"+image_path);
					if(!destdir.exists()) {
						destdir.mkdirs();
					}
					
					multipartFile.transferTo(new File("/usr/local/tomcat/webapps"+image_path+multipartFile.getOriginalFilename()));
				}
				vo.setImg_name(imageList.substring(0,imageList.length()-1));
				vo.setImg_path(image_path);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			vo.setImg_name(null);
		}
	}
	
	@RequestMapping(value = "/writeform1.do")
	public String article1Insert(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);
		imageSave(vo, user, project);
		service.insertArticle(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}

	@RequestMapping(value = "/writeform2.do")
	public String article2Insert(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);
		imageSave(vo, user, project);
		service.insertArticle(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}

	@RequestMapping(value = "/writeform3.do")
	public String article3Insert(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		if (vo.getWriteForm3_workersName() != null || vo.getWriteForm3_workersName() != "") {
			
			String workerMembers = vo.getWriteForm3_workersName();
			vo.setWriteForm3_workersName(workerMembers.substring(0,workerMembers.length()-1));
		}
		
		vo.setMember_id(user.getSeq());
		fileSave(vo,user,project);
		imageSave(vo, user, project);
		service.insertArticle(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}

	@RequestMapping(value = "/writeform4.do")
	public String article4Insert(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		service.insertArticle(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}

	@RequestMapping(value = "/writeform5.do")
	public String article5Insert(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) throws IOException {
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
		
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}

	// 상단 고정 게시글
	@RequestMapping(value = "/articlepix.do")
	public String updateArticlePix(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) {
		service.updateArticlePixed(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/todoupdate.do")
	public String updateTodoSuccess(Model model,Article1VO vo,ArticleWorkerVO wvo, ProjectDirVO project, HttpSession session) {
		service.updateTodoSuccess(wvo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/deletearticle.do")
	public String deleteArticle(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) {
		
		service.deleteArticle(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/deletetodo.do")
	public String deleteTodo(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) {
		ArticleWorkerVO wvo = new ArticleWorkerVO();
		wvo.setArticle_id(vo.getArticle_id());
		service.deleteArticle(vo);
		service.deleteTodo(wvo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/mergecontain.do")
	public String updateContain(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		service.mergeArticleLookup(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	}
	
	@RequestMapping(value = "/articlemodified.do")
	public String articleModified(Model model,Article1VO vo, ProjectDirVO project, HttpSession session) {
		service.updateArticleModified(vo);
		List<ProjectDirVO> projectUser_list = project_service.getProjectUserList(project);
		model.addAttribute("joinlist", projectUser_list);
		model.addAttribute("project_id", project.getProject_id());
		model.addAttribute("member_id", vo.getMember_id());
		model.addAttribute("project_name",project.getProject_name());
		return "redirect:mainpage.do";
	};
	
	@RequestMapping(value = "/task.do")
	public ModelAndView totalTask(Article1VO vo, ModelAndView mav, ArticleReplyVO rvo, ProjectDirVO pvo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		
		String taskStatusLoad = "";
		if (vo.getTask_checked() != null) {
			for (String arr : vo.getTask_checked()) {
				taskStatusLoad += (arr+",");
			}
			taskStatusLoad = taskStatusLoad.substring(0,taskStatusLoad.length()-1);
		}
		// 업무 담당자
		List<Article1VO> taskList = service.getTaskList(vo);
		
		List<Article1VO> totalTaskList = service.selectArticle(vo);
		
		List<Article1VO> containList = service.getArticleLookupList(vo);
		
		mav.addObject("taskStatusLoad",taskStatusLoad);
		mav.addObject("taskTypes",vo.getSelectType());
		mav.addObject("containList",containList);
		mav.addObject("taskList",taskList);
		mav.addObject("totalTaskList",totalTaskList);
		mav.setViewName("task.jsp");
		return mav;
	}
	
}