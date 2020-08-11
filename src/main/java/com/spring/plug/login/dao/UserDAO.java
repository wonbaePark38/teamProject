package com.spring.plug.login.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.login.vo.UserVO;


@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO getUser(UserVO vo) {
		System.out.println("--->MyBatis로  login 기능 처리");
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getUser",vo);
	}
	
	public UserVO getSocialUser(UserVO vo) {
		System.out.println("-->MyBatis로 소셜 login 기능 처리");
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getSocialUser",vo);
	}
	
	public String getSaltById(String email) {
		System.out.println("-->mybatis로 소트 알아오는 기능 처리");
		return sqlSessionTemplate.selectOne("UserDAO.getSaltById",email);
	}

	public void addSocialUser(UserVO vo) {
		System.out.println("소셜 로그인 신규 회원 추가");
		sqlSessionTemplate.insert("UserDAO.addSocialUser", vo);
	}
	
	public UserVO checkEmail(UserVO vo) {
		System.out.println("-->mybatis로 이메일 있는지 체크 기능");
		return sqlSessionTemplate.selectOne("UserDAO.checkEmail",vo);
	}
	
	public void updatePasswordAuthKey(UserVO vo) {
		System.out.println("비밀번호 변경 인증키 db에 추가 기능");
		sqlSessionTemplate.update("UserDAO.updatePasswordAuthKey", vo);
	}
	
	public void sendPasswordCheckEmail(UserVO vo) {
		System.out.println("비밀번호 변경 관련 이메일 발송 후 status 변경");
		sqlSessionTemplate.update("UserDAO.sendPasswordCheckEmail",vo);
	}
}

