package dnjswhdzld.spring.plug.client;

import java.util.Date;

public class UserVO {
	
	private int seq;
	private String officename;
	private String username;
	private String groupname;
	private String department;
	private String email;
	private String phone;
	private Date joinday;
	private Date connectiondate;
	private String device;
	private String userstate;
	private String usermanager;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getOfficename() {
		return officename;
	}
	public void setOfficename(String officename) {
		this.officename = officename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJoinday() {
		return joinday;
	}
	public void setJoinday(Date joinday) {
		this.joinday = joinday;
	}
	public Date getConnectiondate() {
		return connectiondate;
	}
	public void setConnectiondate(Date connectiondate) {
		this.connectiondate = connectiondate;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getUserstate() {
		return userstate;
	}
	public void setUserstate(String userstate) {
		this.userstate = userstate;
	}
	public String getUsermanager() {
		return usermanager;
	}
	public void setUsermanager(String usermanager) {
		this.usermanager = usermanager;
	}
	@Override
	public String toString() {
		return "UserVO [seq=" + seq + ", officename=" + officename + ", username=" + username + ", groupname="
				+ groupname + ", department=" + department + ", email=" + email + ", phone=" + phone + ", joinday="
				+ joinday + ", connectiondate=" + connectiondate + ", device=" + device + ", userstate=" + userstate
				+ ", usermanager=" + usermanager + "]";
	}

	
	
	
}
