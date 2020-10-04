package com.spring.plug.chat.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.plug.chat.service.ChatService;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.vo.UserVO;
	

public class ChatWebSocketHandler extends TextWebSocketHandler{
	
	@JsonIgnoreProperties(ignoreUnknown = true)
	@Autowired
	ChatService chatService;
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<WebSocketSession,String> roomSessions = new HashMap<WebSocketSession,String>();
	private final ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished" + session);
		sessions.add(session); //웹소켓 세션 리스트에 추가
		String sessionRoomId = getRoomId(session);
		roomSessions.put(session,sessionRoomId);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		MessageVO messageVO = objectMapper.readValue(msg, MessageVO.class);
		System.out.println("핸들러에 메시지 도착");
		System.out.println(messageVO.getChatRoomId());
		
		for(WebSocketSession sess : sessions){
			if(messageVO.getChatRoomId().equals(roomSessions.get(sess))) {
				synchronized (message) {
					sess.sendMessage(new TextMessage(message.getPayload()));
				}
			}
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String disconnectTime = format.format(time);
		UserVO user = getUserId(session);
		int id = user.getSeq();
		String roomId = getRoomId(session);
		MessageVO vo = new MessageVO();
		vo.setSenderId(id);
		vo.setChatRoomId(roomId);
		vo.setMessage_sendTime(disconnectTime);
		chatService.updateDisconnectTime(vo);
		sessions.remove(session);
		roomSessions.remove(session);
		
	}

	private String getRoomId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String roomId = (String)httpSession.get("roomId");
		return roomId;
	}
	
	private UserVO getUserId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		UserVO user = (UserVO)httpSession.get("user");
		return user;
	}

}
