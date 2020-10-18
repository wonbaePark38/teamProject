package com.spring.plug.adminsignup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.plug.adminsignup.dao.AdminLoginDAO;
import com.spring.plug.adminsignup.vo.AdminVO;
import com.spring.plug.common.util.MailUtils;
import com.spring.plug.common.util.SHA256Util;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDAO alDAO;
	@Autowired
	private JavaMailSender mailSender;	
	
	@Override
	public AdminVO getAdmin(AdminVO vo) {
		return alDAO.getAdmin(vo);
	}
	
	@Override
	public AdminVO getSaltById(AdminVO vo) {
		System.out.println("서비스임플 호출");
		return alDAO.getSaltById(vo);
	}
	
	@Override
	public void defaultPassword(AdminVO vo) throws Exception {
		String salt = SHA256Util.generateSalt();
		int randomNumber = (int)(Math.random()*10000)+1000;
		String password = Integer.toString(randomNumber);
		password = SHA256Util.getEncrypt(password, salt);
		vo.setSalt(salt);
		vo.setPassword(password);
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("flow 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래의 임시 비밀번호를 입력하고 로그인 후에 비밀번호 변경해 주시기 바랍니다.</p>")
				.append("<p>"+randomNumber+"</p>")
				.toString());
		sendMail.setFrom("admin@wkddnjswhd.com", "원종띠");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
		alDAO.defaultPassword(vo);
	}
	
	@Override
	public void changePassword(AdminVO vo) {
		alDAO.changePassword(vo);
	}

}
