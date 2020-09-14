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
   
   // 고정 게시글
   void updateArticlePixed(Article1VO vo);
   
   // 고정글 리스트
   List<Article1VO> getArticlePixedList(Article1VO vo);
   
   // 업무 담당자
   List<Article1VO> getTaskList(Article1VO vo);
}