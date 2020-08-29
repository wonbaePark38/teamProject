<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="header"></div>
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
	</div>

</body>
<script>
var socket = null;

$(document).ready(function() {
	
	
	var sendData = { //현재 방 id값 세팅
			chatroom_id : '${roomId}',
	}
	var headerName = '${chatRoomName}';
	console.log(headerName);
	$('.header').text(headerName);
	//채팅 내역 로드
	$.ajax({
			type : "POST",
			url : 'loadMessage.do',
			data : sendData,
			success : function(data) {
				console.log(data);
				$.each(data,function(index,element){
					msgHistoryPosition(element);
				});
			},
			fail : function(err) {
				alert('에러발생');
			}
		});
	
		connect();
		$(document).on('keydown', '#message', function(e) { //엔터 이벤트
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13' && !e.shiftKey) {
				send();
			}
			event.stopPropagation(); //이벤트 버블링 막기

		});

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

			window.scrollTo(0, document.body.scrollHeight); // 스크롤 하단 고정
		};

		socket.onclose = function() { 
			console.log('close');
			ws = null;
			socket = null;
		};
	}

	function send() { //메시지 전송
		var msg = $("#message").val();
		let today = new Date();   
		var inputDate = today.toLocaleString(); 
		
		if (!msg.trim().length) { //공백일때 함수 탈출
			return false;
		} else {
			message = {};
			message.message_content = $("#message").val();
			message.message_sender = '${user.name}';
			message.chatroom_id = '${roomId}';
			message.message_sendTime = inputDate;
			
			socket.send(JSON.stringify(message));
			insertMessageInfo(message); //db에 저장할 메시지 정보
			$("#message").val("");
		}

	}
	function msgHistoryPosition(obj){ //db에서 뽑아논 메시지 위치 정하는 함수
		var myName = '${user.name}';
		const LR = (obj.message_sender != myName) ? "left" : "right";
		appendMessageTag(LR, obj.message_sender, obj.message_content, obj.message_sendTime);
	}
	
	function msgPositionSelect(presentMessage) { //유저가 입력한 메시지 위치 정하는 함수
		var myName = '${user.name}';
		const LR = (presentMessage.message_sender != myName) ? "left" : "right";
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
		var dateNode = $('div.chat:not(.format) ul').children().children('.date').last();
		$(dateNode).text(message_sendTime);
	}

	// 메세지 태그 생성
	function createMessageTag(LR_className, message_sender, message_content, message_sendTime) {
		// 형식 가져오기
		let chatLi = $('div.chat.format ul li').clone();

		// 값 채우기
		chatLi.addClass(LR_className);
		chatLi.find('.sender span').text(message_sender);
		chatLi.find('.message span').text(message_content);

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
</script>
</html>