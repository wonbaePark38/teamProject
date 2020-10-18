package com.spring.plug.admin.qna.service;


import java.util.List;

import com.spring.plug.admin.qna.vo.QnAVO;

public interface QnAService {

	void insertBoard(QnAVO vo);
	void updateBoard(QnAVO vo);
	QnAVO getBoard(QnAVO vo);
	List<QnAVO> getBoardList(QnAVO vo);
	
}
