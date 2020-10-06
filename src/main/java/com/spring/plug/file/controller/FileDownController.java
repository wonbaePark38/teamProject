package com.spring.plug.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.plug.file.service.FileService;
import com.spring.plug.file.vo.FileVO;

@Controller
public class FileDownController {
	@Autowired
	FileService fileService;
	
	@ResponseBody
	@RequestMapping(value="fileDownload.do")
	public void fileDownload(FileVO vo, HttpServletRequest request, HttpServletResponse response) {
		String articleId = request.getParameter("articleId");
		int articleNumber = Integer.parseInt(articleId);
		vo = fileService.getFilePath(articleNumber);
		System.out.println(vo.toString());
		String fileName = vo.getFileName();
		System.out.println(request.getRequestURI());

		String browser = request.getHeader("User-Agent");
		try {
			if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
			} else {
				fileName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
			}
		} catch(UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException 에러입니다");
		}
		String realFileName = vo.getFilePath();
		
		File file1 = new File(realFileName);
		if(!file1.exists()) {
			return ;
		}
		
		//파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\"");
		
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFileName);
			
			int ncount = 0;
			byte[] bytes = new byte[512];
			
			while((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0 , ncount);
			}
			fis.close();
			os.close();
		}catch (Exception e) {
			System.out.println("파일이 없습니다" + e);
		}
	}
}
