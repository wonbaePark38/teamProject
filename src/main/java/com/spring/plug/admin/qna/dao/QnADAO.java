package com.spring.plug.admin.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.admin.qna.vo.QnAVO;

@Repository
public class QnADAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertBoard(QnAVO vo) {
		System.out.println("---> MyBatis로 insertBoard() 기능 처리");
		sqlSessionTemplate.insert("QnADAO.insertBoard", vo);
	}
	
	public void updateBoard(QnAVO vo) {
		System.out.println("---> MyBatis로 updateBoard() 기능 처리");
		sqlSessionTemplate.update("QnADAO.updateBoard", vo);
	}
//	
//	public void deleteBoard(BoardVO vo) {
//		System.out.println("---> MyBatis로 deleteBoard() 기능 처리");
//		sqlSessionTemplate.delete("BoardDAO.deleteBoard", vo);
//	}
	
	public QnAVO getBoard(QnAVO vo) {
		System.out.println("---> MyBatis로 getBoard() 기능 처리");
		return (QnAVO) sqlSessionTemplate.selectOne("QnADAO.getBoard", vo);
	}
	
	public List<QnAVO> getBoardList(QnAVO vo) {
		System.out.println("---> MyBatis로 getBoardList() 기능 처리");
		return sqlSessionTemplate.selectList("QnADAO.getBoardList", vo);
	}
	
}
