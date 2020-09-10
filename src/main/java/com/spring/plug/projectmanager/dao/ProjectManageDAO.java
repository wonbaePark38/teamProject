package com.spring.plug.projectmanager.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.projectmanager.vo.ProjectManageVO;

@Repository
public class ProjectManageDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String getDownProhibition(int projectId) {
		System.out.println("-->mybatis로 다운로드 금지 상태 셀렉트" + projectId);
		return sqlSessionTemplate.selectOne("ProjectManageDAO.getDownProhibition", projectId);
	}
	
	public void changeDownProhibitionSetting(ProjectManageVO pmVO) {
		System.out.println("-->mybatis로 다운로드 금지 세팅 변경");
		sqlSessionTemplate.update("changeDownProhibitionSetting", pmVO);
	}
}
