package com.spring.plug.mainpage.article.service;

import java.util.List;

import com.spring.plug.mainpage.article.vo.Article1VO;

public interface ArticleService {
	
   List<Article1VO> selectArticle(Article1VO vo);

   void insertArticle(Article1VO vo);
   
}