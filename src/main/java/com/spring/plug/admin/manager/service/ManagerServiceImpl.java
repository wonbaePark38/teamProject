package com.spring.plug.admin.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	@Transactional
	public List<ManagerVO> getUserList(ManagerVO vo) {
		return managerDAO.getUserList(vo);
	}
	
	@Override
	@Transactional
	public List<ManagerVO> getTimeLog(ManagerVO vo) {
		return managerDAO.getTimeLog(vo);
	}

	@Override
	@Transactional
	public List<ManagerVO> getConnLog(ManagerVO vo) {
		return managerDAO.getConnLog(vo);
	}
	
}
