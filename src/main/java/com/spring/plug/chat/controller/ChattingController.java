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
	
	@ResponseBody
	@RequestMapping(value="/getChattingList.do",method=RequestMethod.POST)
	public List<ChatRoomVO> getChatList(ChatRoomVO vo,HttpSession session, Model model){
		UserVO user = (UserVO)session.getAttribute("user");
		List<ChatRoomVO> chatList = chatService.getChatList(user.getSeq());
		return chatList;
	}
	
	@RequestMapping("/chatting.do")
	public ModelAndView chatting(MessageVO msgVO, HttpServletRequest request, ModelAndView mav,HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		String roomId = request.getParameter("roomId");
		String projectId = request.getParameter("projectId");
		session.setAttribute("roomId", roomId);
		mav.addObject("user");
		mav.addObject("roomId", roomId);
		mav.addObject("projectId", projectId);
		mav.setViewName("chatPopup2.jsp");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertMessage.do", method = RequestMethod.POST)
	public void insertMessage(MessageVO msgVO) {
		System.out.println(msgVO.toString());
		chatService.insertMessage(msgVO);
		
	}
	
	
		@ResponseBody
		@RequestMapping(value="/loadMessage.do", method = RequestMethod.POST)
		public void loadChatHistory(MessageVO msgVO) {
			System.out.println("채팅 로드 컨트롤러");
			//chatService.insertMessage(msgVO);
			
		}
	
}
