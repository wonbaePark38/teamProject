package com.spring.plug.projectmanager.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.projectmanager.service.ProjectManageService;
import com.spring.plug.projectmanager.vo.ProjectManageVO;

@Controller
public class ProjectManageController {
	@Autowired
	ProjectManageService pmService;
	//다운금지 설정 뷰 컨트롤러
	@RequestMapping(value="/downProhibitionView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView downProhibition(ModelAndView mav) {
		mav.setViewName("downloadProhibition.jsp");
		return mav;
	}
	//현재 설정된 다운금지 세팅값 불러오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="getDownloadSetting.do", method = RequestMethod.POST)
	public String getDownloadSetting(ProjectManageVO vo, HttpSession session) {
		ProjectDirVO pdVO = (ProjectDirVO)session.getAttribute("projectdir");
		String status = pmService.getDownProhibition(pdVO.getProject_id());
		return status;
	}
	//다운로드 금지 설정 변경 컨트롤러
	@ResponseBody
	@RequestMapping(value="changeDownProhibitionSetting.do", method=RequestMethod.POST)
	public void changeDownProhibitionSetting(ProjectManageVO vo, HttpSession session) {
		ProjectDirVO pdVO = (ProjectDirVO)session.getAttribute("projectdir");
		
		vo.setProjectId(pdVO.getProject_id());
		pmService.changeDownProhibitionSetting(vo);
	}
	//이용내역 통계 뷰 컨트롤러
	@RequestMapping(value="/getUseStatisticsView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView useStatisticsView(ModelAndView mav) {
		mav.setViewName("useStatistics.jsp");
		return mav;
	}
	//이용내역 통계 불러오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="getUseStatistics.do", method=RequestMethod.POST)
	public List<ProjectManageVO> getUseStatistics(HttpSession session){
		ProjectDirVO vo = (ProjectDirVO)session.getAttribute("projectdir");
		List<ProjectManageVO> useList = pmService.getUseStatistics(vo.getProject_id());
		return useList;
	}
	//접속 통계 뷰 컨트롤러
	@RequestMapping(value="getConnectionStatisticsView.do")
	public ModelAndView getConnectionStatisticsView(ModelAndView mav,HttpSession session) {
		ProjectDirVO vo = (ProjectDirVO) session.getAttribute("projectdir");
		List<ProjectManageVO> connectionTermList = pmService.getRecentData(vo.getProject_id());
		String str = new String();
		for(ProjectManageVO temp : connectionTermList) {
			str += temp.getConnectionDate() + "-"+temp.getConnectionCount() + ",";
		}
		str = str.substring(0, str.length()-1);
		mav.addObject("chartList",str);
		mav.setViewName("connectionStatistics.jsp");
		return mav;
	}
	//사용자별 프로젝트 접속통계 불러오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="getConnectionStatistics.do",method=RequestMethod.POST)
	public List<ProjectManageVO> getConnectionStatistics(ProjectManageVO pmVO, HttpSession session){
		ProjectDirVO vo = (ProjectDirVO) session.getAttribute("projectdir");
		pmVO.setProjectId(vo.getProject_id());
		System.out.println("프로젝트 id " + pmVO.getProjectId());
		System.out.println("몇달 전 선택? "+ pmVO.getSelectMonth());
		List<ProjectManageVO> connectionList = pmService.getConnectionStatistics(pmVO);
		for(ProjectManageVO temp : connectionList) {
			System.out.println(temp.toString());
		}
		return connectionList;
	}
	
	@RequestMapping(value="projectManage.do",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView getProjectInfo(ModelAndView mav,HttpSession session,HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); 
		response.setHeader("Expires", "0"); 
		if(session.getAttribute("projectdir") == null) {
			mav.addObject("access", "deny");
			mav.setViewName("accessDeny.html");
			return mav;
		}
		ProjectDirVO vo = (ProjectDirVO)session.getAttribute("projectdir");
		UserVO user = (UserVO)session.getAttribute("user");
		
		vo.setMember_id(user.getSeq());
		
		
		
		ProjectManageVO auth = pmService.accessAuth(vo);
		
		if(auth == null) {
			mav.addObject("access", "deny");
			mav.setViewName("accessDeny.html");
			return mav;
		}else {
			List<ProjectManageVO> result = pmService.getProjectInfo(vo.getProject_id());
			String manageName = "";
			ProjectManageVO resultVO = result.get(0);
			for(ProjectManageVO temp : result) { //관리자가 여러명일때 
				manageName += temp.getName() +",";  //하나로 합침
			}
			manageName = manageName.replaceAll(",$", "");//마지막 콤마 제거
			resultVO.setName(manageName);//vo에 세팅
			
			
			mav.addObject("projectInfo", resultVO); //프로젝트 매니저 페이지에서 쓸 정보 세팅
			mav.setViewName("projectManage.jsp");
			return mav;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="getMemberInfo.do",method=RequestMethod.POST)
	public List<ProjectManageVO> getMemberInfo(HttpSession session){
		ProjectDirVO vo = (ProjectDirVO)session.getAttribute("projectdir");
		List<ProjectManageVO> result = pmService.getMemberInfo(vo.getProject_id());
		for(ProjectManageVO temp : result) {
			System.out.println(temp.toString());
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteManager.do",method=RequestMethod.POST)
	public void deleteManager(ProjectManageVO pmVO,HttpSession session) {
		ProjectDirVO vo = (ProjectDirVO)session.getAttribute("projectdir");
		pmVO.setProjectId(vo.getProject_id());
		pmService.deleteManager(pmVO);
	}
	
	@ResponseBody
	@RequestMapping(value="addManager.do",method=RequestMethod.POST)
	public void addManager(ProjectManageVO pmVO,HttpSession session) {
		ProjectDirVO vo = (ProjectDirVO)session.getAttribute("projectdir");
		pmVO.setProjectId(vo.getProject_id());
		pmService.addManager(pmVO);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteProject.do",method=RequestMethod.POST)
	public void deleteProject(ProjectManageVO pmVO,HttpSession session) {
		ProjectDirVO vo = (ProjectDirVO)session.getAttribute("projectdir");
		int projectId = -vo.getProject_id();
		pmVO.setProjectId(vo.getProject_id());
		pmVO.setChangedProjectId(projectId);
		pmService.deleteProject(pmVO);
	}
	
	@RequestMapping(value="sendInvteMailView.do")
	public ModelAndView sendInvteMailView(ModelAndView mav) {
		mav.setViewName("invite.jsp");
		return mav;
	}
	
	@ResponseBody //사용자가 입력한 메일로 여러사람에게 메일 보내는 컨트롤러
	@RequestMapping(value="sendInviteMail.do", method=RequestMethod.POST)
	public String mailTest(ProjectManageVO pmVO,HttpServletRequest request, HttpSession session,
		@RequestParam(value="mailAddress[]")List<String> mailAddress) throws AddressException, MessagingException {
		
		HashMap<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("users",mailAddress);
		List<ProjectManageVO> result = pmService.joinedStatus(map);
		
		if(result.size() == mailAddress.size()) {
			pmService.sendInviteMail(mailAddress);
			ProjectDirVO vo = (ProjectDirVO) session.getAttribute("projectdir");
			
			pmVO.setProjectId(vo.getProject_id());
			
			for(int i=0; i<mailAddress.size(); i++) {
				pmVO.setEmail(mailAddress.get(i));
				pmService.addMemberProject(pmVO);
				pmService.addMemberLocker(pmVO);
			}
			
			return "success";
		}else {
			return "fail";
		}
		
	}
}
