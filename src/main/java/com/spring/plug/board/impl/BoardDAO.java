package com.spring.plug.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.board.BoardVO;
@Repository
public class BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	public void insertBoard(BoardVO vo) {
		sqlSessionTemplate.insert("BoardDAO.insertBoard",vo);
	}
	
	public void updateBoard(BoardVO vo) {
		sqlSessionTemplate.update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		sqlSessionTemplate.delete("BoardDAO.deleteBoard", vo);
	}
		
	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO) sqlSessionTemplate.selectOne("BoardDAO.getBoard", vo);	
	}
	
	public List<BoardVO> getBoardList(BoardVO vo) {
		return sqlSessionTemplate.selectList("BoardDAO.getBoardList", vo);
	}
	/*위의 코드에서 구현된 각 메서드를 보면 두 개의 정보가 인자로 전달되고 있는데, 첫 번째 인자는
	실행될 SQL의 id 정보이다. 이때 SQL Mapper에 선언된 네임스페이스와 아이디를 조합하여 아이디
	를 지정해야 한다.
	 * 
	 * 두 번째 인자는 parameterType 속성으로 지정된 파라미터 객체이다.
	 */
}
