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
}
