package com.spring.plug.user.accountinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

@Repository
public class UserSettingDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserSettingVO getConfigUserInfo(int id) {
		return sqlSessionTemplate.selectOne("UserSettingDAO.userConfig",id);
	}
	
	public void updateProfileImg(UserSettingVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.updateProfileImg", vo);
	}
	
	public void changePassword(UserVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.changePassword", vo);
	}
	
	public void changeLockSetting(UserVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.changeLockSetting",vo);
	}
	
	public UserSettingVO getSettings(int id) {
		return sqlSessionTemplate.selectOne("UserSettingDAO.getSettings",id);
	}
	
	public void updateAccountInfo(UserSettingVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.updateAccountInfo",vo);
	}
	
	public void updatePushAlram (UserVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.updatePushAlram",vo);
	}
	
	public void changeChatAlarm (UserVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.changeChatAlarm",vo);
	}
	
	
}
