package com.spring.plug.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FileDownController {
	@ResponseBody
	@RequestMapping(value="fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) {
		String fileName = request.getParameter("fileName");
		String realFileName = "";
		System.out.println(fileName);
		
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
		realFileName = "C:\\testFile\\" + fileName;
		System.out.println(realFileName);
		
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
