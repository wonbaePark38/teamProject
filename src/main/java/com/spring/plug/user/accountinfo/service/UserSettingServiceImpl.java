package com.spring.plug.user.accountinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.user.accountinfo.dao.UserSettingDAO;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;
@Service
public class UserSettingServiceImpl implements UserSettingService{
	@Autowired 
	UserSettingDAO userSettingDAO;

	@Override
	public UserSettingVO getConfigUserInfo(int id) {
		return userSettingDAO.getConfigUserInfo(id);
	}

	@Override
	public void updateProfileImg(UserSettingVO vo) {
		userSettingDAO.updateProfileImg(vo);
	}
}
