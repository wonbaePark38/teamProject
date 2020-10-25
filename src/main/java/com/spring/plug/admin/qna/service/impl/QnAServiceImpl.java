package com.spring.plug.admin.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.plug.admin.qna.dao.QnADAO;
import com.spring.plug.admin.qna.service.QnAService;
import com.spring.plug.admin.qna.vo.QnAVO;


@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO qnaDAO;
	
	@Override
	public void insertBoard(QnAVO vo) {
		qnaDAO.insertBoard(vo);
	}
	
	@Override
	public QnAVO getBoard(QnAVO vo) {
		return qnaDAO.getBoard(vo);
	}
	
	@Override
	@Transactional
	public List<QnAVO> getBoardList(QnAVO vo) {
		return qnaDAO.getBoardList(vo);
	}

	@Override
	public void updateBoard(QnAVO vo) {
		qnaDAO.updateBoard(vo);
		
	}
	
}
