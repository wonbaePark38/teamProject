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
		dao.worker_insert(vo);

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

}