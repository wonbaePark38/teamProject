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
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getUser",vo);
	}
	
	public UserVO getSocialUser(UserVO vo) {
		return (UserVO) sqlSessionTemplate.selectOne("UserDAO.getSocialUser",vo);
	}
	
	public String getSaltById(String email) {
		return sqlSessionTemplate.selectOne("UserDAO.getSaltById",email);
	}

	public void addSocialUser(UserVO vo) {
		sqlSessionTemplate.insert("UserDAO.addSocialUser", vo);
	}
	
	public UserVO checkEmail(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.checkEmail",vo);
	}
	
	public void updatePasswordAuthKey(UserVO vo) {
		sqlSessionTemplate.update("UserDAO.updatePasswordAuthKey", vo);
	}
	
	public void sendPasswordCheckEmail(UserVO vo) {
		sqlSessionTemplate.update("UserDAO.sendPasswordCheckEmail",vo);
	}
	public void changePasswordBytempPassword(UserVO vo) {
		sqlSessionTemplate.update("UserDAO.changePasswordBytempPassword",vo);
	}
	
	public void keepLogin(String email, String sessionId, Date sessionLimit) {
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
		sqlSessionTemplate.update("UserDAO.writeLoginDate",vo);
	}
	
	public void insertConnectionLog(int userId) {
		sqlSessionTemplate.insert("UserDAO.insertConnectionLog",userId);
	}
	
	public void updateDisconnectionLog(int userId) {
		sqlSessionTemplate.update("UserDAO.updateDisconnectionLog", userId);
	}
	
	public List<UserVO> userConnectionTime(UserVO vo) {
		return sqlSessionTemplate.selectList("UserDAO.userConnectionTime", vo);
	}
	
}

