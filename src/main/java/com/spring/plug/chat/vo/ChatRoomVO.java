package com.spring.plug.chat.vo;

public class ChatRoomVO {
	private int projectId;
	private int joinedUserId;
	private String projectName;
	private String chatRoomName;
	private int chatRoomId;
	
	public int getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(int chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public int getJoinedUserId() {
		return joinedUserId;
	}
	public void setJoinedUserId(int joinedUserId) {
		this.joinedUserId = joinedUserId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [projectId=" + projectId + ", joinedUserId=" + joinedUserId + ", projectName=" + projectName
				+ ", chatroomName=" + chatRoomName + "]";
	}
	
	
}
