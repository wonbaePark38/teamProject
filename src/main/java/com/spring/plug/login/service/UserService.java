package com.spring.plug.login.service;

import com.spring.plug.login.vo.UserVO;

public interface UserService {
	UserVO getUser(UserVO vo);
	UserVO getSocialUser(UserVO vo);
	String getSaltById(String email);
	void addSocialUser(UserVO vo);
	UserVO checkEmail(UserVO vo);
	void updatePasswordAuthKey(UserVO vo);
	void sendPasswordCheckEmail(UserVO vo) throws Exception;
}
