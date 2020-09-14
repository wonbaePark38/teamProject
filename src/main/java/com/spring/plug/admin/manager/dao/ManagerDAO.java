package com.spring.plug.admin.manager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.admin.manager.vo.ManagerVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ManagerVO getUser() {
		System.out.println("회원수 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getUser");
	}
	
	public ManagerVO getProject() {
		System.out.println("프로젝트 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getProject");
	}
	
	public ManagerVO getArticle() {
		System.out.println("총게시글 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getArticle");
	}
	
	public List<ManagerVO> getUserList(ManagerVO vo) {
		System.out.println("사용자 리스트 불러오기");
		return sqlSessionTemplate.selectList("ManagerDAO.getUserList", vo);
	}
	
	public List<ManagerVO> getTimeLog(ManagerVO vo) {
		System.out.println("사용자 로그 불러오기");
		return sqlSessionTemplate.selectList("ManagerDAO.getTimeLog", vo);
	}
	
	public List<ManagerVO> getConnLog(ManagerVO vo) {
		System.out.println("사용자 접속 로그");
		return sqlSessionTemplate.selectList("ManagerDAO.getConnLog", vo);
	}
	
	public ManagerVO getArticleToday(ManagerVO vo) {
		System.out.println("오늘 게시글 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getArticleToday", vo);
	}
	
	public ManagerVO getProjectToday(ManagerVO vo) {
		System.out.println("오늘 게시글 불러오기");
		return sqlSessionTemplate.selectOne("ManagerDAO.getProjectToday", vo);
	}
	
	public List<ManagerVO> getProjectRank() {
		System.out.println("프로젝트 순위");
		return sqlSessionTemplate.selectList("ManagerDAO.getProjectRank");
	}
	
	
}
