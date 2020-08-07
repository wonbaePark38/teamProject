package com.spring.plug.mainpage.article.service;

import java.util.List;

import com.spring.plug.mainpage.article.vo.Article1VO;

public interface ArticleService {
	
   List<Article1VO> selectArticle(Article1VO vo);

   void insertArticle1(Article1VO vo);
   
   void insertArticle2(Article1VO vo);
   
   void insertArticle3(Article1VO vo);
   
   void insertArticle4(Article1VO vo);
   
   void insertArticle5(Article1VO vo);
}