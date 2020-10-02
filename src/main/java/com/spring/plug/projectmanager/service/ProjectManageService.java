package com.spring.plug.projectmanager.service;

import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.projectmanager.vo.ProjectManageVO;

public interface ProjectManageService {
	String getDownProhibition(int projectId);
	void changeDownProhibitionSetting(ProjectManageVO pmVO);
	List<ProjectManageVO> getUseStatistics(int projectId);
	List<ProjectManageVO> getConnectionStatistics(ProjectManageVO pmVO);
	List<ProjectManageVO> getRecentData(int projectId);
	List<ProjectManageVO> getProjectInfo(int projectId);
	List<ProjectManageVO> getMemberInfo(int projectId);
	void deleteManager(ProjectManageVO pmVO);
	void addManager(ProjectManageVO pmVO);
	ProjectManageVO accessAuth(ProjectDirVO vo);
	void deleteProject(ProjectManageVO pmVO);
	void sendInviteMail(List<String> mailAddress) throws AddressException, MessagingException;
	List<ProjectManageVO> joinedStatus(HashMap<String, List<String>> map);
	void addMemberProject(ProjectManageVO pmVO);
	void addMemberLocker(ProjectManageVO pmVO);
}
