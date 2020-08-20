package com.spring.plug.user.accountinfo.service;

import com.spring.plug.user.accountinfo.vo.UserSettingVO;

public interface UserSettingService {
	
	UserSettingVO getConfigUserInfo(int id);
	void updateProfileImg(UserSettingVO vo);
}
