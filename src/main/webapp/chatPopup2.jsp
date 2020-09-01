<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href='css/chatPopup2.css' rel='stylesheet' />
<script src="script/jquery-3.5.1-min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.js"></script>

</head>
<body>
	<div class="chat_wrap" >
		<div class="header">
			<label></label>
			<button id='more-bt'>
			</button>
		</div>
		<div class="chat">
			<ul id="chat-ul">
				<!-- 동적 생성 -->
			</ul>
		</div>
		<div class="input-div">
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
            </div>
            <div class="member-list">
                <ul>
        			<li>
					</li>
			
                </ul>
            </div>
          
        </div>
		
	</div>

</body>
<script>
var socket = null;

$(document).ready(function() {
	
	window.scrollTo(0, document.body.scrollHeight); // 스크롤 하단 고정
	var sendData = { //현재 방 id값 세팅
			chatroom_id : '${roomId}',
	}
	var headerName = '${chatRoomName}';
	$('.header label').text(headerName); //채팅방 헤더에 채팅방 이름 세팅
	
	let today = new Date();   
	var connectTime = date_to_str(today);
	
	var sendLogData = {
			chatRoomId : '${roomId}',
			connectTime : connectTime,
	}
	//접속 로그 업데이트
	$.ajax({
			type : "POST",
			url : 'updateConnectTime.do',
			data : sendLogData,
			success : function(data) {
				//joinedMember(data); //참여자 목록 세팅
			},
			fail : function(err) {
				alert('에러발생');
			}
		});
	
		connect();
		
	$.ajax({ //채팅 내역 로드
		type : "POST",
		url : 'loadMessage.do',
		data : sendData,
		success : function(data) {
			
			$.each(data,function(index,element){
				msgHistoryPosition(element); //화면에 뿌려줌
				
				var myName = '${user.seq}';
				var LR = (element.senderId != myName) ? "left" : "right";
				
				if(LR == 'left'){ //메시지 div 와 날짜 div 위치 변경
					var target = $('#chat-ul').children().last();
					var message = $(target).children().last();
					var date = $(message).prev();
					$(message).css('margin-left','20px');
					$(date).insertAfter(message);
				}
				
			});
			data = null;
		},
		fail : function(err) {
			alert('에러발생');
		}
			
	})	
	
		$(document).on('keydown', '#message', function(e) { //엔터 이벤트
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13' && !e.shiftKey) {
				send();
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
		
		var ws = new WebSocket("ws://localhost:8080/plugProject/chat.do");
		socket = ws;

		socket.onopen = function() {
			console.log('open');
		};

		socket.onmessage = function(evt) {

			var data = evt.data;
			data = JSON.parse(data);
			msgPositionSelect(data); 
			var myName = '${user.seq}';
			var LR = (data.senderId != myName) ? "left" : "right";
			
			if(LR == 'left'){
				var target = $('#chat-ul').children().last();
				var message = $(target).children().last();
				var date = $(message).prev();
				$(message).css('margin-left','20px');
				$(date).insertAfter(message);
			
			}
			
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
			message.chatroom_id = '${roomId}';
			message.message_sendTime = inputDate;
			message.senderId = '${user.seq}';
			socket.send(JSON.stringify(message));
			insertMessageInfo(message); //db에 저장할 메시지 정보
			$("#message").val("");
		}

	}
	function msgHistoryPosition(obj){ //db에서 뽑아논 메시지 위치 정하는 함수
		var myName = '${user.seq}';
		var LR = (obj.senderId != myName) ? "left" : "right";
		appendMessageTag(LR, obj.message_sender, obj.message_content, obj.message_sendTime);
		
	}
	
	function msgPositionSelect(presentMessage) { //유저가 입력한 메시지 위치 정하는 함수
		var myName = '${user.seq}';
		const LR = (presentMessage.senderId != myName) ? "left" : "right";
		appendMessageTag(LR, presentMessage.message_sender, presentMessage.message_content, presentMessage.message_sendTime);
		
	}
	// 메세지 태그 append
	function appendMessageTag(LR_className, message_sender, message_content, message_sendTime) {
		const chatLi = createMessageTag(LR_className, message_sender,message_content, message_sendTime);
		
		if(LR_className == 'right'){
			
			var target = $(chatLi).children('.message');
			target.css('background-color','#5f5ab9');
			target.css('color','white');
		}
	

		$('div.chat:not(.format) ul').append(chatLi);
		
		var dateNode = $('#chat-ul').children().last().children('.date');
		
		$(dateNode).text(message_sendTime);
	}

	// 메세지 태그 생성
	function createMessageTag(LR_className, message_sender, message_content, message_sendTime) {
		// 형식 가져오기
		let chatLi = $('div.chat.format ul li').clone();
		
		// 값 채우기
		chatLi.addClass(LR_className);
		chatLi.find('.message span').text(message_content);
		chatLi.find('.sender span').text(message_sender);
		
		return chatLi;
	}

	function insertMessageInfo(message) { //메시지 db에 저장

		$.ajax({
			type : "POST",
			url : 'insertMessage.do',
			data : message,
			success : function(result) {
			},
			fail : function(err) {
				alert('에러발생');
			}
		});
	}
	function showHidden(e){
		e.stopPropagation();
		$('.hidden').show();
	}

	/*function joinedMember(data){ //참여자 목록 띄우기
		$.each(data,function(index,element){
			$('.member-list').children().append(
			"<li>"+element.userName+" ("+element.userEmail+")</li>"
			);	
		});
	}*/
	
	function date_to_str(format)

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

</script>
</html>