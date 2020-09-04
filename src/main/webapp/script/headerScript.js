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
		$.each(data,function(index,element){
			settingChatList(element);//채팅방 리스트 클릭
			
		});
	}).fail(function(err){
		alert('통신오류');
	});
	
	
	$(document).on('click','#chat-row',function(){
		var roomId = $(this).children('.room').val();
		/*var roomId = $(this).val();
		var projectId = $(this).children().next().next().next().next().val();
		var chatroom_name = $(this).children().next().next().text();*/
		console.log('채팅방 id '+roomId);
		sendData = {
			chatRoomId : roomId	
		}
		/*$.ajax({
			url:'getChatRoomInfo.do',
			type : 'POST',
			data : sendData
		}).done(function(data){
			console.log(data);
			openChatPopup(roomId);
		}).fail(function(err){
			alert('통신 에러');
		});*/
		openChatPopup(roomId);
		
	});
	
	connect();
	
});

//채팅 리스트 화면에 출력하는 함수
function settingChatList(element){
	
	$('.chatting-list-div').append(
			
			"<button type='button' id='chat-row'>" +
					"<div class='row-label'>" +element.chatRoomName + "</div>" +
					"<span class='chat-user-number'>"+element.joinNumber+"</span>"+
//			"<span>"+ element.chatRoomName +"</span>" +
				"<input type='hidden' class='room' value='" + element.chatRoomId +"'/>" +
			"</button>"
			
	);
	
	/*if(element.roomPassword){
		var parent = $('.chatting-list-div>').next().last();
	$('.chatting-list-div>').next().last().append(
			"<i class='fas fa-lock' style='font-size:15px; color:#6862c3; margin-left:10px;'></i>"
		);
	}*/
	
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
	window.open(url,"_blank", 'status=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	
}
