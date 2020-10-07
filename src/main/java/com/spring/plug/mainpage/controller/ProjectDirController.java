package com.spring.plug.mainpage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.service.ProjectDirService;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.user.accountinfo.service.UserSettingService;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

@Controller
public class ProjectDirController {

	@Autowired
	private ProjectDirService projectDirService;

	@Autowired
	private UserSettingService userSettingService;

	@RequestMapping(value = "/newproject.do", method = RequestMethod.POST)
	public String projectDirInsert(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());

		projectDirService.insertProjectDir(vo);

		vo.setProject_manager(1);
		vo.setProject_favorites(0);
		vo.setProject_locker("PLN-400");
		vo.setHide_locker(0);
		projectDirService.insertProjectLookup(vo);

		projectDirService.insertProjectLocker(vo);

		
		return "redirect:projectdir.do";
	}

	// 프로젝트 초대 - 유효성 해야함
	@RequestMapping(value = "/joinproject.do", method = RequestMethod.POST)
	public String joinProject(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		
		projectDirService.insertProjectLookup(vo);

		vo.setProject_favorites(0);
		vo.setProject_manager(0);
		vo.setProject_locker("PLN-400");
		vo.setHide_locker(0);

		projectDirService.insertProjectLocker(vo);

		return "redirect:projectdir.do";
	}

	// 프로젝트 정렬
	// 전체보기
	@RequestMapping(value = "/projectdir.do")
	public ModelAndView getProjectDirTotalList(ProjectDirVO vo, ModelAndView mav, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		String type = vo.getViewType();
		
		List<ProjectDirVO> list = projectDirService.getProjectDirTotalList(vo);
		List<ProjectDirVO> locker_list = projectDirService.getLockerList(vo.getMember_id());
		mav.addObject("lockerN", vo.getProject_locker());
		mav.addObject(vo);
		mav.addObject("type", type);
		mav.addObject("projectDirList", list);
		mav.addObject("projectLockerList", locker_list);
		mav.setViewName("mainProjectDir.jsp");
		return mav;
	}

	// 프로젝트 즐겨찾기
	@RequestMapping(value = "/projectfavorites.do", method = RequestMethod.POST)
	public String updateProjectFavorites(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		projectDirService.updateProjectFavorites(vo);
		return "redirect:projectdir.do";
	}
	// 프로젝트 선택
	@RequestMapping(value = "/projectselect.do", method = RequestMethod.POST)
	public ModelAndView getProjectDir(ProjectDirVO vo, ModelAndView mav,HttpSession session, UserSettingVO usvo) {
		UserVO uvo = (UserVO) session.getAttribute("user");
		vo.setMember_id(uvo.getSeq());
		session.setAttribute("projectdir", vo);
		List<ProjectDirVO> locker_list = projectDirService.getLockerList(vo.getMember_id());
		List<ProjectDirVO> projectUser_list = projectDirService.getProjectUserList(vo);
		
		mav.addObject("getProject", vo);
		mav.addObject("projectLockerList", locker_list);
		mav.addObject("joinlist", projectUser_list);
		mav.setViewName("mainpage.do");
		projectDirService.insertProject_ConnectionLog(vo);
		return mav;
	}

	// 보관함 만들기
	@RequestMapping(value = "/insertlocker.do", method = RequestMethod.POST)
	public String insertLockerList(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());

		projectDirService.insertLockerList(vo);

		return "redirect:projectdir.do";
	}

	// 보관함 삭제
	@RequestMapping(value = "/deletelocker.do", method = RequestMethod.POST)
	public String deleteLocker(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		String[] del_project_id_list = vo.getProject_id_list().split(",");
		try {
			if (vo.getProject_id_list() != null) {
				for (String project_id : del_project_id_list) {
					vo.setProject_id(Integer.parseInt(project_id));
					projectDirService.deleteProjectLocker(vo);
				}
			}
		} catch (NumberFormatException e) {
			
		}
		projectDirService.deleteLocker(vo);
		return "redirect:projectdir.do";
	}
	
	// 보관함 해제
	@RequestMapping(value = "/deletelockername.do", method = RequestMethod.POST)
	public String deleteLockerListName(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		String[] del_project_id_list = vo.getProject_id_list().split(",");
		for (String project_id : del_project_id_list) {
			vo.setProject_id(Integer.parseInt(project_id));
			projectDirService.deleteProjectLocker(vo);
		}
		return "redirect:projectdir.do";
	}

	// 보관함 이름 변경
	@RequestMapping(value = "/updatelockername.do", method = RequestMethod.POST)
	public String updateLockerListName(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		String[] update_project_id_list = vo.getProject_id_list().split(",");
		try {
			for (String project_id : update_project_id_list) {
				vo.setProject_id(Integer.parseInt(project_id));
				projectDirService.updateProjectLocker(vo);
			}
		} catch (Exception e) {
			
		}
		projectDirService.updateLockerName(vo);
		return "redirect:projectdir.do";
	}
	
	// 프로젝트 보관함에 넣기
	@RequestMapping(value = "/updatelocker.do", method = RequestMethod.POST)
	public String updateLockerSet(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		
		String[] project_id_list = vo.getProject_id_list().split(",");
		for (String project_id : project_id_list) {
			vo.setProject_id(Integer.parseInt(project_id));
			projectDirService.updateProjectLocker(vo);
		}
		return "redirect:projectdir.do";
	}
	
	// 프로젝트 숨기기
	@RequestMapping(value = "/hidelocker.do")
	public String hideLockerSet(ProjectDirVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setMember_id(user.getSeq());
		
		String[] project_id_list = vo.getProject_id_list().split(",");
		for (String project_id : project_id_list) {
			vo.setProject_id(Integer.parseInt(project_id));
			projectDirService.updateProjectHide(vo);
		}
		return "redirect:projectdir.do";
	}
	
	
	
}
