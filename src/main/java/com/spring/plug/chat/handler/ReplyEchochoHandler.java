package com.spring.plug.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.plug.login.vo.UserVO;

@Component
public class ReplyEchochoHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String,WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override //연결됐을때
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished" + session);
		sessions.add(session); //웹소켓 세션 리스트에 추가	
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}

	@Override //소켓에 메시지 보냈을때
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("handleTextMessage" + session + " : " + message);
		
		String senderId = getId(session);
		/*for(WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + ": " +message.getPayload()));
		}*/
		
		//protocol: cmd, 댓글 작성자, 게시글 작성자,bno (ex: reply, user2, user1, 234)
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = message.getPayload().split(",");
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter); //웹 소켓 세션 겟
				if("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이" + bno + "번 게시글에 댓글을 달았습니다!");
					boardWriterSession.sendMessage(tmpMsg);
				} //end if"reply"
			}//end if strs
			
		}//end if stringusils
		
	}//end handletextmessage

	

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO)httpSession.get("user");
		if(loginUser == null) {
			return session.getId();
		}else {
			return loginUser.getEmail();
		}
	}

	@Override //커넥션 끊켰을때
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished" + session + " : " + status);
		sessions.remove(session);
	}
	
}
