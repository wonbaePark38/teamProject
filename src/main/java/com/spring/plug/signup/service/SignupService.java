package com.spring.plug.signup.service;

import com.spring.plug.login.vo.UserVO;

public interface SignupService {

	void insertMember(UserVO vo) throws Exception;
	void updateAuthkey(UserVO vo);
	void updateAuthstatus(UserVO vo);
	UserVO selectAuthkey(UserVO vo);
	void addUserInfo(UserVO vo);
}
