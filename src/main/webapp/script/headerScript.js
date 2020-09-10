$(document).ready(function(){
	var reloading = sessionStorage.getItem("reloading"); //알람 온오프 알림창 세션
	
	if(reloading){
		sessionStorage.removeItem("reloading"); //세션 제거
		 $('#socketChatAlert').append(
		  	"<span>설정이 변경되었습니다.</span>");
		 $('#socketChatAlert').css('display','block');
		 $('#header_chat_div').css('display','block');
		  setTimeout(() => {
			  $('#socketChatAlert').css('display','none'); 
		  }, 3000);
	}
	 //검색기능 이벤트
	  $("#searchChatRoom").keyup(function(e){
		  var keyword = $(this).val();
		  $(".chat-row").hide();
		  var listDiv = $(".row-label:contains('" + keyword + "')");
		  $(listDiv).parent().show();
	  });
	  
	  $(document).on('click','#chat-alram-bt',function(){ //채팅 리스트 div에서 채팅 알림 온오프 버튼 클릭 이벤트
		  $('#socketChatAlert').empty();
		  var status = $('#chat-alram-bt').text();
		  
		  var flag;
		
		  if(status == 'alarmOn'){
			  flag = 'true';
			 $('#chat-alram-bt').text('alarmOff');
			
		  }else if(status == 'alarmOff'){
			  flag = 'false';
			  $('#chat-alram-bt').text('alarmOn');	
			
		  }
		 var sendData = {
				 chatAlram : flag
		 }
		  
		 $.ajax({
			  type : 'POST',
			  url : 'changeChatAlarm.do',
			  data : sendData
		  }).done(function(){
			 
			  sessionStorage.setItem("reloading",true);  //새로고침 후에 화면에 변경메시지 알림 띄우기 위해 세션 사용
			  location.reload();
			  
		  }).fail(function(){
			  alert('변경 실패');
		  })
	  });
	  
});

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
  
 