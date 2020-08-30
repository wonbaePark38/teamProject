package com.spring.plug.chat.dao;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ChatRoomVO> getChatList(int userId){ 
		System.out.println("-->mybatis로 getChatList 기능처리");
		return sqlSessionTemplate.selectList("ChatDAO.getChatList", userId);
	}
	
	public void insertMessage(MessageVO msgVO) {
		System.out.println("-->mybatis로 insesrt메시지 기능처리");
		sqlSessionTemplate.insert("ChatDAO.insertMessage", msgVO);
	}
	
	public List<MessageVO> loadChatHistory(MessageVO msgVO){
		System.out.println("-->mybatis로 loadChatHistory 기능 처리");
		return sqlSessionTemplate.selectList("ChatDAO.loadChatHistory", msgVO);
	}
	
	public List<ChatRoomVO> getJoinProjectList(int myId){
		System.out.println("-->mybatis로 getJoinProjectList 기능처리");
		return sqlSessionTemplate.selectList("ChatDAO.getJoinProjectList", myId);
	}
	
	public void createRoom(ChatRoomVO roomVO) {
		System.out.println("-->mybatis로 createRoom 기능 처리");
		sqlSessionTemplate.insert("ChatDAO.createChatRoom", roomVO);
	}
	
	public ChatRoomVO getChatRoomInfo(ChatRoomVO roomVO) {
		System.out.println("-->mybatis로 getChatRoomInfo 기능 처리");
		return sqlSessionTemplate.selectOne("ChatDAO.getChatRoomInfo", roomVO);
	}
}
