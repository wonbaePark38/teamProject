package com.spring.plug.login.service;



import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.plug.common.util.MailUtils;
import com.spring.plug.login.dao.UserDAO;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private JavaMailSender mailSender;	
	
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
	public void sendPasswordCheckEmail(UserVO vo)  throws Exception {
		System.out.println("비밀번호 변경 관련 이메일 보내기");
		int randomNumber = (int)(Math.random()*1000000)+100000;
		String password = Integer.toString(randomNumber);
		String email = vo.getEmail();
		// mail 작성 관련 
				MailUtils sendMail = new MailUtils(mailSender);
				
				sendMail.setSubject("flow 이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("<p>아래 버튼을 클릭해야만 인증이 완료되고 로그인 페이지로 이동합니다.</p>")
						.append("<p>아래의 비밀번호로 로그인 후에 비밀번호 변경해 주시기 바랍니다.</p>")
						.append("<p>"+password+"</p>")
						.append("<form action='http://localhost:8080/plugProject/passlogin.do' method='POST'>")
						.append("<input type='hidden' name=email value=")
						.append(email + '>')
						.append("<input type='hidden' name=password value=")
						.append(password + '>')
						
						.append("<input type='submit' value='로그인 페이지로 이동'>")
						.append("</form")
						.toString());
				sendMail.setFrom("admin@wkddnjswhd.com", "원종띠");
				sendMail.setTo(vo.getEmail());
				sendMail.send();
		vo.setPasswordAuthStatus("0");
		userDAO.sendPasswordCheckEmail(vo);
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
