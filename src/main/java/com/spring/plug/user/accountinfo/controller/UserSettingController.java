package com.spring.plug.user.accountinfo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.common.util.SHA256Util;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.user.accountinfo.service.UserSettingService;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

@Controller
public class UserSettingController {
	@Autowired
	UserSettingService userSettingService; 
	
	@RequestMapping("/accountInfo.do")//계정정보  컨트롤러
	public ModelAndView accountInfo(UserSettingVO vo, HttpSession session,ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		int id = user.getSeq();
		String strId = Integer.toString(id);
		
		UserSettingVO infoVo = userSettingService.getConfigUserInfo(id);
		//session.setAttribute("userInfo", infoVo);
		
		if(user.getSocialCompare().equals("Google")) {
			infoVo.setEmail(user.getEmail()+" (Google)");
		}else if(user.getSocialCompare().equals("Kakao")){
			infoVo.setEmail(user.getEmail()+" (Kakao)");
		}
		
		if(infoVo.getProfileFileName() != null) {
			String uploadPath = "/usr/local/tomcat/webapps/plugProject/upload/profileImage/"+strId +"/" + infoVo.getProfileFileName();
			vo.setProfileFileName(uploadPath);
		}
		
		mav.setViewName("accountInfo.jsp");
		mav.addObject("vo",infoVo);
		mav.addObject("user", user);
		return mav;
	}
	
	@ResponseBody //프로필 파일 바꾸는 컨트롤러
	@RequestMapping(value="profileImgChange.do",method=RequestMethod.POST)//프로필 이미지 변경 컨트롤러
	public ModelAndView changeImage(UserSettingVO vo, HttpSession session,ModelAndView mav)  throws IOException{
		UserVO user = (UserVO)session.getAttribute("user");
		
		UserSettingVO infoVo = userSettingService.getConfigUserInfo(user.getSeq());
		String fileName="";
		int id = user.getSeq();
		String strId = Integer.toString(id);
		String uploadPath = "/usr/local/tomcat/webapps/plugProject/upload/profileImage/"+strId +"/";
		MultipartFile uploadFile = vo.getProfileImg();
		
		String fullFileName = uploadPath + infoVo.getProfileFileName();
		File file = new File(fullFileName);
		if(file.exists()) {
			file.delete();
		}
		File destdir = new File(uploadPath);
		 if(!destdir.exists()) {
			 destdir.mkdirs();
		 }
		 
	     if (!uploadFile.isEmpty()) {
	         fileName = uploadFile.getOriginalFilename();
	         System.out.println(fileName);
	         uploadFile.transferTo(new File(uploadPath + fileName));
	      }
	     vo.setId(id);
	     vo.setProfileFileName(fileName);
	     userSettingService.updateProfileImg(vo);
	     mav.setViewName("accountInfo.do");
		return mav;
	}
	
	//프로필 파일 페이지 로드됐을때 서버에서 가저와서 화면엥 뿌려주는 컨트롤러
	@RequestMapping(value="/display.do", method=RequestMethod.GET) //저장된 프로필 사진 불러오는 컨트롤러 
	public void displayFile(HttpServletResponse res,HttpSession session) throws Exception{
		System.out.println("컨트롤러 진입");
		UserVO user = (UserVO)session.getAttribute("user");
		int id = user.getSeq();
		String strId = Integer.toString(id);
		UserSettingVO infoVo = userSettingService.getConfigUserInfo(id);
		String filePath = infoVo.getProfileFileName();
		System.out.println(filePath);
		String realFile = "/usr/local/tomcat/webapps/plugProject/upload/profileImage/"+strId +"/"+infoVo.getProfileFileName();
		int pos = filePath.lastIndexOf(".");
		String fileNm = filePath.substring(0, pos);
		String ext = filePath.substring(pos+1); 
		
		BufferedOutputStream out = null;
		InputStream in = null;

		try {
			res.setContentType("image/" + ext);
			res.setHeader("Content-Disposition", "inline;filename=" + fileNm);
			File file = new File(realFile);
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(res.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
	}
	
	/*비밀번호 변경 페이지 */
	@RequestMapping(value="settingPassword.do")
	public ModelAndView settingPasswordView(UserVO vo, HttpSession session, ModelAndView mav) {
		mav.setViewName("settingPassword.jsp");
		return mav;
	}
	//비밀번호 변경 컨트롤러
	@ResponseBody
	@RequestMapping(value="changePassword.do", method=RequestMethod.POST)//비밀번호 변경 컨트롤러
	public void changePassword(UserVO vo, HttpSession session,ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		String inputPassword =  SHA256Util.getEncrypt(vo.getPassword(), user.getSalt());
		user.setPassword(inputPassword);
		user.setPasswordAuthStatus("1");//임시 비밀번호인 사람 상태값 변경
		userSettingService.changePassword(user);
		session.setAttribute("user", user);
	}
	
	//페이지 로드 됐을때 기존에 설정해논 잠금모드 세팅값 화면에 반영
	@RequestMapping(value="lockModeConfig.do")
	public ModelAndView lockModeView(UserVO vo, HttpSession session,ModelAndView mav) {
		vo = (UserVO)session.getAttribute("user");
		mav.addObject("setting",vo);
		mav.setViewName("lockModeConfig.jsp");
		return mav;
	}
	
	//잠금모드 설정 변경 적용 컨트롤러
	@ResponseBody
	@RequestMapping(value="lockSetting.do", method=RequestMethod.POST) //잠금모드 세팅하는 컨트롤러
	public void settingLockMode(UserVO vo, HttpSession session, ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setSeq(user.getSeq());
		userSettingService.changeLockSetting(vo);
		user.setLockTime(vo.getLockTime());
		user.setLockSwitchStatus(vo.getLockSwitchStatus());
		session.setAttribute("user", user); //세션 새로 저장
	}
	
	//잠금모드에서 입력한 비밀번호 체크 컨트롤러
	@ResponseBody
	@RequestMapping(value="lockPassword.do", method=RequestMethod.POST)
	public String checkPassword(HttpSession session,@RequestParam("password")String password) {
		UserVO user = (UserVO)session.getAttribute("user");
		if(!user.getSocialCompare().equals("N")) { //소셜 로그인 한 사람
			if(password.equals(user.getEmail())) {
				return "true";
			}else {
				return "false";
			}
		}else { // 일반 로그인 한 사람
			String salt = user.getSalt();
			String userPassword = user.getPassword();
			System.out.println("입력받은 패스워드" + password);
			String inputPassword =  SHA256Util.getEncrypt(password, salt);
			if(inputPassword.equals(userPassword)) {
				System.out.println("같음");
				return "true";
			}else {
				System.out.println("틀림");
				return "false";
			}
		}
		
	}
	
	//pushAlramSetting.do
	//스크립트로 데이터 세팅값 넣어주는 컨트롤러
	@ResponseBody
	@RequestMapping(value="getSettings.do",method=RequestMethod.POST)
	public UserVO getSettings(UserSettingVO vo,HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		return user;
	}
	
	@RequestMapping(value="connectManage.do")
	public ModelAndView connectManage(UserSettingVO vo, HttpSession session, ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		int id = user.getSeq();
		
		UserSettingVO infoVo = userSettingService.getConfigUserInfo(id);
		String devices = infoVo.getConnectDevice();
		String loginHistory = infoVo.getLoginDate();
		String[] devicesArr = devices.split(",");
		String[] logHistoryArr = loginHistory.split(",");
		
		mav.setViewName("connectManage.jsp");
		mav.addObject("vo",infoVo);
		mav.addObject("connectDevices", devicesArr);
		mav.addObject("logHistoryArr", logHistoryArr);
		return mav;
	}
	
	//개인정보 업데이트 컨트롤러
	@ResponseBody
	@RequestMapping(value="updateAccountInfo.do",method=RequestMethod.POST)
	public void updateAccountInfo(UserSettingVO vo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setId(user.getSeq());
		System.out.println(vo.toString());
		userSettingService.updateAccountInfo(vo);
	}
	
	//푸시 알람 페이지 컨트롤러
	@RequestMapping(value="pushAlramConfig.do")
	public ModelAndView pushAlramConfig(UserVO vo, HttpSession session,ModelAndView mav) {
		vo = (UserVO)session.getAttribute("user");
		mav.setViewName("pushAlramSetting.jsp");
		return mav;
	}
	//푸시 알람 세팅페이지에서의 업데이트 컨트롤러
	@ResponseBody
	@RequestMapping(value="updatePushAlram.do",method=RequestMethod.POST)
	public void updatePushAlram(UserVO vo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setSeq(user.getSeq());
		
		if(vo.getChatAlram() == null) {
			vo.setChatAlram("false");
		}
		if(vo.getProjectAlram() == null) {
			vo.setProjectAlram("false");
		}
		userSettingService.updatePushAlram(vo);
		user.setProjectAlram(vo.getProjectAlram());
		user.setChatAlram(vo.getChatAlram());
		user.setPushAlram(vo.getPushAlram());
		
		session.setAttribute("user", user);
	}
	
	/*채팅창에서 알림버튼 눌렀을때 */
	@ResponseBody
	@RequestMapping(value="changeChatAlarm.do", method=RequestMethod.POST)
	public void changeChatAlarm(UserVO vo,HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		
		vo.setPushAlram("on"); //푸시알림부터 on으로 변경하고 받아온 값으로 db로 감
		vo.setSeq(user.getSeq());
		userSettingService.changeChatAlarm(vo);
		
		user.setChatAlram(vo.getChatAlram());
		System.out.println("------------------------->  " + user.getChatAlram());
		user.setPushAlram("on");
		session.removeAttribute("user");
		session.setAttribute("user", user);
		System.out.println(user.toString());
	}
}
