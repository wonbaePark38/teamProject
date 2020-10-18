package com.spring.plug.chat.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.vo.UserVO;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ChatRoomVO> getChatList(int userId){ 
		return sqlSessionTemplate.selectList("ChatDAO.getChatList", userId);
	}
	
	public void insertMessage(MessageVO msgVO) {
		sqlSessionTemplate.insert("ChatDAO.insertMessage", msgVO);
	}
	
	public List<MessageVO> loadChatHistory(MessageVO msgVO){
		return sqlSessionTemplate.selectList("ChatDAO.loadChatHistory", msgVO);
	}
	
	public List<UserVO> getFriendList(int myId){
		return sqlSessionTemplate.selectList("ChatDAO.getFriendList", myId);
	}
	
	public void createRoom(ChatRoomVO roomVO) {
		sqlSessionTemplate.insert("ChatDAO.createChatRoom", roomVO);
	}
	
	public void createRoomStatus(ChatRoomVO roomVO) {
		sqlSessionTemplate.insert("ChatDAO.createRoomStatus", roomVO);
	}
	
	public void insertMember(Map<String, Object> infoData) {
		sqlSessionTemplate.insert("ChatDAO.insertMember", infoData);
	}
	public ChatRoomVO getChatRoomInfo(String chatRoomId) {
		return sqlSessionTemplate.selectOne("ChatDAO.getChatRoomInfo", chatRoomId);
	}
	
	public void updateConnectTime(ChatRoomVO roomVO) {
		sqlSessionTemplate.update("ChatDAO.updateConnectTime", roomVO);
	}
	
	public List<ChatRoomVO> getJoinedMember(ChatRoomVO roomVO) {
		return sqlSessionTemplate.selectList("ChatDAO.getJoinedMember", roomVO);
	}
	
	public void updateDisconnectTime(MessageVO msgVO) {
		sqlSessionTemplate.update("ChatDAO.updateDisconnectTime", msgVO);
	}
	
	public void addUserChatRoom(ChatRoomVO roomVO) {
		sqlSessionTemplate.update("ChatDAO.addUserChatRoom",roomVO);
	}
	
	public void addUserChatRoomStatus(Map<String, Object> infoData) {
		sqlSessionTemplate.update("ChatDAO.addUserChatRoomStatus",infoData);
	}
	
	public void updateChatRoomStatus(MessageVO vo) {
		sqlSessionTemplate.update("ChatDAO.updateChatRoomStatus",vo);
	}
	
	public void updateChatRoomName(ChatRoomVO roomVO) {
		sqlSessionTemplate.update("ChatDAO.updateChatRoomName",roomVO);
	}
	
	public void updateChatRoom(ChatRoomVO roomVO) {
		sqlSessionTemplate.update("ChatDAO.updateChatRoom",roomVO);
	}
	
	public void deleteChatUser(ChatRoomVO roomVO) {
		sqlSessionTemplate.delete("ChatDAO.deleteChatUser", roomVO);
	}
	public void updateUnreadCount(MessageVO vo) {
		sqlSessionTemplate.update("ChatDAO.updateUnreadCount", vo);
	}
	public List<MessageVO> getUnreadUser(MessageVO vo){
		return sqlSessionTemplate.selectList("ChatDAO.getUnreadUser", vo);
	}
	public List<MessageVO> getProjectList(int userId){
		return sqlSessionTemplate.selectList("ChatDAO.getProjectList", userId);
	}
	
}
