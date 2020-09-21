package com.spring.plug.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.plug.chat.service.ChatService;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.service.UserService;
import com.spring.plug.login.vo.UserVO;

@Component
public class ReplyEchochoHandler extends TextWebSocketHandler{
	
	@Inject
	UserService userService;
	
	@Inject
	ChatService chatService;
	
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<Integer,WebSocketSession> userSessions = new HashMap<Integer, WebSocketSession>();
	
	@Override //연결됐을때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished" + session);
		sessions.add(session); //웹소켓 세션 리스트에 추가
		int userId = getId(session);
		System.out.println("세션 아이디 체크"+userId);
		
	}

	@Override //소켓에 메시지 보냈을때
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		System.out.println(msg.toString());
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		
	}//end handletextmessage
	
	@Override //커넥션 끊켰을때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		int myId = getId(session);
		userService.updateDisconnectionLog(myId);
		sessions.remove(session);
		userSessions.remove(session);
		
	}
	
	private int getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO user = (UserVO)httpSession.get("user");
		int id = user.getSeq();
		return id;
	}

	
}
