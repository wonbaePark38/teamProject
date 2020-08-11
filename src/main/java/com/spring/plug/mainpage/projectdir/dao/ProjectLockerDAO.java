package com.spring.plug.mainpage.projectdir.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.projectdir.vo.ProjectLockerVO;

@Repository
public class ProjectLockerDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertProjectLocker(ProjectLockerVO vo) {
		System.out.println("프로젝트 보관함 설정 테이블 생성");
		sqlSessionTemplate.insert("ProjectLockerDAO.insertProjectLookup", vo);
	}

	
	public void projectDirFavorites(ProjectLockerVO vo) {
		System.out.println("즐겨찾기 설정");
		
	}
	
}
