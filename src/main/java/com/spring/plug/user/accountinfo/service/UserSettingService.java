package com.spring.plug.user.accountinfo.service;

import com.spring.plug.login.vo.UserVO;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

public interface UserSettingService {
	
	UserSettingVO getConfigUserInfo(int id);
	void updateProfileImg(UserSettingVO vo);
	void changePassword(UserVO vo);
	void changeLockSetting(UserVO vo);
	UserSettingVO getSettings(int id);
	void updateAccountInfo(UserSettingVO vo);
	void updatePushAlram(UserVO vo);
	void changeChatAlarm(UserVO vo);
}
