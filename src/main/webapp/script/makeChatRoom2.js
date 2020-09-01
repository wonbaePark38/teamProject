$(document).ready(function(){
	//같은 프로젝트 가입된 사람 불러오기
	$.ajax({
		url:'getFriendList.do',
		method:'POST',
	}).done(function(data){
		console.log(data);
		$.each(data,function(index,element){
			settingFriendList(element);//채팅방 리스트 클릭
		});
		
	}).fail(function(err){
		alert('통신오류');
	});
	
	  // 라디오버튼 클릭시 이벤트 발생
   $("input:radio[name=radioSelect]").click(function(){
    	
        if($("input[name=radioSelect]:checked").val() == "y"){
        	console.log('예')
            $("#password-input").attr("disabled",false);
            $("#password-input-re").attr("disabled",false);
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input[name=radioSelect]:checked").val() == "n"){
        	console.log('아니오');
              $("#password-input").attr("disabled",true);
              $("#password-input-re").attr("disabled",true);
              $('#password-input').val("");
              $("#password-input-re").val("");
              
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
    
   //만들기 버튼 클릭
    $('#confirm').on('click',function(){
    	var invitedUserId = [];
    	var invitedUserName = [];
    	//for문 돌면서 체크값 배열에 저장
    	$("input[name='user']:checked").each(function(i){
    		invitedUserId.push($(this).val());
    		var labelValue = $(this).prev().text();
    		invitedUserName.push(labelValue);
    	});
    	var sendData={
    		"invitedId" : invitedUserId,
    		"invitedName" : invitedUserName
    	};
        	$.ajax({
        		url:'createRoom.do',
        		method:'POST',
        		data : sendData,
        	}).done(function(data){
        		alert('채팅방 만들기 성공');
        		window.open("about:blank","_self").close();
        	}).fail(function(err){
        		alert('통신오류');
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
				"<label>" + element.name + " ( " +element.email + " )" +
				"</label>" +
				"<input type='checkbox' name='user' value="+element.seq+">" +
			"</li>"
			
			);
}



