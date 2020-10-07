package com.spring.plug.chat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.spring.plug.chat.service.ChatService;
import com.spring.plug.chat.vo.ChatRoomVO;
import com.spring.plug.chat.vo.MessageVO;
import com.spring.plug.common.util.ScanNowTime;
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
	public ModelAndView chatting(ChatRoomVO roomVO, HttpServletRequest request, ModelAndView mav,HttpSession session,
			@RequestParam String param) {
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		ChatRoomVO roomInfo = (ChatRoomVO)chatService.getChatRoomInfo(param);
		session.setAttribute("roomId",param);
		
		mav.addObject("vo",user);
		mav.addObject("roomInfo", roomInfo);
		mav.setViewName("chatPopup2.jsp");
		return mav;
	}

	//db에 채팅 메시지 저장하는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/insertMessage.do", method = RequestMethod.POST)
	public synchronized List<MessageVO> insertMessage(MessageVO msgVO){
		
		
		if(msgVO.getMessageType().equals("file")) {
			String roomId = msgVO.getChatRoomId();
			String realFileName = msgVO.getSenderId()+ "_" + msgVO.getMessage_content();
			String file_path = "/usr/local/tomcat/webapps/plugProject/upload/chat/"+roomId+"/"+ realFileName;
			msgVO.setFileName(msgVO.getMessage_content());
			msgVO.setFilePath(file_path);
		}
		
		if(msgVO.getSenderId() != 0) { //관리자 메시지가 아닐 경우 
			chatService.updateChatRoomStatus(msgVO);
			chatService.updateUnreadCount(msgVO);
		}
		
		chatService.insertMessage(msgVO);
		List<MessageVO> unreadList = chatService.getUnreadUser(msgVO);//현재 방 접속상태 아닌 사람 목록 가저옴
		
		return unreadList;
	}
	
	//채팅창 첨부파일 서버에 저장
	@ResponseBody
	@RequestMapping(value="/uploadFile.do",method = RequestMethod.POST) //서버에 파일 업로드
	public void uploadFile(MessageVO msgVO) throws IllegalStateException, IOException {
			MultipartFile uploadFile = msgVO.getUpload();
			String roomId = msgVO.getChatRoomId();
			String realFileName = msgVO.getMessage_sender()+ "_" + msgVO.getFileName();
			String file_path = "/usr/local/tomcat/webapps/plugProject/upload/chat/"+roomId+"/"+ realFileName;
			File destdir = new File(file_path);
			 if(!destdir.exists()) {
				 destdir.mkdirs();
			 }
			uploadFile.transferTo(new File(file_path));
	}
	
	//채팅창 첨부파일 다운로드 컨트롤러
	@ResponseBody
	@RequestMapping(value="/chatFileDown.do")
	public void downloadFile(MessageVO msgVO,HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String sender = request.getParameter("message_sender");
			String fileName = request.getParameter("fileName");
			String roomId = request.getParameter("chatRoomId");
			String realFileName = sender + "_" + fileName;
			String browser = request.getHeader("User-Agent");
			if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
				sender = URLEncoder.encode(sender,"UTF-8").replaceAll("\\+", "%20");
			} else {
				fileName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
				sender = new String(sender.getBytes("UTF-8"),"ISO-8859-1");
			}
			String file_path = "/usr/local/tomcat/webapps/plugProject/upload/chat/"+roomId+"/"+ realFileName;
			
			File file1 = new File(file_path);
			if(!file1.exists()) {
				return ;
			}
			
			//파일명 지정
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\"");
			
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(file_path);
			
			int ncount = 0;
			byte[] bytes = new byte[512];
			try {
				while((ncount = fis.read(bytes)) != -1) {
					os.write(bytes, 0 , ncount);
				}
			} catch(Exception e){
				e.printStackTrace();
			}finally {
				fis.close();
				os.close();
				
			}
	
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//채팅창 켰을때 메시지 히스토리 가저오고 접속 시간 로그 남김 컨트롤러
	@ResponseBody
	@RequestMapping(value="/loadMessage.do", method = RequestMethod.POST)
	public List<MessageVO> loadChatHistory(MessageVO msgVO,HttpServletResponse response, HttpSession session,
			@RequestParam String param) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); 
		response.setHeader("Expires", "0");
		UserVO user = (UserVO)session.getAttribute("user");
		msgVO.setUserId(user.getSeq());
		msgVO.setChatRoomId(param);
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
	
	//초대 가능 목록 뷰 페이지 
	@RequestMapping(value="/inviteChatRoomView.do")
	public ModelAndView inviteListView(ModelAndView mav, HttpSession session) {
		mav.setViewName("inviteChatting.jsp");
		return mav;
	}
	
	
	//나랑 같은 프로젝트 소속된 사람 중에서 입장한 채팅방에 없는 사람 목록 불러오는 컨트롤러
		@ResponseBody
		@RequestMapping(value="/getInviteList.do", method = RequestMethod.POST)
		public List<UserVO> getInviteList(ChatRoomVO vo, HttpSession session){
			
			UserVO user = (UserVO)session.getAttribute("user");
			List<UserVO> settingFriendList = chatService.getFriendList(user.getSeq());
			int param = vo.getChatRoomId();
			String roomId = Integer.toString(param);
			ChatRoomVO roomInfo = (ChatRoomVO)chatService.getChatRoomInfo(roomId);
			
			
			String joinMembers = roomInfo.getInviteUserId(); //방에 이미 들어가 있는 사람 목록
			String[] splitJoinMembers = joinMembers.split(","); //배열에 넣어줌
			List<UserVO> result = new ArrayList<UserVO>();
			
			/*for문 돌면서 같은 프로젝트 사람중에 채팅방에 없는 사람 목록 뽑아와서 리스트에 추가*/
			boolean flag = true;
			for(UserVO allList : settingFriendList) {
				int id = allList.getSeq();
				String tempId = Integer.toString(id);
				for(String innerList : splitJoinMembers) {
					if(innerList.equals(tempId)) {
						flag = false;
						break;
					}else {
						flag = true;
					}
				} //end inner for
				if(flag == true) {
					result.add(allList);
				}
			}//end outer for
			
			return result;
		}

	//대화 상대 초대
	@ResponseBody
	@RequestMapping(value="/inviteMember.do", method=RequestMethod.POST)
	public void inviteMember(ChatRoomVO vo, HttpSession session,
			@RequestParam String info) {
	
		Map<String, Object> infoData = new HashMap<String, Object>();
		List<Map<String, Object>> result = new Gson().fromJson(String.valueOf(info),
				new TypeToken<List<Map<String, Object>>>(){}.getType()); //json 배열 자바 리스트로 받아옴
		List<ChatRoomVO> inviteUserList = new ArrayList<ChatRoomVO>();
		
		int param = vo.getChatRoomId();
		String roomId = Integer.toString(param);
		ChatRoomVO roomVO = (ChatRoomVO)chatService.getChatRoomInfo(roomId);
		
		

		String inviteUser = roomVO.getInviteUser();
		String inviteUserId = roomVO.getInviteUserId();
		int joinNumber = roomVO.getJoinNumber();
	
		String chatRoomName = roomVO.getChatRoomName();
		
		for(Map<String,Object> temp : result) { //초기 채팅방 이름(사용자 이름 모음), 참여자 아이디 설정
			
			//chatName += "," + (String)temp.get("userName");
			if(roomVO.getRoomNameChange().equals("n")) {
				chatRoomName += "," + (String)temp.get("userName");
			}
			inviteUser += "," + (String)temp.get("userName");
			inviteUserId += "," + (String)temp.get("joinedUserId");
			joinNumber += 1;
		}
		
		roomVO.setInviteUser(inviteUser);
		roomVO.setInviteUserId(inviteUserId);
		roomVO.setJoinNumber(joinNumber);
		roomVO.setChatRoomName(chatRoomName);
		roomVO.setChatRoomId(param);
		
		chatService.addUserChatRoom(roomVO);
		
		for(Map<String,Object> temp : result) { //json 배열 풀어서 vo에 값 세팅
			ChatRoomVO room = new ChatRoomVO();
			String joinUserId = (String)temp.get("joinedUserId");
			room.setInviteUser(joinUserId);

			String userName = (String)temp.get("userName");
			room.setUserName(userName);

			room.setChatRoomId(param);
			inviteUserList.add(room);

		}
		infoData.put("roomList", inviteUserList); //만들어논 맵에 배열 풋
		chatService.insertMember(infoData); //참여자들 db에 추가
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
	public ChatRoomVO createChatRoom(ChatRoomVO roomVO, HttpSession session,
			@RequestParam String info) {
		Map<String, Object> infoData = new HashMap<String, Object>();
		List<Map<String, Object>> result = new Gson().fromJson(String.valueOf(info),
				new TypeToken<List<Map<String, Object>>>(){}.getType()); //json 배열 자바 리스트로 받아옴
		List<ChatRoomVO> roomList = new ArrayList<ChatRoomVO>();		
		UserVO vo = (UserVO)session.getAttribute("user");
		int userId = vo.getSeq();
		String chatName = vo.getName();
		
		String joinUsersId = Integer.toString(userId);
		
		for(Map<String,Object> temp : result) { //초기 채팅방 이름(사용자 이름 모음), 참여자 아이디 설정
			chatName += "," + (String)temp.get("userName");
			joinUsersId += "," + (String)temp.get("joinedUserId");
			
		}

		String madeTime = ScanNowTime.nowTime();
		
		int arraySize = result.size();
		
		roomVO.setInviteUserId(joinUsersId);
		roomVO.setJoinNumber(arraySize+1); //만든 사람 포함 시키기 위해 +1 
		roomVO.setChatRoomName(chatName);
		roomVO.setUserId(userId);
		
		chatService.createRoom(roomVO); //방 생성 셀렉트키로 방번호 리턴받음
		
		roomVO.setUserName(vo.getName());
		roomVO.setStatus("y");
		roomVO.setConnectTime(madeTime);
		chatService.createRoomStatus(roomVO); //리턴 받은 방 번호로 방 생성자 먼저 추가
		
		for(Map<String,Object> temp : result) { //json 배열 풀어서 vo에 값 세팅
			ChatRoomVO room = new ChatRoomVO();
			String inviteUser = (String)temp.get("joinedUserId");
			room.setInviteUser(inviteUser);

			String userName = (String)temp.get("userName");
			room.setUserName(userName);

			room.setChatRoomId(roomVO.getChatRoomId());
			roomList.add(room);

		}
		infoData.put("roomList", roomList); //만들어논 맵에 배열 풋
		roomVO.setInviteUser(chatName);
		
		chatService.insertMember(infoData); //참여자들 db에 추가
		return roomVO; //만들어진 방번호 리턴
	}

	
	//접속 로그 업데이트
	@ResponseBody
	@RequestMapping(value="/updateConnectTime.do", method=RequestMethod.POST)
	public void updateConnectTime(ChatRoomVO roomVO, HttpSession session,
			@RequestParam String param) {
		int chatRoomId = Integer.parseInt(param);
		roomVO.setChatRoomId(chatRoomId);
		UserVO user = (UserVO)session.getAttribute("user");
		
		roomVO.setJoinedUserId(user.getSeq());
		String nowTime = ScanNowTime.nowTime();
		
		roomVO.setConnectTime(nowTime);
		chatService.updateConnectTime(roomVO); 

	}

	
	//방이름 변경 컨트롤러
	@ResponseBody
	@RequestMapping(value="/changeChatRoomName.do", method=RequestMethod.POST)
	public void updateChatRoomName(ChatRoomVO roomVO) {
		chatService.updateChatRoomName(roomVO);
	}
	
	//방 나갔을때 처리하는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/exitChatRoom.do",method=RequestMethod.POST)
	public void exitChatRoom(ChatRoomVO roomVO, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		String id = Integer.toString(user.getSeq());
		roomVO.setUserId(user.getSeq());
			String str = roomVO.getInviteUser();
			String[] array = str.split(",");
			String result = "";
			for(String temp : array) {
				if(temp.contains(user.getName())) {
					continue;
				}
				result += temp + ",";
			}
			result = result.replaceAll(",$", "");
			if(roomVO.getRoomNameChange().equals("n")) { //방이름 바꾼적이 없을때
				roomVO.setChatRoomName(result); //방이름 세팅
			}	
			roomVO.setInviteUser(result); //유저이름 세팅
		
			String strId = roomVO.getInviteUserId();
			String[] arrayId = strId.split(",");
			String resultId = "";
			for(String temp : arrayId) {
				if(temp.contains(id)) {
					continue;
				}
				resultId += temp + ",";
			}
			resultId = resultId.replaceAll(",$", "");
			roomVO.setInviteUser(result);
			roomVO.setInviteUserId(resultId);
			roomVO.setJoinNumber(roomVO.getJoinNumber()-1);
			chatService.updateChatRoom(roomVO);
			chatService.deleteChatUser(roomVO);
	}
}
