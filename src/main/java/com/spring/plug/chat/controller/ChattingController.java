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
		UserVO user = (UserVO)session.getAttribute("user");
		String roomId = request.getParameter("roomId");
		String projectId = request.getParameter("projectId");
		String chatroomName = request.getParameter("chatroomName");
		System.out.println("컨트롤러 헤더 네임" + chatroomName);
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
	
}
