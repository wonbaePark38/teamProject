package com.spring.plug.chat.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.chat.service.ChatService;
import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.vo.UserVO;
import com.spring.plug.user.accountinfo.service.UserSettingService;
import com.spring.plug.user.accountinfo.vo.UserSettingVO;

@Controller
public class ChattingController {
	
	@Autowired 
	ChatService chatService;
	
	@Autowired
	UserSettingService userSettingService;
	//채팅방 목록 불러오는 컨트롤러
	@ResponseBody 
	@RequestMapping(value="/getChattingList.do",method=RequestMethod.POST)
	public List<ChatRoomVO> getChatList(ChatRoomVO vo,HttpSession session, Model model){
		UserVO user = (UserVO)session.getAttribute("user");
		List<ChatRoomVO> chatList = chatService.getChatList(user.getSeq());
		return chatList;
	}
	//채팅 팝업창에서 쓸 정보 저장하는 컨트롤러
	@RequestMapping("/chatting.do")
	public ModelAndView chatting(MessageVO msgVO, HttpServletRequest request, ModelAndView mav,HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		int id = user.getSeq();
		String strId = Integer.toString(id);
		UserSettingVO infoVO = userSettingService.getConfigUserInfo(id);
		
		String uploadPath = "C:\\testFile\\"+strId +"\\" + infoVO.getProfileFileName();
		
		infoVO.setProfileFileName(uploadPath);
		//UserSettingVO infoVO 
		String roomId = request.getParameter("roomId");
		String projectId = request.getParameter("projectId");
		String chatroomName = request.getParameter("chatroomName");
		session.setAttribute("roomId", roomId);
		System.out.println(infoVO.toString());
		mav.addObject("vo",infoVO);
		mav.addObject("roomId", roomId);
		mav.addObject("projectId", projectId);
		mav.addObject("chatRoomName",chatroomName);
		mav.setViewName("chatPopup2.jsp");
		return mav;
	}
	
	//db에 채팅 메시지 저장하는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/insertMessage.do", method = RequestMethod.POST)
	public void insertMessage(MessageVO msgVO) {
		chatService.insertMessage(msgVO);
	}
	
	//채팅창 켰을때 메시지 히스토리 가저오고 접속 시간 로그 남김 컨트롤러
	@ResponseBody
	@RequestMapping(value="/loadMessage.do", method = RequestMethod.POST)
	public List<MessageVO> loadChatHistory(MessageVO msgVO, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		/*
		 * 로그 남기는 로직 처리
		 */
		List<MessageVO> chatHistoryList = chatService.loadChatHistory(msgVO);
		
		
		return chatHistoryList;
	}
	
	//채팅방 만들기 뷰 페이지
	@RequestMapping(value="/makeChatRoomView.do")
	public ModelAndView createRoomView(ModelAndView mav, HttpSession session) {
		mav.setViewName("makeChatRoom2.jsp");
		return mav;
	}
	
	//나랑 같은 프로젝트 소속된 사람 목록 (채팅방 만들때 초대가 가능한 사람들) 불러오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/getFriendList.do", method = RequestMethod.POST)
	public List<UserVO> getJoinProjectList(ChatRoomVO vo, HttpSession session){
		UserVO user = (UserVO)session.getAttribute("user");
		List<UserVO> settingFriendList = chatService.getFriendList(user.getSeq());
		return settingFriendList;
	}
	
	//채팅방 만드는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/createRoom.do", method = RequestMethod.POST)
	public void createChatRoom(ChatRoomVO roomVO,@RequestParam(value="invitedId[]") List<String> invitedIdList,
								@RequestParam(value="invitedName[]") List<String> invitedNameList, HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("user");
		int userId = vo.getSeq();
		String id = Integer.toString(userId);
		String myName = vo.getName();
		String userList = id+"/";
		String chatName = myName+",";
		for(String user : invitedIdList) {
			userList += user+"/";
		}
		for(String user : invitedNameList) {
			chatName += user+", ";
		}	
			roomVO.setJoinedUserId(userId);
			roomVO.setInviteUser(userList);
			roomVO.setUserName(chatName);
			chatService.createRoom(roomVO);
			
			Date time = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			String connectTime = format.format(time);
			roomVO.setConnectTime(connectTime);
			chatService.updateConnectTime(roomVO);
			
	}
	
	//선택 채팅방 정보 가저오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/getChatRoomInfo.do", method=RequestMethod.POST)
	public ChatRoomVO getRoomInfo(ChatRoomVO roomVO) {
		ChatRoomVO roomInfo = chatService.getChatRoomInfo(roomVO);
		return roomInfo;
	}
	
	//접속 로그 업데이트
	@ResponseBody
	@RequestMapping(value="/updateConnectTime.do", method=RequestMethod.POST)
	public void updateConnectTime(ChatRoomVO roomVO, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		roomVO.setJoinedUserId(user.getSeq());
		chatService.updateConnectTime(roomVO);
		//List<ChatRoomVO> memberList = chatService.getJoinedMember(roomVO);
		
		//return memberList;
	}
	
	//접속 종료 업데이트 컨트롤러
	@ResponseBody 
	@RequestMapping(value="/updateDisconnect.do", method=RequestMethod.POST)
	public void updateDisconnect(ChatRoomVO roomVO, HttpSession session) {
		System.out.println(roomVO.toString());
	}
}
