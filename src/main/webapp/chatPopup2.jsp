<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Plug</title>
<link href='css/chatPopup2.css' rel='stylesheet' />
<script src="script/jquery-3.5.1-min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.js"></script>

</head>
<body>
	<div class="chat_wrap">
		<div class="header">
			<label></label>
			<button id='more-bt'></button>
		</div>
		<div class="chat">
			<ul id="chat-ul">
				<!-- 동적 생성 -->
			</ul>
		</div>
		
		
		<div class="input-div">
		 	<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
				<a id="upload-file" class="add-file">
					<input type="file" class="input-file" name="upload" onchange="uploadFile()"/>
				</a>
			</form>
			<textarea id="message" placeholder="Press Enter for send message."></textarea>
		</div>

		<!-- format -->

		<div class="chat format">
			<ul>
				<li>
					<div class="sender">
						<span></span>
					</div>
					<div class="date"></div>
					<div class="message">
						<span></span>
					</div>


				</li>
			</ul>
		</div>
		<div class='hidden'>
			<div class='hidden-header'>
				<label>참여자 목록</label>
				<div style="display: inline-block; margin-top: 3px;">
					<a href="javascript:void(0);" onclick="makeChatRoom()" style="margin-left: 10px; vertical-align: middle;">
					<img src="images/icon_newchat.png" style="padding-top: 5px;">
					</a>
				</div>
			</div>
			<div class="member-list">
				<ul>
					<!-- 
						참여자 목록 들어올 자리
					 -->

				</ul>
			</div>
			
			<div class="hidden-footer">
				<div>
					<a href="javascript:void(0);" onclick="exitChatRoom()" id="exit-bt">
						<img src="images/icon-exitchat-on.png" style="padding-top: 5px;">
						나가기
					</a>
					
				</div>
				<div>
					<a href="javascript:void(0);" onclick="changeChatRoomName()" id="change-chatroom-name">
						<img src="images/icon_chatSet3.png" style="padding-top: 5px;">
					</a>
				</div>
			</div>

		</div>

	</div>

</body>
<script>
var socket = null;
var presentJoinUser = '${roomInfo.inviteUser}'.split(',');
var roomNameChangeStatus = '${roomInfo.roomNameChange}';
var roomName = '${roomInfo.chatRoomName}';
$(document).ready(function() {
	
	
	var sendData = { //현재 방 id값 세팅
			param : '${roomInfo.chatRoomId}',
	}
	var headerName = '${roomInfo.chatRoomName}';
	$('.header label').text(headerName); //채팅방 헤더에 채팅방 이름 세팅
	
	let today = new Date();   
	var connectTime = date_to_str(today);
	
	joinedMember(); //참여자 목록 화면에 출력
	
	//접속 로그 업데이트
	$.ajax({
			type : "POST",
			url : 'updateConnectTime.do',
			data : sendData,
			success : function(data) {
				//joinedMember(data); //참여자 목록 세팅
			},
			error : function(err) {
				alert('접속 로드 쓰는 도중 에러발생');
			}
		});
	
		connect();
		
	$.ajax({ //채팅 내역 로드
		type : "POST",
		url : 'loadMessage.do',
		data : sendData
	}).done(function(data){
		$.each(data,function(index,element){
			msgHistoryPosition(element); //채팅방에 최초 들어온 시점부터 화면에 뿌려줌
		});
		window.scrollTo(0, document.body.scrollHeight); // 스크롤 하단 고정
		data = null;
	}).fail(function(){
		alert('메시지 내역 불러오는 도중 에러 발생');
	})
		
		
	
		$(document).on('keydown', '#message', function(e) { //엔터 이벤트
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13' && !e.shiftKey) {
				send();
				e.preventDefault();
			}
			event.stopPropagation(); //이벤트 버블링 막기

		});
	
	$('#more-bt').click(function(e){ //참여자 목록 div show
		e.stopPropagation();
		$('.hidden').show();
	});
	
	$(document).click(function(e){ //참여자 목록 div hide
		var targetPoint = $(e.target);
		var popArea = targetPoint.hasClass('hidden');
		if(!popArea){
			$('.hidden').hide();
		}
	})

	});
	//웹소켓 접속
	function connect() {
		
		var ws = new WebSocket("ws://ec2-13-124-251-3.ap-northeast-2.compute.amazonaws.com/plugProject/chat.do");
		socket = ws;

		socket.onopen = function() {
			console.log('open');
		};

		socket.onmessage = function(evt) {
			
			var data = evt.data;
			
			data = JSON.parse(data);
			var myName = '${user.seq}';
			
			if(data.senderId == 0){ //관리자 메시지인 경우(나가기,초대받아 들어옴, 채팅방 이름 변경)
				if(data.messageType == 'changeChatRoomName'){
					$('.header').children('label').text("");
					$('.header').children('label').text(data.chatRoomName);
					roomNameChangeStatus = 'y';
					opener.parent.resetChatRoomName('${roomId}', data.chatRoomName, 0);
				}else if(data.messageType == 'invite'){
					var addMember = data.userName;
					var tempArray = addMember.split(",");
					$.each(tempArray,function(index,element){
						presentJoinUser.push(element);
					});
					joinedMember();
					
					if(roomNameChangeStatus == 'n'){
						var roomName = "";
						$.each(presentJoinUser,function(index,element){
							roomName += element+",";
						});
						roomName = roomName.substr(0, roomName.length -1); 
						$('.header').children('label').text("");
						$('.header').children('label').text(roomName);
						opener.parent.resetChatRoomName('${roomId}', roomName, data.joinNumber);
					}
					
				}else if(data.messageType == 'exit'){
					var exitMember = data.userName;
					var idx = presentJoinUser.indexOf(exitMember);
					presentJoinUser.splice(idx,1);
					joinedMember();
					
					if(roomNameChangeStatus == 'n'){
						var roomName = "";
						$.each(presentJoinUser,function(index,element){
							roomName += element+",";
						});
						roomName = roomName.substr(0, roomName.length -1); 
						$('.header').children('label').text("");
						$('.header').children('label').text(roomName);
						opener.parent.resetChatRoomName('${roomId}', roomName, -1);
					}
					
				}
				
			}
			
			msgPositionSelect(data); 
			opener.parent.updateLastMessage('${roomId}',data.message_content);
			
			
			window.scrollTo(0, document.body.scrollHeight); // 스크롤 하단 고정
		};
		

		socket.onclose = function() { 
			ws = null;
			socket = null;
		};
	}

	function send() { //메시지 전송
		var msg = $("#message").val();
		let today = new Date();   
		var inputDate = date_to_str(today);
		
		if (!msg.trim().length) { //공백일때 함수 탈출
			return false;
		} else {
			message = {};
			message.message_content = $("#message").val();
			message.message_sender = '${user.name}';
			message.chatRoomId = '${roomId}';
			message.message_sendTime = inputDate;
			message.senderId = '${user.seq}';
			message.messageType = 'chattingMessage';
			message.unReadCount = 0;
			socket.send(JSON.stringify(message));
			insertMessageInfo(message); //db에 저장할 메시지 정보
			$("#message").val("");
			
		}

	}
	function msgHistoryPosition(obj){ //db에서 뽑아논 메시지 위치 정하는 함수
		var myName = '${user.seq}';
		var LR = (obj.senderId != myName) ? "left" : "right";
		if(obj.senderId == '0'){
			LR = 'center';
		}
		appendMessageTag(LR, obj.message_sender, obj.message_content, obj.message_sendTime, obj.messageType);
	}
	
	function msgPositionSelect(presentMessage) { //유저가 입력한 메시지 위치 정하는 함수
		var myName = '${user.seq}';
		var LR = (presentMessage.senderId != myName) ? "left" : "right";
		if(presentMessage.senderId == '0'){
			LR = 'center';
		}
		appendMessageTag(LR, presentMessage.message_sender, presentMessage.message_content, presentMessage.message_sendTime, presentMessage.messageType);
		
	}
	// 메세지 태그 append
	function appendMessageTag(LR_className, message_sender, message_content, message_sendTime, messageType) {
		
		const chatLi = createMessageTag(LR_className, message_sender,message_content, message_sendTime, messageType);
		$('div.chat:not(.format) ul').append(chatLi);
		if(LR_className == 'right'){
			var target = $(chatLi).children('.message');
			target.css('background-color','#5f5ab9');
			target.css('color','white');
		}if(LR_className == 'left'){
			var messageNode = $(chatLi).children('.message');
			var dateNode = $(chatLi).children('.date');
			$(dateNode).insertAfter(messageNode);
		}
		
		
		var dateNode = $('#chat-ul').children().last().children('.date');
		$(dateNode).text(message_sendTime);
		if(message_sender == 'admin'){
			var target = $('#chat-ul').children().last();
			var message = $(target).children('.message');
			$(message).css('background-color', '#888');
			$(message).css('font-weight','bold');
			$(message).css('color','white');
		}
		
	}

	// 메세지 태그 생성
	function createMessageTag(LR_className, message_sender, message_content, message_sendTime, messageType) {
		// 형식 가져오기
		let chatLi = $('div.chat.format ul li').clone();
		if(messageType == 'file'){
			chatLi.addClass(LR_className);
			chatLi.find('.message span').append(
					"<a onclick='fileDownload(this);'>"+message_content+
						"<input type='hidden' value="+message_sender+">"+
					"</a>"
					
			);
			chatLi.find('.sender span').text(message_sender);
		}else{
			chatLi.addClass(LR_className);
			chatLi.find('.message span').text(message_content);
			chatLi.find('.sender span').text(message_sender);
		}
		// 값 채우기
		
		
		return chatLi;
	}

	function insertMessageInfo(message) { //메시지 db에 저장하는 함수
		var name = '${vo.name}';
		
		$.ajax({
			type : "POST",
			url : 'insertMessage.do',
			data : message,
			success : function(result) { //result : 현재 메시지가 발생한 채팅방에 접속해 있는 않은 사람 목록 반환됨
				if(message.messageType == 'chattingMessage' || message.messageType =='file'){ //메시지 타입이 나가기, 방제 변경, 초대가 아니고 단순 채팅일 경우
					opener.parent.chatAlert(result, message); //알림 쏴주는 메시지 호출
				}else if(message.messageType == 'exit'){
					window.open("about:blank","_self").close();
				}
			},
			error : function() {
				alert('문자열 길이가 초과되어 에러가 발생했습니다');
			}
		});
	}
	function showHidden(e){
		e.stopPropagation();
		$('.hidden').show();
	}
	function joinedMember(){ //참여자 목록 띄우기
		$('.member-list').children('ul').children('li').remove();
		$.each(presentJoinUser,function(index,element){
			$('.member-list').children().append(
			"<li>"+element+"</li>"
			);	
		});
	}
	
	function date_to_str(format) //날짜 형식 변환

	{
	    var year = format.getFullYear();
	    var month = format.getMonth() + 1;
	    if(month<10) month = '0' + month;
	    var date = format.getDate();
	    if(date<10) date = '0' + date;
	    var hour = format.getHours();
	    if(hour<10) hour = '0' + hour;
	    var min = format.getMinutes();
	    if(min<10) min = '0' + min;
	    var sec = format.getSeconds();
	    if(sec<10) sec = '0' + sec;
	    return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;

	}
	
	//초대 가능한 사람 목록팝업창 띄우기
	function makeChatRoom(){
	
	var popupWidth = 300;
	var popupHeight = 500;
	var popupX = (window.screen.width/2) - (popupWidth/2);
	var popupY= (window.screen.height/2) - (popupHeight/2);
	
	var url = "inviteChatting.jsp?param="+'${roomInfo.chatRoomId}';
	window.open(url,"invitewindow", 'status=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

	}
	
	function friendAddMessage(invitedUserInfo){
		var inviteUsers = "";
		$.each(invitedUserInfo, function(index,element){ 
			inviteUsers += "," + element.userName;
		});
		
		inviteUsers = inviteUsers.substring(1);
		let today = new Date();   
		var inputDate = date_to_str(today);
		message = {};
		message.header = 'chatting'; //채팅방에서 쓸 메시지
		message.message_content = inviteUsers + " 님이 초대되었습니다";
		message.userName = inviteUsers;
		message.joinNumber = invitedUserInfo.length;
		message.message_sender = 'admin';
		message.chatRoomId = '${roomInfo.chatRoomId}';
		message.message_sendTime = inputDate;
		message.senderId = 0; //아이디가 0번이면 공지사항 메시지 아이디
		message.messageType='invite'; //초대메시지
		socket.send(JSON.stringify(message));
		insertMessageInfo(message); //db에 저장할 메시지 정보
		
	}
	
	function getRoomId(){
		var roomId= '${roomInfo.chatRoomId}';
		return roomId;	
	}
	function changeChatRoomName(){ //채팅방 이름 변경
		var userInput = prompt("채팅방 이름을 설정하세요");
		
		if(userInput){ 
			var sendData = {
					chatRoomId : '${roomInfo.chatRoomId}',
					chatRoomName : userInput
				}
			
				$.ajax({
					type : "POST",
					url : 'changeChatRoomName.do',
					data : sendData,
					success : function(data) {
						changeRoomName(userInput) 
					},
					error : function(err) {
						alert('에러발생');
					}
				});
					
		} //end if
	}
	
	function changeRoomName(roomName){ //채팅방 이름 변경되면 채팅창 메시지로 쏴줌 
		
		let today = new Date();   
		var inputDate = date_to_str(today);
		message = {};
		message.header = 'chatting';
		message.message_content = roomName+ " 으로 방이름이 변경되었습니다";
		message.chatRoomName = roomName;
		message.message_sender = 'admin';
		message.chatRoomId = '${roomInfo.chatRoomId}';
		message.message_sendTime = inputDate;
		message.senderId = 0;
		message.messageType = 'changeChatRoomName';
		socket.send(JSON.stringify(message));
		insertMessageInfo(message); //db에 저장할 메시지 정보
		
		
	}
	
	function exitChatRoom(){ //채팅방 나갈때 호출하는 함수
		var input = confirm('채팅방에서 나가시겠습니까? 대화 기록이 모두 삭제 됩니다.\n단순히 채팅 창을 끄고 싶으신 경우는 상단의 X 를 클릭하거나\nALT+F4를 누르시면 됩니다');
		if(input){
			var sendData = { 
					chatRoomName : '${roomInfo.chatRoomName}',
					chatRoomId : '${roomInfo.chatRoomId}',
					inviteUser : '${roomInfo.inviteUser}',
					inviteUserId : '${roomInfo.inviteUserId}',
					joinNumber : '${roomInfo.joinNumber}',
					roomNameChange : roomNameChangeStatus
				}
			$.ajax({
				type : "POST",
				url : 'exitChatRoom.do',
				data : sendData,
				success : function() {
					
				},
				error : function() {
					alert('에러발생');
				}
			}) //end ajax
		
		//채팅창에 메시지 쏴줌
		let today = new Date();   
		var inputDate = date_to_str(today);
		var name = '${user.name}';
		message = {};
		message.header = 'chatting';
		message.message_content = name+ " 님이 나갔습니다";
		message.userName = name;
		message.message_sender = 'admin';
		message.chatRoomId = '${roomInfo.chatRoomId}';
		message.message_sendTime = inputDate;
		message.senderId = 0;
		message.messageType = 'exit';
		socket.send(JSON.stringify(message));
		var roomId = '${roomInfo.chatRoomId}';
		
		insertMessageInfo(message); //db에 저장할 메시지 정보
		opener.parent.resetChatList(roomId);
		
		
		}//end if
		
	}
	
	function uploadFile(){
		
		var fileValue = $(".input-file").val().split("\\");
        var fileName = fileValue[fileValue.length-1];
        
       
		let today = new Date();   
		var inputDate = date_to_str(today);
		message = {};
		message.header = 'chatting';
		message.message_content = fileName;
		message.message_sender = '${user.name}';
		message.chatRoomId = '${roomId}';
		message.message_sendTime = inputDate;
		message.senderId = '${user.seq}';
		message.messageType = 'file';
		message.unReadCount = 0;
		socket.send(JSON.stringify(message));
		insertMessageInfo(message); //db에 저장할 메시지 정보
		$("#message").val("");
		
		uploadFileForm(message);
    
    }
	
	function uploadFileForm(message){
		var formData = new FormData();
		formData.append("upload",$('input[name=upload]')[0].files[0]);
		formData.append("chatRoomId",message.chatRoomId);
		formData.append("fileName",message.message_content);
		formData.append("message_sender",message.message_sender);
		$.ajax({ 
			type: 'POST', 
			url: 'uploadFile.do', 
			processData: false, // 필수 
			contentType: false, // 필수 data: formData, 
			data : formData,
			success: function(data){ 
				
			},
			error : function(err) {
				alert('에러발생');
			} 
		});

	}
	function fileDownload(target){
		var message_sender = $(target).children().val();
		var fileName = $(target).text();
		window.location = 'chatFileDown.do?message_sender='+message_sender +'&fileName='+fileName + '&chatRoomId='+${roomId};
	}
</script>
</html>