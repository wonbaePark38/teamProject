package com.spring.plug.login.service;



import java.util.Date;
import java.util.List;

import com.spring.plug.login.vo.UserVO;

public interface UserService {
	UserVO getUser(UserVO vo);
	UserVO getSocialUser(UserVO vo);
	void addSocialUser(UserVO vo);
	UserVO checkEmail(UserVO vo);
	void updatePasswordAuthKey(UserVO vo);
	void sendPasswordCheckEmail(UserVO vo) throws Exception;
	void changePasswordBytempPassword(UserVO vo);
	void keepLogin(String email, String sessionId, Date sessionLimit);
	UserVO checkLoginBefore(String sessionId) throws Exception;
	UserVO checkUserWithSessionKey(String sessionkey);
	void writeLoginDate(UserVO vo);
	void updateDisconnectionLog(int userId);
	void insertConnectionLog(int userId);
	
	List<UserVO> userConnectionTime();
}
