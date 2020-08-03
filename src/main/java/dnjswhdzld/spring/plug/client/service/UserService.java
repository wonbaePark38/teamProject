package dnjswhdzld.spring.plug.client.service;

import java.util.List;

import dnjswhdzld.spring.plug.client.UserVO;

public interface UserService {
	void insertUser(UserVO vo);
	UserVO getUser(UserVO vo);
	List<UserVO> getUserList(UserVO vo);
}
