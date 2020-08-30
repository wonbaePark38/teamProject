/**
 * 헤더 아이콘 관련 자바스크립트파일
 */

var socket = null;
$(document).ready(function(){
	
	$(document).on('click','#chat-row',function(){
		
		var roomId = $(this).val();
		var projectId = $(this).children().next().next().next().next().val();
		var chatroom_name = $(this).children().next().next().text();
		
		sendData = {
			chatRoomId : roomId	
		}
		$.ajax({
			url:'getChatRoomInfo.do',
			type : 'POST',
			data : sendData
		}).done(function(data){
			console.log(data);
			if(data.roomPassword){
				var inputPassword = prompt('비밀방입니다. 비밀번호를 입력하세요');
				if(inputPassword != data.roomPassword){
					alert('비밀번호가 틀렸습니다');
					return false;
				}
			}
				var url = "chatting.do?roomId=" + roomId + "&projectId=" + data.projectId + "&chatroomName=" + data.chatRoomName;
				window.open(url,chatroom_name,"height=700, width=500, resizable=yes");
			
		}).fail(function(err){
			alert('통신 에러');
		});
		
		
	});
	
	connect();
	/*만들어진 채팅방 리스트 가저오는 이벤트*/
	$.ajax({
		url:'getChattingList.do',
		method:'POST',
	}).done(function(data){
		console.log(data);
		$.each(data,function(index,element){
			settingChatList(element);//채팅방 리스트 클릭
			
		});
	}).fail(function(err){
		alert('통신오류');
	});
	
});


function settingChatList(element){
	$('.chatting-list-div').append(
			
			"<button type='button' id='chat-row' value='" + element.chatRoomId + "'>" +
				"<span style='font-size=7px'>"+ element.projectName + "</span><br>" +
				"<span>"+ element.chatRoomName +"</span>" +
				"<input type='hidden' class='room' value='" + element.chatRoomId +"'/>" +
				"<input type='hidden' class='projectId' value='" + element.projectId +"'/>" +
			"</button>"
			
	);
	
	if(element.roomPassword){
		var parent = $('.chatting-list-div>').next().last();
	$('.chatting-list-div>').next().last().append(
			"<i class='fas fa-lock' style='font-size:15px; color:#6862c3; margin-left:10px;'></i>"
		);
	}
	
}




var socket = null;

function connect(){
	 var ws = new WebSocket("ws://localhost:8080/plugProject/echo.do");
	 socket = ws;
		ws.onopen = function(){
			console.log('Info: connection opened');
		};
		
		ws.onmessage = function(event){
			console.log("ReceiveMsg: " + event.data+'\n');
		};
		
		ws.onclose = function(event) {
			console.log('Info: connection closed.');
			ws = null;
			
		};
		ws.onerror = function(err) {console.log('Error: ',err);
			socket.close();
		};
}

//헤더 채팅영역
function headerChatting(){
  document.getElementById('header_chat_div').style.display=(document.getElementById('header_chat_div').style.display=='block') ? 'none' : 'block';
}

  function headerChattingRoom(){
    document.getElementById('header_chat_chattingRoom').style.display = 'block';
    document.getElementById('header_chat_contactAddress').style.display = 'none';
  }

  function headerContactAddresss(){
    document.getElementById('header_chat_contactAddress').style.display = 'block';
    document.getElementById('header_chat_chattingRoom').style.display = 'none';
  }



//헤더 알람영역
function headerAlarm(){
  document.getElementById('header_alarm_div').style.display=(document.getElementById('header_alarm_div').style.display=='block') ? 'none' : 'block';
  
}

//헤더 옵션영역
function headerOption(){
  document.getElementById('header_option_div').style.display=(document.getElementById('header_option_div').style.display=='block') ? 'none' : 'block';
}

function makeChatRoom(){
	var url = "makeChatRoomView.do";
	window.open(url,"newwindow","height=500, width=500, resizable=no");
}