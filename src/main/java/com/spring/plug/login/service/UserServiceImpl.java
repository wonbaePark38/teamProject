package com.spring.plug.login.service;



import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.spring.plug.login.dao.UserDAO;
import com.spring.plug.login.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private JavaMailSenderImpl javaMailSender;
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}


	@Override
	public UserVO getSocialUser(UserVO vo) {
		return userDAO.getSocialUser(vo);
	}

	
	@Override
	public void addSocialUser(UserVO vo) {
		userDAO.addSocialUser(vo);
	}


	@Override
	public UserVO checkEmail(UserVO vo) {
		return userDAO.checkEmail(vo);
	}


	@Override
	public void updatePasswordAuthKey(UserVO vo) {
		System.out.println("비밀번호 변경 관련 키 db에 추가");
		userDAO.updatePasswordAuthKey(vo);
		
	}


	@Override
	public String sendPasswordCheckEmail(UserVO vo)  throws Exception {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override 
			public void prepare(MimeMessage mimeMessage) throws Exception { 
				int randomNumber = (int)(Math.random()*1000000)+100000;
				String password = Integer.toString(randomNumber);
				String email = vo.getEmail();
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom("admin@wkddnjswhd.com", "원종띠"); 
				helper.setTo(vo.getEmail()); 
				helper.setSubject("flow 이메일 인증"); 
				helper.setText("<h1>[이메일 인증]</h1>"+
						"<p>아래 버튼을 클릭해야만 인증이 완료되고 로그인 페이지로 이동합니다.</p>"+
						"<p>아래의 비밀번호로 로그인 후에 비밀번호 변경해 주시기 바랍니다.</p>"+
						"<p>"+password+"</p>"+
						"<form action='http://ec2-13-124-251-3.ap-northeast-2.compute.amazonaws.com/plugProject/passlogin.do' method='POST'>"+
						"<input type='hidden' name=email value="+
						email + '>'+
						"<input type='hidden' name=password value="+
						password + '>'+
						"<input type='submit' value='로그인 페이지로 이동'>"+
						"</form>",true);
				
				} 
			}; 
			javaMailSender.send(preparator);
			return "result";
	}


	@Override
	public void changePasswordBytempPassword(UserVO vo) {
		System.out.println("임시비밀번호 발급자 db에 임시 비번 저장");
		userDAO.changePasswordBytempPassword(vo);
	}


	@Override
	public void keepLogin(String email, String sessionId, Date sessionLimit) {
		userDAO.keepLogin(email, sessionId, sessionLimit);
	}


	@Override
	public UserVO checkUserWithSessionKey(String sessionkey) {
		System.out.println("세션키 체크");
		return userDAO.checkUserWithSessionKey(sessionkey);
	}


	@Override
	public UserVO checkLoginBefore(String sessionId) throws Exception {
		return userDAO.checkUserWithSessionKey(sessionId);
	}


	@Override
	public void writeLoginDate(UserVO vo) {
		userDAO.writeLoginDate(vo);
	}


	@Override
	public void updateDisconnectionLog(int userId) {
		userDAO.updateDisconnectionLog(userId);
	}


	@Override
	public void insertConnectionLog(int userId) {
		userDAO.insertConnectionLog(userId);
	}

	
	@Override
	public List<UserVO> userConnectionTime(UserVO vo) {
		return userDAO.userConnectionTime(vo);
		
	}


}
