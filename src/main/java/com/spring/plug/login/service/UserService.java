package com.spring.plug.login.service;

import com.spring.plug.login.vo.UserVO;

public interface UserService {
	public UserVO getUser(UserVO vo);
	public UserVO getSocialUser(UserVO vo);
	public String getSaltById(String email);
	
}
