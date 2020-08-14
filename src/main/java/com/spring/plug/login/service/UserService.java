package com.spring.plug.login.service;



import java.util.Date;

import com.spring.plug.login.vo.UserVO;

public interface UserService {
	UserVO getUser(UserVO vo);
	UserVO getSocialUser(UserVO vo);
	String getSaltById(String email);
	void addSocialUser(UserVO vo);
	UserVO checkEmail(UserVO vo);
	void updatePasswordAuthKey(UserVO vo);
	void sendPasswordCheckEmail(UserVO vo) throws Exception;
	void changePasswordBytempPassword(UserVO vo);
	public void keepLogin(String email, String sessionId, Date sessionLimit);
	public UserVO checkLoginBefore(String sessionId) throws Exception;
	public UserVO checkUserWithSessionKey(String sessionkey);
}
