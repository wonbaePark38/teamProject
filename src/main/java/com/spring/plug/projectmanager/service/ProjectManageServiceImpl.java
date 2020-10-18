package com.spring.plug.projectmanager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.mainpage.projectdir.vo.ProjectDirVO;
import com.spring.plug.projectmanager.dao.ProjectManageDAO;
import com.spring.plug.projectmanager.vo.ProjectManageVO;

@Service
public class ProjectManageServiceImpl implements ProjectManageService{
	
	@Autowired
	ProjectManageDAO pmDAO;
	
	@Override
	public String getDownProhibition(int projectId) {
		return pmDAO.getDownProhibition(projectId);
	}

	@Override
	public void changeDownProhibitionSetting(ProjectManageVO pmVO) {
		pmDAO.changeDownProhibitionSetting(pmVO);
	}

	@Override
	public List<ProjectManageVO> getUseStatistics(int projectId) {
		return pmDAO.getUseStatistics(projectId);
	}

	@Override
	public List<ProjectManageVO> getConnectionStatistics(ProjectManageVO pmVO) {
		return pmDAO.getConnectionStatistics(pmVO);
	}

	@Override
	public List<ProjectManageVO> getRecentData(int projectId) {
		return pmDAO.getRecentData(projectId);
	}

	@Override
	public List<ProjectManageVO> getProjectInfo(int projectId) {
		return pmDAO.getProjectInfo(projectId);
	}

	@Override
	public List<ProjectManageVO> getMemberInfo(int projectId) {
		return pmDAO.getMemberInfo(projectId);
	}

	@Override
	public void deleteManager(ProjectManageVO pmVO) {
		pmDAO.deleteManager(pmVO);
	}

	@Override
	public void addManager(ProjectManageVO pmVO) {
		pmDAO.addManager(pmVO);
	}

	@Override
	public ProjectManageVO accessAuth(ProjectDirVO vo) {
		return pmDAO.accessAuth(vo);
	}

	@Override
	public void deleteProject(ProjectManageVO pmVO) {
		pmDAO.deleteProject(pmVO);
	}
	
	@Override
	public void sendInviteMail(List<String> mailAddress) throws AddressException, MessagingException {
		String host = "smtp.gmail.com";
		final String username = "97dnjswhdzld@gmail.com";
		final String password = "one1two22@";
		int port = 465;
		String subject = "FLOW 초대 메일";
		String body = username+"님으로 부터 메일을 받았습니다.";
		body += "<p> 아래 링크를 클릭하시면 플로우 로그인 페이지로 이동합니다. </p>";
		body += "<a href='http://ec2-13-124-251-3.ap-northeast-2.compute.amazonaws.com/plugProject/login.do'>플로우 페이지로 이동</a>";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
			} 
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("97dnjswhdzld@gmail.com"));
		
		InternetAddress[] toAddr = new InternetAddress[mailAddress.size()];
		for(int i = 0; i<mailAddress.size(); i++) {
			toAddr[i] = new InternetAddress(mailAddress.get(i));
		}
		mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		mimeMessage.setContent(body, "text/html; charset=UTF-8");
		Transport.send(mimeMessage);
		
	}

	@Override
	public List<ProjectManageVO> joinedStatus(HashMap<String, List<String>> map) {
		return pmDAO.joinedStatus(map);
	}

	@Override
	public void addMemberProject(ProjectManageVO pmVO) {
		pmDAO.addMemberProject(pmVO);
	}

	@Override
	public void addMemberLocker(ProjectManageVO pmVO) {
		pmDAO.addMemberLocker(pmVO);
	}
}
