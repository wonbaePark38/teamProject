$(document).ready(function(){
	var reloading = sessionStorage.getItem("reloading"); //알람 온오프 알림창 세션
	var lock = sessionStorage.getItem("lock");
	if(lock){
		console.log('락 발동');
		$('#lock-modal').css('display','block');
	}
	
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
	  
	  //헤더 채팅 아이콘 클릭 이벤트
	  $(document).on('click',"#headerChatBt", function(){
		  if($('#header_chat_div').css('display') === 'none'){
			  $('#header_chat_div').css('display','block');
		  }
	  });
	  
	  $(document).on('click','#headerUserInfoBt',function(){
		  if($('#header_option_div').css('display') === 'none'){
			  $('#header_option_div').css('display','block');
		  }
	  });
	  
	  $('body').on('click',function(e){ //히든 메뉴 열려있을때 바디 클릭하면 닫히는 이벤트
		  var chatContainer = $('#header_chat_div');
		  var configContainer = $('#header_option_div');
		    if( chatContainer.has(e.target).length === 0){
		      chatContainer.css('display','none');
		    }
			  
		    if( configContainer.has(e.target).length === 0){
		    	configContainer.css('display','none');
		    }
	  });
	  
	//채팅 리스트 div에서 채팅 알림 온오프 버튼 클릭 이벤트
	  $(document).on('click','#chat-alram-bt',function(){ 
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

 
  
 