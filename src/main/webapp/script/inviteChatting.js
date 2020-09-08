/**
 * 채팅방 안에서 초대 기능 구현한 자바스크립트파일
 */

$(document).ready(function(){
	
	var roomId = opener.parent.getRoomId();
	
	var sendData = {
		chatRoomId : roomId
	}
	//방안에 있는 사람을 제외하고 초대 가능한 목록 불러오기
	$.ajax({
		url:'getInviteList.do',
		method:'POST',
		data:sendData
	}).done(function(data){
		
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
				"info" : JSON.stringify(invitedUserInfo),
				chatRoomId : roomId
		};
		$.ajax({
			url:'inviteMember.do',
			method:'POST',
			data : sendData

		}).done(function(data){
			
			opener.parent.friendAddMessage(invitedUserInfo);
			window.open("about:blank","_self").close();
			
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


function openChatPopup(){
	var popupWidth = 500;
	var popupHeight = 700;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);


	var url = "chatting.do";
	window.open(url,"_blank", 'status=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);

	window.open("about:blank","_self").close();

}




