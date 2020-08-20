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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.user.accountinfo.service.UserSettingService;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

@Controller
public class UserSettingController {
	@Autowired
	UserSettingService userSettingService; 
	
	/*@RequestMapping(value="accountInfo.do", method=RequestMethod.GET)
	public ModelAndView accountInfoView(UserSettingVO vo, HttpSession session,ModelAndView mav) {
		mav.setViewName("accountInfo.jsp");
		return mav;
	}*/
	
	@RequestMapping("/accountInfo.do")
	public ModelAndView accountInfo(UserSettingVO vo, HttpSession session,ModelAndView mav) {
		UserVO user = (UserVO)session.getAttribute("user");
		int id = user.getSeq();
		String strId = Integer.toString(id);
		UserSettingVO infoVo = userSettingService.getConfigUserInfo(id);
		System.out.println("파일이름 >" + infoVo.getProfileFileName());
		String uploadPath = "C:\\testFile\\"+strId +"\\" + infoVo.getProfileFileName();
		
		vo.setProfileFileName(uploadPath);
		mav.setViewName("accountInfo.jsp");
		mav.addObject("vo",infoVo);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="profileImgChange.do",method=RequestMethod.POST)
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
	
	@RequestMapping(value="/display.do", method=RequestMethod.GET)
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
}
