
$(document).ready(function () {
	$('#searchArea').css('display','none'); //헤더 검색창 숨김
	//체크박스 슬라이드 버튼 db저장 설정값에 따라 하위 체크박스 상태 설정 
	if($('input:checkbox[id="controll-alram"]').is(":checked")){
        $('.checkbox-style').attr('disabled',false);
    }else{
        $('.checkbox-style').attr('disabled',true);
    }
	
    var check = $("input[id='controll-alram']"); 
    
    check.click(function(){ //슬라이드 버튼 클릭 이벤트
    	$('#push-confirm').css('display','block');
		
        $("p").toggle();
        var status =$('#controll-alram');
        if($('input:checkbox[id="controll-alram"]').is(":checked")){
            $('#controll-alram').val('on');
            $('.checkbox-style').attr('disabled',false);
        }else{
        	$('#controll-alram').val('off');
            $('.checkbox-style').attr('disabled',true);
        }
    });
    
    $("#project-check").change(function(){ //프로젝트 알림 체크박스 이벤트
    	$('#push-confirm').css('display','block');
    });
    
    $("#chat-check").change(function(){ //체팅 알림 체크박스 이벤트
    	$('#push-confirm').css('display','block');
    });
    
     
    $('#push-confirm').click(function(){ //적용 버튼 클릭 이벤트
    	var projectChk = $("input:checkbox[id=project-check]").is(":checked");
    	var chatChk = $("input:checkbox[id=chat-check]").is(":checked");
    	sendData = {
    			pushAlram : $('#controll-alram').val(),
    			projectAlram : projectChk,
    			chatAlram : chatChk
    	}
    	
    	$.ajax({
    		type : 'POST',
    		url : 'updatePushAlram.do',
    		data : sendData
    	}).done(function(){
    		$('#hidden-status').css('display','block');
    		
    		setTimeout(() => {
    			location.reload();
			}, 2000);
    		
    		
    	}).fail(function(){
    		alert('변경 실패');
    	})
    });
     	
});

		



/////////////////////////////////////////////////////////////////////////////////////
/*
 * favoritesSetting.jsp에서 쓰는 함수
 */
//function reset(){
//	
//    var modal = document.getElementById('modal');
//    modal.style.display = "block";
//}
/*function settinCancel(){
 
    var modal = document.getElementById('modal');
    var confirmCancel = document.getElementById("confirm-cancel");                                          
    modal.style.display="none";
}*/

/*function settingConfirm(){
 
    var modal = document.getElementById('modal');
    var confirm = document.getElementById("confirm");
    var confirmCancel = document.getElementById("confirm-cancel");                                          
    modal.style.display="none";
}*/
//////////////////////////////////////////////////////////////////////////////////////
