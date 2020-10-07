<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %> 
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="google-signin-client_id" content='198753219443-qhctu45a6g5mv2o4rp7f0evfr9gfni0t.apps.googleusercontent.com'>
<title>개인환경 설정</title>

<script src="script/jquery-3.5.1-min.js"></script>
<script src='https://kit.fontawesome.com/be57023a12.js' crossorigin='anonymous'></script>
<script src="script/headerScript.js"></script>
<script src="script/script.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="css/privateConfig.css" rel="stylesheet">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <script>
        function onLoad() {
            gapi.load('auth2', function() {
                gapi.auth2.init();
            });
        }
</script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<body>
		<c:if test="${user.lockSwitchStatus eq 'on'}">
		<jsp:include page="lock.jsp" flush="true" />
		<input type="hidden" name="user" id="session" value='${user.lockTime}'/>
	</c:if>
		<div class="headerContainer">
			<div class="dir_set_bar" style="display: none;">
				<span class="locker_setbtn" id="locker_list">보관함 설정</span> 
				<span class="locker_setbtn" id="locker_hide">숨기기</span> 
				<span style="float: right; color: blue;">
				<span class="select_num"></span>
					개의 프로젝트 선택 됨</span>
			</div>
			<div class="headerWrap">
				<div class="headerLeft">
					<div class="headLogo">
						<a href="projectdir.do"><img src="images/logo_top.png"></a>
					</div>
					 <div id="searchArea" >
                    	<input type='text' id='inputkeyword' placeholder='키워드를 입력하세요'>
                     </div>

				</div>
				<div class="headerRight">
				
						<a href="projectManage.do" id="project-manage-bt">프로젝트 관리</a>
					
					<div id="chatbt-div">
						<input type="button" id="headerChatBt" >
						<span></span>
					</div>
					<input type="button" id="headerUserInfoBt">
		

		<!-- 옵션 영역 -->
			<div id="header_option_div">
				<!-- 유저 정보 -->
				<div id="option_user" style="margin-top: 20px; margin-bottom: 10px;">
				   <div style="text-align: center;">
					  <img src="images/account_default30.png" style="border-radius: 20px;">
				   </div>
				   <div style="text-align: center;">
					  <span>
						 <strong>${user.name} 님</strong>
					  </span>
				   </div>
				   <div style="text-align: center;">
					  <span style="font-size: 12px;">
						 test버전 이용중
					  </span>
				   </div>
				</div>
				<!-- //유저 정보 -->
				<hr>
				<!-- 옵션 -->
				<div style="margin-left: 10px;">
				   <div style="margin-top: 10px;">
					  <img src="images/pf_ico1_off.png">
					  <a href="accountInfo.do">환경설정</a>
				   </div>
				   
					<div style="margin-top: 10px;">
						<img src="images/pf_ico3_off.png"> 
							 <a href="javascript:signOut('${user.socialCompare}');">로그아웃</a>
					</div>
					</div>
				</div>

				<!-- //옵션 -->
			 </div>
			 <!-- //옵션 영역 -->

			 <!-- 알람 영역 -->
			 <div id="header_alarm_div">

				<!-- 선택 영역 -->
				<div style="margin-left: 10px;">
				   <!-- 채팅방 선택 -->
				   <div style="width: 80px; display: inline-block;">
					  <a>미확인 알람</a>
				   </div>
				   <!-- 연락처 선택 -->
				   <div style="width: 80px; display: inline-block;">
					  <a>전체 알람</a>
				   </div>
				   <!-- 알람on/off, 새채팅 -->
				   <div style="margin-left: 50px; display: inline-block;">
					  <a>모두 읽음</a>
				   </div>
				</div>
				<hr>
				<!-- //선택 영역 -->
				
				<!-- 미확인 알람 -->
				<div style="display: block;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="미확인 알람 검색">
				   </div>

				   <!-- forEach -->
				   <div>
					  <div style="width: 20%; display: inline-block;">
						 <img src="images/empty_photo_s.png">
					  </div>
					  <div style="width: 75%; display: inline-block;">
						 <div style="height: 18px;">
							<span style="font-size: 12px;"><strong>프로젝트명</strong></span>
							<span style="margin-top: 5px; font-size: 10px; float: right;">작성 시간</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">*님의 새글 등록</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">새글 내용</span>
						 </div>
					  </div>
				   </div>
				   <!-- //forEach -->
				</div>
				<!-- //미확인 알람 -->

				<!-- 전체 알람 -->
				<div style="display: none;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="전체 알람 검색">
				   </div>

				   <!-- forEach -->
				   <div>
					  <div style="width: 20%; display: inline-block;">
						 <img src="images/empty_photo_s.png">
					  </div>
					  <div style="width: 75%; display: inline-block;">
						 <div style="height: 18px;">
							<span style="font-size: 12px;"><strong>프로젝트명</strong></span>
							<span style="margin-top: 5px; font-size: 10px; float: right;">작성 시간</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">*님의 새글 등록</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">새글 내용</span>
						 </div>
					  </div>
				   </div>
				   <!-- //forEach -->
				</div>
				<!-- //전체 알람 -->
			 </div>
			 <!-- //알람 영역 -->

			 <!-- 채팅 영역 -->
			 <div id="header_chat_div" class='header_chat_class'>
				
				<!-- 선택 영역 -->
				<div style="margin-left: 10px;">
				   <!-- 채팅방 선택 -->
				   <a onclick="headerChattingRoom()">채팅</a>
				   <!-- 연락처 선택 -->
				 
				   <div style="margin: 10px 0 0 0; display: inline-block;">
					  <div style="display: inline-block;">
					  	<c:choose>
					  		<c:when test="${user.pushAlram eq 'off' || user.chatAlram eq 'false'}">
							 	<button type="button" id="chat-alram-bt">alarmOn</button>
					  		</c:when>
							<c:when test="${user.pushAlram eq 'on' && user.chatAlram eq 'true'}">
						 		<button type="button" id="chat-alram-bt">alarmOff</button>
							</c:when>				  	
					  	</c:choose> 
					  </div>
					  <div style="display: inline-block; margin-top: 3px;">
					  <a href="javascript:void(0);" onclick ="makeChatRoom()" style="margin-left: 10px; vertical-align: middle;">
					  	<img src="images/icon_newchat.png" style="padding-top: 5px;">
					  	</a>
					  </div>
					  
					  
				   </div>
				</div>

				<hr>
				<!-- //선택 영역 -->
				
				<!-- 채팅방 -->
				<div id="header_chat_chattingRoom" style="display: block;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" id="searchChatRoom" class="chat-search-class" placeholder="채팅방 또는 이름 검색">
				   </div>

				 
				   <div class="chatting-list-div">
				   <!-- 개설된 채팅방 뿌려주는 영역 -->
					
				   </div>
				  
				</div>
				<!-- //채팅방 -->

				<!-- 연락처 -->
				<div id="header_chat_contactAddress" style="display: none;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="이름,소속 또는 연락처 검색">
				   </div>

				   <!-- 내프로필 -->
				   <div>
					  <div>
						 <span style="font-size: 12px;"><strong>내 프로필</strong></span>
					  </div>
					  <div style="display: inline-block;">
						 <img src="images/empty_photo_s.png">
					  </div>
						 
					  <div style="display: inline-block; margin-left: 200px;">
						 <img src="images/chat_ico.png">
					  </div>
				   </div>
				   <hr>
				   <!-- //내프로필 -->

				   
			
				   <!-- //전체 연락처 -->
				</div>
				<!-- //연락처 -->
			 </div>
			 <!-- //채팅 영역 -->
				</div><!-- header right -->
			</div><!-- headerwrap -->

		</div><!-- headercontainer -->
		<div id="socketChatAlert" class="alert alert-primary">
			
		</div>
		
</body>

<script>

/**
 * 헤더 아이콘 관련 자바스크립트파일
 */

var socket = null;
$(document).ready(function(){
	
	//만들어진 채팅방 리스트 가저오는 이벤트
	$.ajax({
		url:'getChattingList.do',
		method:'POST',
	}).done(function(data){
		if(data.length == 0){ //채팅방 개설 안된 사람
			$('#headerChatBt').next().css('display','none');
		}
		var unreadCount = 0;
		$.each(data,function(index,element){
			settingChatList(element);//채팅방 리스트 클릭
			roomUnreadCount = parseInt(element.unReadCount); 
			unreadCount += roomUnreadCount;
		});
		if(unreadCount == 0){
			$('#headerChatBt').next().css('display','none');
		}
		$('#headerChatBt').next().text(unreadCount);
		
	}).fail(function(err){
		alert('통신오류');
	});

	// 리스트에서 채팅방 클릭했을때 채팅방 입장 이벤트
	$(document).on('click','.chat-row',function(){
		var totalUnreadCount = $('#headerChatBt').next().text();
		var totalUnreadCount = parseInt(totalUnreadCount);
		
		var roomId = $(this).children('.room').val();
		var count = $(this).children('.bdg').text();
		count = parseInt(count);
		totalUnreadCount -= count;
		
		$('#headerChatBt').next().text(totalUnreadCount);
		
		if(totalUnreadCount == 0){
			$('#headerChatBt').next().css('display','none');
		}
		$(this).children('.bdg').text("0");
		$(this).children('.bdg').css('display','none');
		sendData = {
			chatRoomId : roomId	
		}
		openChatPopup(roomId);
	});
	
	connect();
	
});

//채팅 리스트 화면에 출력하는 함수
function settingChatList(element){
	$('.chatting-list-div').append(
			"<button type='button' class='chat-row' id=" + element.chatRoomId + ">" + 
					"<div class='row-label'>" +
						"<span class='chatroom-name'>"+element.chatRoomName +"</span>"+
						"<div class='last-message'>"+element.message+"</div>"+
					"</div>"+	
					 "<strong class='bdg'>"+element.unReadCount+"</strong>"+
					"<span class='chat-user-number'>"+element.joinNumber+"</span>"+
				"<input type='hidden' class='room' value='" + element.chatRoomId +"'/>" +
			"</button>"
	);
	if(element.unReadCount == '0'){
		$('#'+element.chatRoomId).children('.bdg').css('display','none');
	}
	
}

function appendChatList(element,unreadCount){
	$('.chatting-list-div').append(
			"<button type='button' class='chat-row' id=" + element.chatRoomId + ">" + 
					"<div class='row-label'>" +
						"<span class='chatroom-name'>"+element.chatRoomName +"</span>"+
						"<div class='last-message'>"+element.message_content+"</div>"+
					"</div>" +
					 "<strong class='bdg'>"+unreadCount+"</strong>"+
					"<span class='chat-user-number'>"+element.joinNumber+"</span>"+
				"<input type='hidden' class='room' value='" + element.chatRoomId +"'/>" +
			"</button>"
	);
	if(element.unReadCount == '0'){
		$('#'+element.chatRoomId).children('.bdg').css('display','none');
	}
}



var socket = null;

function connect(){
	 var ws = new WebSocket("ws://ec2-13-124-251-3.ap-northeast-2.compute.amazonaws.com/plugProject/echo.do");
	 socket = ws;
		ws.onopen = function(){
			console.log('Info: connection opened');
		};
		
		ws.onmessage = function(event){ 
			
			var data = event.data;
			data = JSON.parse(data);
			
			if(data.header == 'chatting'){ //채팅 메시지용 알람
				myId = '${user.seq}';
				var unreaders = data.unReaderId; //문자열 형태로 읽지 않은 사람 목록 변수 저장
				var unreaderCounts = data.unReadCount;
				var unreaderArray = unreaders.split(","); //읽지 않은 사람 배열로 저장
				var unreaderCountArray = unreaderCounts.split(",");
				var chatRoomId = data.chatRoomId;
				$.each(unreaderArray,function(index,element){
					
					if(element === myId){ //읽지 않은 사람중에 내가 있을때 alert띠움
						settingChatAlramCount(chatRoomId); //알람 카운트 띄워줌
						updateLastMessage(chatRoomId,data.message_content);
						let $socketChatAlert = $('div#socketChatAlert'); 
						if('${user.pushAlram}' == 'on'  && '${user.chatAlram}' == 'true'){ //개인 환경에서 알림이 켜져있을때만 알림 div 보여줌
							$('div#socketChatAlert').empty();
							$('div#socketChatAlert').append(
									"<span>" + data.message_sender + "님의 메시지 <br>"+
									data.message_content +"<br>" +
									" 보낸 시간" + data.message_sendTime +
									"</span>");
							$socketChatAlert.css('display','block');
						}
						
						setTimeout(function() {
							$socketChatAlert.css('display','none');
							
							}, 5000);
						
						target = $('#'+data.chatRoomId).children().last();
						
						
						if(!$(target).val()){ //메시지가 왔는데 만들어진 채팅방이 없는 경우
							appendChatList(data,unreaderCountArray[index]);	//받은 사람 화면에 채팅방 추가
						}
						
						
						//초대, 나가기, 방이름 변경 메시지이가 아닐 경우
					}
					
				}); 
				
				
			}
			
			
		};
		
		ws.onclose = function(event) {
			console.log('Info: connection closed.');
			ws = null;
			
		};
		ws.onerror = function(err) {console.log('Error: ',err);
			socket.close();
		};
}

function settingChatAlramCount(chatRoomId){
	totalUnreadCount = $('#headerChatBt').next().text();
	totalUnreadCount = parseInt(totalUnreadCount);
	$('#headerChatBt').next().css('display','block');
	var target = $('#'+chatRoomId).children('.bdg');

	var count = $(target).text();
	if(!count){
		count = '0';
	}
	var count = parseInt(count);
	
	count += 1; //읽지 않은 메시지 카운트 1씩 증가
	
	
	totalUnreadCount += 1;
	
	if(count >= 1){ //리스트에서 안읽은 메시지 있으면 숫자표시
		$(target).css('display','block');
	}
	if(totalUnreadCount == 1){//안읽은 메시지 있을때 헤더 아이콘 위에 숫자 표시
		$('#headerChatBt').next().css('display','block');
	}
	
	$(target).text(count); //리스트 카운트 반영
	$('#headerChatBt').next().text(totalUnreadCount); //헤더 카운트 반영
	
}
//헤더 채팅영역






//방만들기 버튼 눌렀을때 팝업창 띄우기
function makeChatRoom(){
	
	var popupWidth = 300;
	var popupHeight = 500;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	
	var url = "makeChatRoomView.do";
	window.open(url,"newwindow", 'status=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	
}

//채팅 팝업창 띄우기
function openChatPopup(chatRoomId){
	var popupWidth = 500;
	var popupHeight = 700;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	
	
	var url = "chatting.do?param=" + chatRoomId;
	window.open(url,chatRoomId, 'status=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	
}

//메시지 왔을때 채팅창에 접속 안했을때 알림 띄워주는 함수
function chatAlert(result,message){
	/*쏴줄 정보들 추가*/
	var unreader = "";
	var chatRoomId = "";
	var joinNumber = "";
	var chatRoomName = "";
	var unReadCount = "";
	$.each(result,function(index,element){
		
		unreader += element.userId +",";
		chatRoomId = element.chatroom_id;
		joinNumber = element.joinNumber;
		chatRoomName = element.chatRoomName;
		unReadCount += element.unReadCount +",";
		
	});
	
	message.header = 'chatting';
	message.unReaderId = unreader;
	message.joinNumber = joinNumber;
	message.chatRoomName = chatRoomName;
	message.unReadCount = unReadCount;
	socket.send(JSON.stringify(message)); //대화 상대방에게 쏴줌
}

function resetChatList(roomId){ // 대화방에서 빠저나오면 헤더에 있는 채팅방 리스트에서 해당 대화방 삭제 
	var target = $('.chatting-list-div').children('#'+roomId);
	$(target).children('.bdg').text("0");
	target.remove();
}

function resetChatRoomName(roomId, roomName,changeNumber){ // 대화방에서 인원 변경 있을때 해당 대화방 이름에 반영
	$('.chatting-list-div').children('#'+roomId).children('.row-label').children('.chatroom-name').text("");
	$('.chatting-list-div').children('#'+roomId).children('.row-label').children('.chatroom-name').text(roomName);
	if(changeNumber != 0){
		var presentNumber = $('.chatting-list-div').children('#'+roomId).children('.chat-user-number').text();
		var joinNumber = parseInt(presentNumber);
		joinNumber += changeNumber;
		
		$('.chatting-list-div').children('#'+roomId).children('.chat-user-number').text(joinNumber);
	}
	
}

function updateLastMessage(roomId,message){ //헤더 채팅방 리스트에 마지막 메시지 보여줌
	$('.chatting-list-div').children('#'+roomId).children('.row-label').children('.last-message').text("");
	$('.chatting-list-div').children('#'+roomId).children('.row-label').children('.last-message').text(message);
}
</script>
</html>