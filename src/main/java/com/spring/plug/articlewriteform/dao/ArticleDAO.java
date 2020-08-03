package com.spring.plug.articlewriteform.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.articlewriteform.vo.ArticleVO;

@Repository
public class ArticleDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void insertArticle(ArticleVO vo) {
		System.out.println("insert 기능 처리");
		System.out.println("dao : " + vo.toString());
		sessionTemplate.insert("ArticleDAO.articleInsert",vo);
	}
}
