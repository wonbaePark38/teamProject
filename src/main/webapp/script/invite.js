/**
 * 관리자 페이지에서 초대 메일 보내는 자바스크립트 파일
 */

$(document).ready(function(){
	$('.blue').click(function(){
		var url = [];
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	var myEmail = sessionStorage.getItem("myEmail",true);
    	var status;
		var size = $("input[class=send-mail-address]").length;
		 $("input[class=send-mail-address]").each(function (i) {
			  
			 if(myEmail == $("input[class=send-mail-address]").eq(i).val()){
				status = false;
				 alert('자기 자신은 초대할 수 없습니다');
				 
				 return false;
			 }
			 if($("input[class=send-mail-address]").eq(i).val() != ""){
				if (!getMail.test($("input[class=send-mail-address]").eq(i).val())) {
					status = false;
					alert("이메일 형식에 맞게 입력해주세요" + $("input[class=send-mail-address]").eq(i).val());
		    		url = [];
		    		
		    		return false;
		    	}
				url.push($("input[class=send-mail-address]").eq(i).val());
			} 
            status = true;
        });
		 
		console.log(status);
		 if(status){
			
			 var sendData = {
					 "mailAddress" : url
			 }
			 $.ajax({
				 url : 'sendInviteMail.do',
				 type :'POST',
				 data : sendData,
				 success : function(data){
					 if(data == 'fail'){
						 $('#hidden-status').text("");
						 $('#hidden-status').text("실패");
						 alert('회원가입이 되어 있지 않은 회원이 목록에 포함되어 있습니다.\n이메일을 확인해주세요');
					 }else{
						 $('#hidden-status').text("");
						 $('#hidden-status').text("이메일 보내기 성공!!");
						 $('#hidden-status').css('display','block');
					 }
					//$('#hidden-status').css('display','none'); 
				 }, 
				 error : function(e){
					 alert('메일보내기 에러 발생');
				 }
			 })
			
		 }
		
		
	})
});

function check(){
	
}