package com.spring.plug.signup.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.plug.common.util.MailUtils;
import com.spring.plug.common.util.SHA256Util;
import com.spring.plug.common.util.TempKey;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.signup.dao.SignupDAO;

@Service
public class SignupServiceImpl implements SignupService {
	
	@Autowired
	private SignupDAO signupDAO;
	
	@Autowired
	private JavaMailSender mailSender;	
	
//	@Override
//	public void insertMember(UserVO vo) {
//		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		vo.setJoinDate(date); 
//		String salt = SHA256Util.generateSalt();
//		String password = vo.getPassword();
//		password = SHA256Util.getEncrypt(password, salt);
//		vo.setSalt(salt);
//		vo.setPassword(password);
//		signupDAO.insertMember(vo);
//	}
	
	public void updateAuthkey(UserVO vo) {
		signupDAO.updateAuthkey(vo);
	}
	
	@Override
	@Transactional
	public void insertMember(UserVO vo) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		vo.setJoinDate(date); 
		String salt = SHA256Util.generateSalt();
		String password = vo.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		vo.setSalt(salt);
		vo.setPassword(password);
		vo.setAuthKey("0");
		vo.setAuthStatus("0");
		signupDAO.insertMember(vo);

		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);
		vo.setAuthKey(authkey);
		signupDAO.updateAuthkey(vo);

		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);
		System.out.println(vo.getEmail());
		sendMail.setSubject("회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/plugProject/signConfirm.do?email=")
				.append(vo.getEmail())
				.append("&authkey=")
				.append(authkey)
				.append("' target='_blank'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("admin@wkddnjswhd.com", "원종띠");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
	}

	@Override
	public void updateAuthstatus(UserVO vo) {
		signupDAO.updateAuthstatus(vo);
	}
	
	@Override
	public UserVO selectAuthkey(UserVO vo) {
		return signupDAO.selectAuthkey(vo);
	}

	@Override
	public void addUserInfo(UserVO vo) {
		signupDAO.addUserInfo(vo);
	}

}
