package com.spring.plug.mainpage.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.article.dao.ArticleDAO;
import com.spring.plug.mainpage.article.vo.Article1VO;

@Service
public class ArticleServiceImpl implements ArticleService{

   @Autowired
   private ArticleDAO dao;
   
   
   @Override
	public List<Article1VO> selectArticle(Article1VO vo) {
	   
		return dao.article_select(vo);
	}
  
   
   
   
   @Override
   public void insertArticle(Article1VO vo) {
      
      dao.article1_insert(vo);
   }

   
   
   
   
   





	
   
   
   
   
   
   
}