package com.spring.plug.user.accountinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
