$(document).ready(function(){
    $('#send-emailBt').click(function(){
    	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	var target = $('.email-check-div');
    	target.css('display', 'none');
    	
        var userInputEmail = $('#email-input').val();
        console.log('인풋이메일'+userInputEmail);
        
        /*이메일 유효성 체크*/
    	if (!getMail.test($("#email-input").val())) {
    		alert("이메일 형식에 맞게 입력해주세요");
    		$("#adminEmail").val("");
    		$("#adminEmail").focus();
    		return false;
    	}

   		alert('이메일을 발송하였습니다');
    	/*ajax 실행*/
    	$.ajax({
    	       url: 'searchEmail.do',
    	       method:'GET',
    	       dataType:'json',
    	       data:{
    	           email:userInputEmail,
    	       },
    	       success : function(data){
    	       	if(data.emailCheck === 'false'){
    	       		var target = $('.email-check-div');
    	       		target.css('display','block');
    	       	}
    	       },
    	       error : function(err){
    	       	alert("통신에러발생");
    	       	console.log(err);
    	       }
    	    });


    });
    
});





