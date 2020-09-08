package com.spring.plug.user.accountinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.login.vo.UserVO;
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

	@Override
	public void changePassword(UserVO vo) {
		userSettingDAO.changePassword(vo);
	}

	@Override
	public void changeLockSetting(UserVO vo) {
		userSettingDAO.changeLockSetting(vo);
	}

	@Override
	public UserSettingVO getSettings(int id) {
		return userSettingDAO.getSettings(id);
	}

	@Override
	public void updateAccountInfo(UserSettingVO vo) {
		userSettingDAO.updateAccountInfo(vo);
	}

	@Override
	public void updatePushAlram(UserVO vo) {
		userSettingDAO.updatePushAlram(vo);
	}

	@Override
	public void changeChatAlarm(UserVO vo) {
		userSettingDAO.changeChatAlarm(vo);
	}
	
	
}
