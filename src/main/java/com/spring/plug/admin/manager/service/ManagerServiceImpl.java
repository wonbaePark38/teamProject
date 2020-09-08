package com.spring.plug.admin.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.admin.manager.dao.ManagerDAO;
import com.spring.plug.admin.manager.vo.ManagerVO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerDAO managerDAO;
	
	
	@Override
	public ManagerVO getUser() {
		return managerDAO.getUser();
	}
	
	@Override
	public ManagerVO getProject() {
		return managerDAO.getProject();
	}

}
