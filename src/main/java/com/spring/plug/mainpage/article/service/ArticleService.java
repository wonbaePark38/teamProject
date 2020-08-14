package com.spring.plug.mainpage.article.service;

import java.util.List;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;

public interface ArticleService {
   
   List<Article1VO> selectArticle(Article1VO vo);

   void insertArticle(Article1VO vo);
   
   void insertReply(ArticleReplyVO vo);
   
   List<ArticleReplyVO> selectReply(ArticleReplyVO rvo);
   
}