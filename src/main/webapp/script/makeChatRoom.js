$(document).ready(function(){
	//내가 가입한 프로젝트 목록 불러오기
	$.ajax({
		url:'getProjectList.do',
		method:'POST',
	}).done(function(data){
		console.log(data);
		$.each(data,function(index,element){
			settingProjectList(element);//채팅방 리스트 클릭
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
    	if(checks()){ //유효성 검사에서 true일때
    		var projectId = $("#select-projectId option:selected").val();
        	
        	var sendData ={
        		chatRoomName : $('#roomName-input').val(),
        		projectId : projectId,
        		roomPassword : $('#password-input').val(),
        		projectName : $('#projectName').val()
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
    	}
    
    });
    	
    $('#cancel').on('click',function(){ //취소 버튼 클릭 팝업 닫기
    	window.open("about:blank","_self").close();
    });
    	
	
});

function settingProjectList(element){//프로젝트 리스트 화면 출력
	$('#select-projectId').append(
			"<option value="+element.projectId +">" + element.projectName +
			"</option>" +
			"<input type='hidden' id=projectName value=" + element.projectName +">"
			
			);
}

function checks(){
	
	var getName= RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,16}$/);
	//방 이름 공백검사
	if ($("#roomName-input").val() == "") {
		alert("채팅방 이름을 입력해주세요");
		$("#adminId").focus();
		return false;
	}
	
	if($("#radio-bt").val() ==""){
		alert('채팅방이 개설될 프로젝트를 선택해주세요');
		$("#radio-bt").focus();
		return false;
	}
	 if($("input[name=radioSelect]:checked").val() == "y"){
		// 비밀번호 공백 확인
			if ($("#password-input").val() == "") {
				alert("패스워드 입력바람 4글자 이상 입력하면 됩니다");
				$("#password-input").focus();
				return false;
			}
			// 비밀번호 유효성검사
			if (!getCheck.test($("#password-input").val())) {
				alert("형식에 맞게 입력해주세요");
				$("#password-input").val("");
				$("#password-input").focus();
				return false;
			}
			// 비밀번호 확인란 공백 확인
			if ($("#password-input-re").val() == "") {
				alert("패스워드 확인란을 입력해주세요");
				$("#password-input-re").focus();
				return false;
			}
			// 비밀번호 서로확인
			if ($("#password-input").val() != $("#password-input-re").val()) {
				alert("비밀번호가 상이합니다");
				$("#password-input").val("");
				$("#password-input-re").val("");
				$("#password-input").focus();
				return false;
			} 
	 }
	
	return true;
}

