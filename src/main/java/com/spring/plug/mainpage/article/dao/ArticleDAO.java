package com.spring.plug.mainpage.article.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.article.vo.Article1VO;

@Repository
public class ArticleDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void article1_insert(Article1VO vo) {
		System.out.println("article1 insert 기능 처리");
		System.out.println("dao : " + vo.toString());
		sessionTemplate.insert("ArticleDAO.article1Insert",vo);
	}
	
	public void article2_insert(Article1VO vo) {
		System.out.println("article1 insert 기능 처리");
		System.out.println("dao : " + vo.toString());
		sessionTemplate.insert("ArticleDAO.article2Insert",vo);
	}
}
