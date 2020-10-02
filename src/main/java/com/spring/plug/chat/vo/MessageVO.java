package com.spring.plug.chat.vo;

import org.springframework.web.multipart.MultipartFile;

public class MessageVO {
	private MultipartFile upload;

	private String message_sender;
	private int senderId;
	private String message_content;
	private String message_sendTime;
	private String chatRoomId;
	private String chatroomName;
	private int projectId;
	private int userId;
	private String userName;
	private int unReadCount;
	private String chatRoomName;
	private String projectName;
	private String messageType;
	private int joinNumber;
	private String header;
	private String fileName;
	private String filePath;
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getJoinNumber() {
		return joinNumber;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public void setJoinNumber(int joinNumber) {
		this.joinNumber = joinNumber;
	}
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
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
				+ message_content + ", message_sendTime=" + message_sendTime + ", chatRoomId=" + chatRoomId
				+ ", chatroomName=" + chatroomName + ", projectId=" + projectId + ", userId=" + userId + ", userName="
				+ userName + ", unReadCount=" + unReadCount + ", chatRoomName=" + chatRoomName + ", projectName="
				+ projectName + ", messageType=" + messageType + ", joinNumber=" + joinNumber + "]";
	}
	
	
	
	
}
