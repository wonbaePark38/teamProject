package com.spring.plug.projectmanager.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.OrOperator;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.projectmanager.vo.ProjectManageVO;

@Repository
public class ProjectManageDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ProjectManageVO accessAuth(ProjectDirVO vo) {
		System.out.println("-->mybatis로 메니저페이지 접근 권한 검색");
		return sqlSessionTemplate.selectOne("ProjectManageDAO.accessAuth", vo);
	}
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
	
	public List<ProjectManageVO> getConnectionStatistics(ProjectManageVO pmVO){
		System.out.println("--->mybatis로 프로젝트 접속 통계 셀렉트");
		return sqlSessionTemplate.selectList("ProjectManageDAO.getConnectionStatistics", pmVO);
	}
	
	public List<ProjectManageVO> getRecentData(int projectId){
		System.out.println("-->mybatis로 프로젝트 기간별 통계 셀렉트");
		return sqlSessionTemplate.selectList("ProjectManageDAO.getRecentData", projectId);
	}
	
	public List<ProjectManageVO> getProjectInfo(int projectId) {
		System.out.println("-->mybatis로 프로젝트정보 셀렉트");
		return sqlSessionTemplate.selectList("ProjectManageDAO.getProjectInfo", projectId);
	}
	
	public List<ProjectManageVO> getMemberInfo(int projectId){
		System.out.println("--->mybatis로 프로젝트 구성원 정보 셀렉트");
		return sqlSessionTemplate.selectList("ProjectManageDAO.getMemberInfo", projectId);
	}
	
	public void deleteManager(ProjectManageVO pmVO) {
		System.out.println("--->mybatis로 프로젝트 매니저 해임 기능 구현");
		sqlSessionTemplate.update("ProjectManageDAO.deleteManager",pmVO);
	}
	
	public void addManager(ProjectManageVO pmVO) {
		System.out.println("--->mybatis로 프로젝트 매니저 추가 기능 구현");
		sqlSessionTemplate.update("ProjectManageDAO.addManager",pmVO);
	}
	
	public void deleteProject(ProjectManageVO pmVO) {
		System.out.println("--->mybatis로 프로젝트 삭제 기능 구현");
		sqlSessionTemplate.update("ProjectManageDAO.deleteProject", pmVO);
	}
	
	public List<ProjectManageVO> joinedStatus(HashMap<String, List<String>> map){
		return sqlSessionTemplate.selectList("ProjectManageDAO.joinedStatus",map);
	}
	
	public void addMemberProject(ProjectManageVO pmVO) {
		sqlSessionTemplate.insert("ProjectManageDAO.addMemberProject", pmVO);
	}
	
	public void addMemberLocker(ProjectManageVO pmVO) {
		sqlSessionTemplate.insert("ProjectManageDAO.addMemberLocker",pmVO);
	}
}
