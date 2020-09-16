package com.spring.plug.file.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.file.vo.FileVO;

@Repository
public class FileDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<FileVO> getProjectList(int loginUser){
		System.out.println("-->mybatis로 getProjectList()기능처리");
		return sqlSessionTemplate.selectList("FileDAO.getProjectList", loginUser);
	}
	
	public FileVO getFilePath(int articleId) {
		System.out.println("-->mybatis로 파일 리얼패스 알아옴");
		return sqlSessionTemplate.selectOne("FileDAO.getFilePath", articleId);
	}
	
	public FileVO getRealPath(int articleId) {
		System.out.println("--->mybatis로 리얼패스 알아옴");
		return sqlSessionTemplate.selectOne("FileDAO.getRealPath", articleId);
	}
}
