package com.spring.plug.mainpage.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.article.dao.ArticleDAO;
import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;

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




	@Override
	public void insertReply(ArticleReplyVO vo) {
		dao.reply_insert(vo);
		
	}




	@Override
	public List<ArticleReplyVO> selectReply(ArticleReplyVO rvo) {
		
		
		return dao.reply_select(rvo);
	}
	
	
   
}