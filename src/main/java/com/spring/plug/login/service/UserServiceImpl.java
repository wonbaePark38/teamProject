package com.spring.plug.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.plug.common.util.MailUtils;
import com.spring.plug.login.dao.UserDAO;
import com.spring.plug.login.vo.UserVO;

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
	public String getSaltById(String email) {
		System.out.println("서비스임플 호출");
		return userDAO.getSaltById(email);
	}
	
	@Override
	public void addSocialUser(UserVO vo) {
		System.out.println("소셜 로그인 회원 추가 호출");
		userDAO.addSocialUser(vo);
	}


	@Override
	public UserVO checkEmail(UserVO vo) {
		System.out.println("이메일체크 서비스임플 호출");
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
		int tempPassword = (int)(Math.random()*10000)+1000;
		String email = vo.getEmail();
		// mail 작성 관련 
				MailUtils sendMail = new MailUtils(mailSender);
				
				sendMail.setSubject("flow 이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("<p>아래 버튼을 클릭하시면 인증이 완료되고 로그인 페이지로 이동합니다.</p>")
						.append("<p>아래의 비밀번호를 입력하고 로그인 후에 비밀번호 변경해 주시기 바랍니다.</p>")
						.append("<p>"+tempPassword+"</p>")
						.append("<form action='http://localhost:8080/plugProject/passlogin.do' method='POST'>")
						.append("<input type='hidden' value=${email}>")
						.append("<input type='hidden' value=${tempPassword}>")
						.append("<input type='submit' value='플로우 홈페이지로 이동'>")
						.append("</form")
						//.append("<a href='http://localhost:8080/plugProject/passlogin.do")
						//.append("' target='_blank'>이메일 인증 확인</a>")
						.toString());
				sendMail.setFrom("admin@wkddnjswhd.com", "원종띠");
				sendMail.setTo(vo.getEmail());
				sendMail.send();
		vo.setPasswordAuthStatus("0");
		
		userDAO.sendPasswordCheckEmail(vo);
		
	}
	
}
