package com.spring.plug.mainpage.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.article.dao.ArticleDAO;
import com.spring.plug.mainpage.article.vo.Article1VO;
import com.spring.plug.mainpage.article.vo.ArticleReplyVO;
import com.spring.plug.mainpage.article.vo.ArticleWorkerVO;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDAO dao;

	
	@Override
	public void insertArticle(Article1VO vo) {

		dao.article1_insert(vo);
	}

	@Override
	public void insertWorker(ArticleWorkerVO vo) {
		dao.insertArticleWorker(vo);
	}

	@Override
	public void insertReply(ArticleReplyVO vo) {
		dao.reply_insert(vo);

	}
	
	@Override
	public List<Article1VO> selectArticle(Article1VO vo) {

		return dao.article_select(vo);
	}

	@Override
	public List<ArticleReplyVO> selectReply(ArticleReplyVO rvo) {

		return dao.reply_select(rvo);
	}

	@Override
	public void updateArticlePixed(Article1VO vo) {
		dao.updateArticlePixed(vo);
	}

	@Override
	public List<Article1VO> getArticlePixedList(Article1VO vo) {
		return dao.getArticlePixedList(vo);
	}

	@Override
	public List<Article1VO> getTaskList(Article1VO vo) {
		return dao.getTaskList(vo);
	}

	@Override
	public List<ArticleWorkerVO> getTodoList(ArticleWorkerVO vo) {
		return dao.getTodoList(vo);
	}

	@Override
	public List<Article1VO> getTaskStatusList(Article1VO vo) {
		return dao.getTaskStatusList(vo);
	}

	@Override
	public void updateTodoSuccess(ArticleWorkerVO wvo) {
		dao.updateTodoSuccess(wvo);
	}

	@Override
	public void deleteArticle(Article1VO vo) {
		dao.deleteArticle(vo);
	}

	@Override
	public void deleteTodo(ArticleWorkerVO wvo) {
		dao.deleteTodo(wvo);
	}

	@Override
	public void mergeArticleLookup(Article1VO vo) {
		dao.mergeArticleLookup(vo);
	}

	@Override
	public List<Article1VO> getArticleLookupList(Article1VO vo) {
		return dao.getArticleLookupList(vo);
	}

	@Override
	public void updateArticleModified(Article1VO vo) {
		dao.updateArticleModified(vo);
	}

	@Override
	public void updateReply(ArticleReplyVO vo) {
		dao.updateReply(vo);
	}

	@Override
	public void deleteReply(ArticleReplyVO vo) {
		dao.deleteReply(vo);
	}

}