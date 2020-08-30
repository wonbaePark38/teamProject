package com.spring.plug.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.chat.service.ChatService;
import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.login.vo.UserVO;

@Controller
public class ChattingController {
	
	@Autowired 
	ChatService chatService;
	
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

		String roomId = request.getParameter("roomId");
		String projectId = request.getParameter("projectId");
		String chatroomName = request.getParameter("chatroomName");
		session.setAttribute("roomId", roomId);
		
		mav.addObject("user");
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
	
	//채팅창 켰을때 메시지 히스토리 가저오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/loadMessage.do", method = RequestMethod.POST)
	public List<MessageVO> loadChatHistory(MessageVO msgVO) {
		
		List<MessageVO> chatHistoryList = chatService.loadChatHistory(msgVO);
		return chatHistoryList;
	}
	
	@RequestMapping(value="/makeChatRoomView.do")
	public ModelAndView createRoomView(ModelAndView mav) {
		mav.setViewName("makeChatRoom.jsp");
		return mav;
	}
	
	//내가 가입한 프로젝트 리스트 가저오기
	@ResponseBody
	@RequestMapping(value="/getProjectList.do", method = RequestMethod.POST)
	public List<ChatRoomVO> getJoinProjectList(ChatRoomVO vo, HttpSession session){
		UserVO user = (UserVO)session.getAttribute("user");
		List<ChatRoomVO> getJoinProjectList = chatService.getJoinProjectList(user.getSeq());
		return getJoinProjectList;
	}
	
	//채팅방 만드는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/createRoom.do", method = RequestMethod.POST)
	public void createChatRoom(ChatRoomVO roomVO) {
		chatService.createRoom(roomVO);
	}
	
	//선택 채팅방 정보 가저오는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/getChatRoomInfo.do", method=RequestMethod.POST)
	public ChatRoomVO getRoomInfo(ChatRoomVO roomVO) {
		ChatRoomVO roomInfo = chatService.getChatRoomInfo(roomVO);
		return roomInfo;
	}
	
}
