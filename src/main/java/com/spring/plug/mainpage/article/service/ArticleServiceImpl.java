package com.spring.plug.mainpage.article.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.article.dao.ArticleDAO;
import com.spring.plug.mainpage.article.vo.Article1VO;

@Service
public class ArticleServiceImpl implements ArticleService{

   @Autowired
   private ArticleDAO dao;

   @Override
   public void insertArticle1(Article1VO vo) {
      
      dao.article1_insert(vo);
   }

   
   
   
   
   @Override
   public void insertArticle2(Article1VO vo) {
      dao.article2_insert(vo);
      
   }





   @Override
   public void insertArticle3(Article1VO vo) {
      dao.article3_insert(vo);
      
   }
   
   
   
   
   
   
   
}