package com.spring.plug.admin.manager.service;

import java.util.List;

import com.spring.plug.admin.manager.vo.ManagerVO;

public interface ManagerService {
	ManagerVO getUser();
	ManagerVO getProject();
	List<ManagerVO> getUserList(ManagerVO vo);
	List<ManagerVO> getTimeLog(ManagerVO vo);
	List<ManagerVO> getConnLog(ManagerVO vo);
}
