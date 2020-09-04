package com.spring.plug.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.spring.plug.chat.handler.ReplyEchochoHandler;

/*@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	private final ReplyEchochoHandler handler;
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(handler, "/chat");
	}
	
}*/
