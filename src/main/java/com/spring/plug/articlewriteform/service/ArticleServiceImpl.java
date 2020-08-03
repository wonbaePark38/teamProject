package com.spring.plug.articlewriteform.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.articlewriteform.dao.ArticleDAO;
import com.spring.plug.articlewriteform.vo.ArticleVO;

@Service
public class ArticleServiceImpl implements ArticleService{

	@Autowired
	private ArticleDAO dao;

	@Override
	public void insertArticle(ArticleVO vo) {
		
		dao.insertArticle(vo);
	}
	
	
}
