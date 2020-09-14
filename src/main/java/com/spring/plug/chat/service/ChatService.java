package com.spring.plug.chat.service;

import java.util.List;
import java.util.Map;

import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.vo.UserVO;

public interface ChatService {
	List<ChatRoomVO> getChatList(int userId);
	void insertMessage(MessageVO msgVO);
	List<MessageVO> loadChatHistory(MessageVO msgVO);
	List<UserVO> getFriendList(int myId);
	void createRoom(ChatRoomVO roomVO);
	void createRoomStatus(ChatRoomVO roomVO);
	void insertMember(Map<String, Object> infoData);
	ChatRoomVO getChatRoomInfo(String chatRoomId);
	void updateConnectTime(ChatRoomVO roomVO);
	List<ChatRoomVO> getJoinedMember(ChatRoomVO roomVO);
	void updateDisconnectTime(MessageVO msgVO);
	void addUserChatRoom(ChatRoomVO roomVO);
	void addUserChatRoomStatus(Map<String, Object> infoData);
	void updateChatRoomStatus(MessageVO vo);
	void updateChatRoomName(ChatRoomVO roomVO);
	void updateChatRoom(ChatRoomVO roomVO);
	void deleteChatUser(ChatRoomVO roomVO);
	void updateUnreadCount(MessageVO vo);
	List<MessageVO> getUnreadUser(MessageVO vo);
	List<MessageVO> getProjectList(int userId);
}
