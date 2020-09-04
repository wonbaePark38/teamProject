package com.spring.plug.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.plug.chat.vo.MessageVO;

public class ChatWebSocketHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<WebSocketSession,String> userSessions = new HashMap<WebSocketSession,String>();
	private final ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished" + session);
		sessions.add(session); //웹소켓 세션 리스트에 추가
		String sessionRoomId = getRoomId(session);
		userSessions.put(session,sessionRoomId);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		MessageVO messageVO = objectMapper.readValue(msg, MessageVO.class);
		System.out.println(messageVO.getChatroom_id());
		
		for(WebSocketSession sess : sessions){
			if(messageVO.getChatroom_id().equals(userSessions.get(sess))) {
				sess.sendMessage(new TextMessage(message.getPayload()));
			}
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
		userSessions.remove(session);
	}

	private String getRoomId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String roomId = (String)httpSession.get("roomId");
		return roomId;
	}

}
