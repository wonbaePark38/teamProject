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
		System.out.println("-->mybatis로 계정info 알아오는 기능 처리");
		return sqlSessionTemplate.selectOne("UserSettingDAO.userConfig",id);
	}
	
	public void updateProfileImg(UserSettingVO vo) {
		System.out.println("-->mybatis로 프로필 사진 db 업데이트 기능 처리");
		sqlSessionTemplate.update("UserSettingDAO.updateProfileImg", vo);
	}
	
	public void changePassword(UserVO vo) {
		System.out.println("-->mybatis로 비밀번호 변경 기능 처리");
		sqlSessionTemplate.update("UserSettingDAO.changePassword", vo);
	}
	
	public void changeLockSetting(UserVO vo) {
		System.out.println("-->mybatis로 잠금모드세팅 변경 기능 처리");
		sqlSessionTemplate.update("UserSettingDAO.changeLockSetting",vo);
	}
	
	public UserSettingVO getSettings(int id) {
		System.out.println("-->mybatis로 환경설정값 모두 가저오는 기능 처리");
		return sqlSessionTemplate.selectOne("UserSettingDAO.getSettings",id);
	}
	
	public void updateAccountInfo(UserSettingVO vo) {
		sqlSessionTemplate.update("UserSettingDAO.updateAccountInfo",vo);
	}
	
	public void updatePushAlram (UserVO vo) {
		System.out.println("--> mybatis로 푸시알림 설정 업데이트 기능처리 ");
		sqlSessionTemplate.update("UserSettingDAO.updatePushAlram",vo);
	}
	
	public void changeChatAlarm (UserVO vo) {
		System.out.println("--> mybatis로 채팅 알림설정 업데이트 기능처리 ");
		sqlSessionTemplate.update("UserSettingDAO.changeChatAlarm",vo);
	}
	
	
}
