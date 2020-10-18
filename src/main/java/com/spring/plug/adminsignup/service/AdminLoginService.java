<<<<<<< HEAD
package com.spring.plug.adminsignup.service;

import com.spring.plug.adminsignup.vo.AdminVO;

public interface AdminLoginService {
	AdminVO getAdmin(AdminVO vo);
	AdminVO getSaltById(AdminVO vo);
	void defaultPassword(AdminVO vo) throws Exception;
	void changePassword(AdminVO vo);
}
=======
package com.spring.plug.adminsignup.service;

import com.spring.plug.adminsignup.vo.AdminVO;

public interface AdminLoginService {
	AdminVO getAdmin(AdminVO vo);
	AdminVO getSaltById(AdminVO vo);
	void defaultPassword(AdminVO vo) throws Exception;
	void changePassword(AdminVO vo);
}
>>>>>>> 2485aa6b5ca5b2210f0a2d564b19fea2b1ba724f
