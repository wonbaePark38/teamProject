package com.spring.plug.chat.vo;

public class ChatRoomVO {
	private String projectId;
	private int joinedUserId;
	private String projectName;
	private String chatRoomName;
	private int chatRoomId;
	private String roomPassword;
	private String radioSelect;
	private String connectTime;
	public String getRoomPassword() {
		return roomPassword;
	}
	public void setRoomPassword(String roomPassword) {
		this.roomPassword = roomPassword;
	}
	public int getJoinedUserId() {
		return joinedUserId;
	}
	public void setJoinedUserId(int joinedUserId) {
		this.joinedUserId = joinedUserId;
	}
	public String getConnectTime() {
		return connectTime;
	}
	public void setConnectTime(String connectTime) {
		this.connectTime = connectTime;
	}
	public String getRadioSelect() {
		return radioSelect;
	}
	public void setRadioSelect(String radioSelect) {
		this.radioSelect = radioSelect;
	}
	public int getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(int chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	
	
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
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
				+ ", chatRoomName=" + chatRoomName + ", chatRoomId=" + chatRoomId + ", roomPassword=" + roomPassword
				+ ", radioSelect=" + radioSelect + ", connectTime=" + connectTime + "]";
	}
	
}
