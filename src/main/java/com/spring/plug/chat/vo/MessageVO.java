package com.spring.plug.chat.vo;

import java.util.Date;

import com.google.gson.Gson;
import com.spring.plug.chat.handler.MessageType;

public class MessageVO {
	
	private String message_sender;
	private String senderId;
	private String message_content;
	private String message_sendTime;
	private String chatroom_id;
	private String chatroomName;
	private int projectId;
	private String userName;
	
	private String projectName;
	private MessageType type;
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	
	public String getMessage_sendTime() {
		return message_sendTime;
	}
	public void setMessage_sendTime(String message_sendTime) {
		this.message_sendTime = message_sendTime;
	}
	public String getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public String getChatroomName() {
		return chatroomName;
	}
	public void setChatroomName(String chatroomName) {
		this.chatroomName = chatroomName;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	@Override
	public String toString() {
		return "MessageVO [message_sender=" + message_sender + ", senderId=" + senderId + ", message_content="
				+ message_content + ", message_sendTime=" + message_sendTime + ", chatroom_id=" + chatroom_id
				+ ", chatroomName=" + chatroomName + ", projectId=" + projectId + ", userName=" + userName
				+ ", projectName=" + projectName + ", type=" + type + "]";
	}
	
	
}
