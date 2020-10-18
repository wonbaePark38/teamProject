package com.spring.plug.mainpage.article.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.chat.handler.ReplyEchochoHandler;
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
      sqlSessionTemplate.insert("ArticleDAO.articleInsert",vo);
   }
   
   public void reply_insert(ArticleReplyVO vo) {
	   sqlSessionTemplate.insert("ArticleDAO.replyInsert",vo);
   }
   
   
   public List<Article1VO> article_select(Article1VO vo){
	      
	      return sqlSessionTemplate.selectList("ArticleDAO.articleSelectAll",vo);
	   }
  
   public List<ArticleReplyVO> reply_select(ArticleReplyVO rvo){
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
   
   // 게시글 삭제
   public void deleteArticle(Article1VO vo) {
	   sqlSessionTemplate.delete("ArticleDAO.deleteArticle",vo);
   }
   // 등록된 할일 삭제
   public void deleteTodo(ArticleWorkerVO wvo) {
	   sqlSessionTemplate.delete("ArticleDAO.deleteTodo",wvo);
   }
   
   // 담아두기
   public void mergeArticleLookup(Article1VO vo) {
	   sqlSessionTemplate.update("ArticleDAO.mergeArticleLookup",vo);
   }
   
   // 담아두기 리스트
   public List<Article1VO> getArticleLookupList(Article1VO vo){
	   return sqlSessionTemplate.selectList("ArticleDAO.getArticleLookupList",vo);
   }
   
   // 게시글 수정하기
   public void updateArticleModified(Article1VO vo) {
	   sqlSessionTemplate.update("ArticleDAO.updateArticleModified",vo);
   }
   
   // 댓글 업데이트
   public void updateReply(ArticleReplyVO vo) {
	   sqlSessionTemplate.update("ArticleDAO.updateReply",vo);
   }
   
   // 댓글 삭제
   public void deleteReply(ArticleReplyVO vo) {
	   sqlSessionTemplate.delete("ArticleDAO.deleteReply",vo);
   }
}