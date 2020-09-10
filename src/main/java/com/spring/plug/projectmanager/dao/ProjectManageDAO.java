package com.spring.plug.projectmanager.dao;

import java.util.List;

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
		sqlSessionTemplate.update("ProjectManageDAO.changeDownProhibitionSetting", pmVO);
	}
	
	public List<ProjectManageVO> getUseStatistics(int projectId){
		System.out.println("-->mybatis로 프로젝트 사용자통계 셀렉트");
		return sqlSessionTemplate.selectList("ProjectManageDAO.getUseStatistics", projectId);
	}
}
