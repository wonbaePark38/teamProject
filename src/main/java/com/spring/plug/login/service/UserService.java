package com.spring.plug.login.service;

import com.spring.plug.login.vo.UserVO;

public interface UserService {
	public UserVO getUser(UserVO vo);
	public UserVO getSocialUser(UserVO vo);
	public String getUserEmail();
	public String getSaltById(String email);
	public void addSocialUser(UserVO vo);
	
}
