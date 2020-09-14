package com.spring.plug.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.chat.dao.ChatDAO;
import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.vo.UserVO;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDAO chatDAO;
	
	@Override
	public List<ChatRoomVO> getChatList(int userId) {
		return chatDAO.getChatList(userId);
	}

	@Override
	public void insertMessage(MessageVO msgVO) {
		chatDAO.insertMessage(msgVO);
	}

	@Override
	public List<MessageVO> loadChatHistory(MessageVO msgVO) {
		return chatDAO.loadChatHistory(msgVO);
	}

	@Override
	public List<UserVO> getFriendList(int myId) {
		return chatDAO.getFriendList(myId);
	}

	@Override
	public void createRoom(ChatRoomVO roomVO) {
		chatDAO.createRoom(roomVO);
	}

	@Override
	public void createRoomStatus(ChatRoomVO roomVO) {
		chatDAO.createRoomStatus(roomVO);
	}
	
	
	
	@Override
	public ChatRoomVO getChatRoomInfo(String chatRoomId) {
		return chatDAO.getChatRoomInfo(chatRoomId);
	}

	@Override
	public void updateConnectTime(ChatRoomVO roomVO) {
		chatDAO.updateConnectTime(roomVO);
	}

	@Override
	public List<ChatRoomVO> getJoinedMember(ChatRoomVO roomVO) {
		return chatDAO.getJoinedMember(roomVO);
	}

	@Override
	public void updateDisconnectTime(MessageVO msgVO) {
		chatDAO.updateDisconnectTime(msgVO);
		
	}

	@Override
	public void insertMember(Map<String, Object> infoData) {
		chatDAO.insertMember(infoData);
	}

	public void addUserChatRoom(ChatRoomVO roomVO) {
		chatDAO.addUserChatRoom(roomVO);
	}
	
	public void addUserChatRoomStatus(Map<String, Object> infoData) {
		chatDAO.addUserChatRoomStatus(infoData);
	}

	@Override
	public void updateChatRoomStatus(MessageVO vo) {
		chatDAO.updateChatRoomStatus(vo);
	}

	@Override
	public void updateChatRoomName(ChatRoomVO roomVO) {
		chatDAO.updateChatRoomName(roomVO);
	}

	@Override
	public void updateChatRoom(ChatRoomVO roomVO) {
		chatDAO.updateChatRoom(roomVO);
	}

	@Override
	public void deleteChatUser(ChatRoomVO roomVO) {
		chatDAO.deleteChatUser(roomVO);
	}

	@Override
	public void updateUnreadCount(MessageVO vo) {
		chatDAO.updateUnreadCount(vo);
	}

	@Override
	public List<MessageVO> getUnreadUser(MessageVO vo) {
		return chatDAO.getUnreadUser(vo);
	}

	@Override
	public List<MessageVO> getProjectList(int userId) {
		return chatDAO.getProjectList(userId);
	}

}
