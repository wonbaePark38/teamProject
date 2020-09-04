package com.spring.plug.mainpage.article.service;

import java.util.List;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;
import com.spring.plug.mainpage.article.vo.ArticleWorkerVO;

public interface ArticleService {
   
   

   void insertArticle(Article1VO vo);
   
   void insertReply(ArticleReplyVO vo);
   
   void insertWorker(ArticleWorkerVO vo);
   
   List<Article1VO> selectArticle(Article1VO vo);
   
   List<ArticleReplyVO> selectReply(ArticleReplyVO rvo);
   
}