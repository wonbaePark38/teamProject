package com.spring.plug.mainpage.article.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;
import com.spring.plug.mainpage.article.vo.ArticleWorkerVO;

@Repository
public class ArticleDAO{
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   public void insertArticleWorker(ArticleWorkerVO vo) {
		sqlSessionTemplate.insert("ArticleDAO.workerInsert",vo);
	}

   public void article1_insert(Article1VO vo) {
      System.out.println("article1 insert 기능 처리");
      System.out.println("dao : " + vo.toString());
      sqlSessionTemplate.insert("ArticleDAO.articleInsert",vo);
   }
   
   public void reply_insert(ArticleReplyVO vo) {
	   System.out.println("reply insert 기능 처리");
	   System.out.println("dao : " + vo.toString());
	   sqlSessionTemplate.insert("ArticleDAO.replyInsert",vo);
   }
   
   
   public List<Article1VO> article_select(Article1VO vo){
	      
	      return sqlSessionTemplate.selectList("ArticleDAO.articleSelectAll",vo);
	   }
  
   public List<ArticleReplyVO> reply_select(ArticleReplyVO rvo){
	   
	   System.out.println("댓글 : "+rvo.toString());
	   
	   return sqlSessionTemplate.selectList("ArticleDAO.replySelect",rvo);
   }
   
   // 상단 고정글 저장
   public void updateArticlePixed(Article1VO vo) {
	   sqlSessionTemplate.update("ArticleDAO.updateArticlePix",vo);
   }
   
   // 상단 게시글 리스트
   public List<Article1VO> getArticlePixedList(Article1VO vo){
	   return sqlSessionTemplate.selectList("ArticleDAO.getArticlePixedList",vo);
   }
   
   // 업무 담당자
   public List<Article1VO> getTaskList(Article1VO vo){
	   return sqlSessionTemplate.selectList("ArticleDAO.getTaskList",vo);
   }
   
   // 할일 리스트
   public List<ArticleWorkerVO> getTodoList(ArticleWorkerVO vo){
	   return sqlSessionTemplate.selectList("ArticleDAO.getTodoList",vo);
   }
   
   // 업무 통계
   public List<Article1VO> getTaskStatusList(Article1VO vo){
	   return sqlSessionTemplate.selectList("ArticleDAO.getTaskStatusList",vo);
   }
   
   // 할일 업데이트
   public void updateTodoSuccess(ArticleWorkerVO wvo) {
	   sqlSessionTemplate.update("ArticleDAO.updateTodoSuccess",wvo);
   }
}