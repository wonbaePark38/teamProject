package com.spring.plug.adminsignup.service;

import com.spring.plug.adminsignup.vo.AdminVO;

public interface AdminLoginService {
	AdminVO getAdmin(AdminVO vo);
	AdminVO getSaltById(AdminVO vo);
	void defaultPassword(AdminVO vo) throws Exception;
	void changePassword(AdminVO vo);
}
