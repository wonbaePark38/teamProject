package com.spring.plug.chat.service;

import java.util.List;

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
	public ChatRoomVO getChatRoomInfo(ChatRoomVO roomVO) {
		return chatDAO.getChatRoomInfo(roomVO);
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

}
