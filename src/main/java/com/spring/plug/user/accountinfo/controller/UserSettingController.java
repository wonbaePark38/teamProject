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
			String uploadPath = "C:\\testFile\\"+strId +"\\" + infoVo.getProfileFileName();
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
		String fileName="";
		int id = user.getSeq();
		
		String strId = Integer.toString(id);
		String uploadPath = "C:\\testFile\\"+strId +"\\";
		MultipartFile uploadFile = vo.getProfileImg();
		
	
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
	     System.out.println("이미지 파일 이름"+fileName);
	     userSettingService.updateProfileImg(vo);
	     mav.setViewName("accountInfo.do");
		return mav;
	}
	
	//프로필 파일 페이지 로드됐을때 로컬에서 가저와서 화면엥 뿌려주는 컨트롤러
	@RequestMapping(value="/display.do", method=RequestMethod.GET) //저장된 프로필 사진 불러오는 컨트롤러 
	public void displayFile(HttpServletResponse res,HttpSession session) throws Exception{
		UserVO user = (UserVO)session.getAttribute("user");
		int id = user.getSeq();
		String strId = Integer.toString(id);
		UserSettingVO infoVo = userSettingService.getConfigUserInfo(id);
		String filePath = infoVo.getProfileFileName();
		
		String realFile = "C:\\testFile\\"+strId+"\\"+infoVo.getProfileFileName();
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
	@RequestMapping(value="changePassword.do", method=RequestMethod.POST)//비밀번호 변경 컨트롤러
	public ModelAndView changePassword(UserVO vo, HttpSession session,ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		String inputPassword =  SHA256Util.getEncrypt(vo.getPassword(), user.getSalt());
		user.setPassword(inputPassword);
		user.setPasswordAuthStatus("1");//임시 비밀번호인 사람 상태값 변경
		//vo.setSeq(user.getSeq());
		//vo.setPassword(inputPassword);
		userSettingService.changePassword(user);
		session.setAttribute("user", user);
		mav.setViewName("projectdir.do");
		return mav;
	}
	
	//잠금모드 세팅값 화면에 반영
	@RequestMapping(value="lockModeConfig.do")
	public ModelAndView lockModeView(UserVO vo, HttpSession session,ModelAndView mav) {
		vo = (UserVO)session.getAttribute("user");
		mav.addObject("setting",vo);
		mav.setViewName("lockModeConfig.jsp");
		return mav;
	}
	//잠금모드 설정 변경 적용 컨트롤러
	@RequestMapping(value="lockSetting.do", method=RequestMethod.POST) //잠금모드 세팅하는 컨트롤러
	public ModelAndView settingLockMode(UserVO vo, HttpSession session, ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		user.setLockTime(vo.getLockTime());
		
		vo.setSeq(user.getSeq()); //vo에 id 세팅
		if(vo.getLockSwitchStatus() == null) {//스위치 껐을때
			user.setLockSwitchStatus("off");
			
		} else { //스위치 켰을때
			user.setLockSwitchStatus("on");
		}
		session.setAttribute("user", user); //세션 새로 저장
		
		userSettingService.changeLockSetting(user);
		mav.setViewName("projectdir.do");
		return mav;
	}
	
	//잠금모드에서 입력한 비밀번호 체크 컨트롤러
	@ResponseBody
	@RequestMapping(value="lockPassword.do", method=RequestMethod.POST)
	public String checkPassword(HttpSession session,@RequestParam("password")String password) {
		UserVO user = (UserVO)session.getAttribute("user");
		if(user.getSocialCompare().equals("y")) { //소셜 로그인 한 사람
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
		
		mav.setViewName("connectManage.jsp");
		mav.addObject("vo",infoVo);
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
}
