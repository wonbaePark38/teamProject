package com.spring.plug.chat.service;

import java.util.List;

import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;

public interface ChatService {
	List<ChatRoomVO> getChatList(int userId);
	void insertMessage(MessageVO msgVO);
}
