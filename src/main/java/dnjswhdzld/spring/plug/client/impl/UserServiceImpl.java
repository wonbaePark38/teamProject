package dnjswhdzld.spring.plug.client.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dnjswhdzld.spring.plug.client.UserService;
import dnjswhdzld.spring.plug.client.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAOMybatis userDAO;
	
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
}
