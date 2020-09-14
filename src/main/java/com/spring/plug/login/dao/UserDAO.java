package com.spring.plug.login.dao;





import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

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
	public void changePasswordBytempPassword(UserVO vo) {
		System.out.println("임시 비밀번호 db에 저장");
		sqlSessionTemplate.update("UserDAO.changePasswordBytempPassword",vo);
	}
	
	public void keepLogin(String email, String sessionId, Date sessionLimit) {
		System.out.println("세션 관련 데이터 db에 저장");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("email", email);
		map.put("sessionId",sessionId);
		map.put("sessionLimit", sessionLimit);
		sqlSessionTemplate.update("UserDAO.keepLogin",map);
	}
	
	public UserVO checkUserWithSessionKey(String sessionkey) {
		return sqlSessionTemplate.selectOne("UserDAO.checkUserWithSessionKey", sessionkey);
	}
	
	public void writeLoginDate(UserVO vo) {
		System.out.println("로그인 시간, 접속 컴퓨터 이름 db에 저장");
		sqlSessionTemplate.update("UserDAO.writeLoginDate",vo);
	}
	
	public void insertConnectionLog(int userId) {
		System.out.println("로그인 로그 기록 남김");
		sqlSessionTemplate.insert("UserDAO.insertConnectionLog",userId);
	}
	
	public void updateDisconnectionLog(int userId) {
		sqlSessionTemplate.update("UserDAO.updateDisconnectionLog", userId);
	}
	
	public List<UserVO> userConnectionTime(UserVO vo) {
		return sqlSessionTemplate.selectList("UserDAO.userConnectionTime", vo);
	}
	
}

