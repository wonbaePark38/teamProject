/**
 * 헤더 아이콘 관련 자바스크립트파일
 */

var socket = null;
$(document).ready(function(){
	
	$(document).on('click','#chat-row',function(){
		var roomId = $(this).val();
		var projectId = $(this).children().next().next().next().next().val();
		
		var url = "chatting.do?roomId=" + roomId + "&projectId=" + projectId;
		window.open(url,"newwindow","height=700, width=500, resizable=yes");
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

