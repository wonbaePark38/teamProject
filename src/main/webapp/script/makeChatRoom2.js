$(document).ready(function(){
	
	
		//같은 프로젝트 가입된 사람 불러오기
			$.ajax({
				url:'getFriendList.do',
				method:'POST',
			}).done(function(data){
				console.log(data);
				$.each(data,function(index,element){
					settingFriendList(element);//초대 가능한 목록 뿌려줌
				});
				
			}).fail(function(err){
				alert('통신오류');
			});
			
    
   //만들기 버튼 클릭
    $('#confirm').on('click',function(){
    	var invitedUserInfo = [];
    	//for문 돌면서 체크값 배열에 저장
    	$("input[name='user']:checked").each(function(i){
    		
    		joinMemberData = {};
    		joinMemberData.joinedUserId = $(this).val();
    		joinMemberData.userName = $(this).prev().text();
    		invitedUserInfo.push(joinMemberData);
    	});
    	
    	
    	var sendData={
    		"info" : JSON.stringify(invitedUserInfo)
    	};
        	$.ajax({
        		url:'createRoom.do',
        		method:'POST',
        		data : sendData,
        		
        	}).done(function(data){
        		console.log(data);
        		opener.parent.settingChatList(data);
        		self.close();
        		 //reloadChatList();
        		//(data); //채팅 팝업 띄우기
        		
        	}).fail(function(err){
        		alert('통신""오류');
        	});
        
    
    });
    	
    $('#cancel').on('click',function(){ //취소 버튼 클릭 팝업 닫기
    	window.open("about:blank","_self").close();
    });
    	
	
});

//같은 프로젝트 가입된 사람들 목록 뿌려주는 함수
function settingFriendList(element){
	$('.input-form ul').append(
			"<li>" +
				"<label>" + element.name +
				"</label>" +
				"<input type='checkbox' name='user' value="+element.seq+">" +
			"</li>"
			
			);
}


function openChatPopup(data){
	
	var popupWidth = 500;
	var popupHeight = 700;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	chatRoomId = data.chatRoomId;
	
	var url = "chatting.do?param=" + chatRoomId;
	window.open(url,"_blank", 'status=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	window.open("about:blank","_self").close();

}


