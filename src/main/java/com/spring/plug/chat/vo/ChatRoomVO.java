package com.spring.plug.chat.vo;

public class ChatRoomVO {
	
	private int joinedUserId;
	private String chatRoomName;
	private int chatRoomId;
	private int userId;
	private String connectTime;
	private String userName;
	private String userEmail;
	private String inviteUser;
	private String inviteUserId;
	private String status;
	private int joinNumber;
	private String roomNameChange;
	private int unReadCount;
	private String message;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	public String getRoomNameChange() {
		return roomNameChange;
	}
	public void setRoomNameChange(String roomNameChange) {
		this.roomNameChange = roomNameChange;
	}
	public int getJoinedUserId() {
		return joinedUserId;
	}
	public void setJoinedUserId(int joinedUserId) {
		this.joinedUserId = joinedUserId;
	}
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public int getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(int chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getConnectTime() {
		return connectTime;
	}
	public void setConnectTime(String connectTime) {
		this.connectTime = connectTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getInviteUser() {
		return inviteUser;
	}
	public void setInviteUser(String inviteUser) {
		this.inviteUser = inviteUser;
	}
	public String getInviteUserId() {
		return inviteUserId;
	}
	public void setInviteUserId(String inviteUserId) {
		this.inviteUserId = inviteUserId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getJoinNumber() {
		return joinNumber;
	}
	public void setJoinNumber(int joinNumber) {
		this.joinNumber = joinNumber;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [joinedUserId=" + joinedUserId + ", chatRoomName=" + chatRoomName + ", chatRoomId="
				+ chatRoomId + ", userId=" + userId + ", connectTime=" + connectTime + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", inviteUser=" + inviteUser + ", inviteUserId=" + inviteUserId
				+ ", status=" + status + ", joinNumber=" + joinNumber + ", roomNameChange=" + roomNameChange
				+ ", unReadCount=" + unReadCount + "]";
	}
	

}
