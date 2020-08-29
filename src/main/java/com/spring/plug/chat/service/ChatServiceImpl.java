package com.spring.plug.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.chat.dao.ChatDAO;
import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;

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

}
