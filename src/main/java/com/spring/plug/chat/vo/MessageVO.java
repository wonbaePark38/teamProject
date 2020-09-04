package com.spring.plug.chat.vo;

import com.spring.plug.chat.handler.MessageType;

public class MessageVO {
	
	private String message_sender;
	private int senderId;
	private String message_content;
	private String message_sendTime;
	private String chatroom_id;
	private String chatroomName;
	private int projectId;
	private int userId;
	private String userName;
	private int unReadCount;
	private String projectName;
	private String messageType;
	
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public String getMessage_sender() {
		return message_sender;
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
				+ ", chatroomName=" + chatroomName + ", projectId=" + projectId + ", userId=" + userId + ", userName="
				+ userName + ", unReadCount=" + unReadCount + ", projectName=" + projectName + ", messageType="
				+ messageType + "]";
	}
	
	
	
}
