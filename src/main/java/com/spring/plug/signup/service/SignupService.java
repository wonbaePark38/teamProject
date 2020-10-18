<<<<<<< HEAD
package com.spring.plug.signup.service;

import com.spring.plug.login.vo.UserVO;

public interface SignupService {

	void insertMember(UserVO vo) throws Exception;
	void updateAuthkey(UserVO vo);
	void updateAuthstatus(UserVO vo);
	UserVO selectAuthkey(UserVO vo);
	void addUserInfo(UserVO vo);
}
=======
package com.spring.plug.signup.service;

import com.spring.plug.login.vo.UserVO;

public interface SignupService {

	void insertMember(UserVO vo) throws Exception;
	void updateAuthkey(UserVO vo);
	void updateAuthstatus(UserVO vo);
	UserVO selectAuthkey(UserVO vo);
	void addUserInfo(UserVO vo);
}
>>>>>>> 2485aa6b5ca5b2210f0a2d564b19fea2b1ba724f
