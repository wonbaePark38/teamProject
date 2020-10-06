$(document).ready(function(){
    $('#send-emailBt').click(function(){
    	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	var target = $('.email-check-div');
    	target.css('display', 'none');
    	
        var userInputEmail = $('#email-input').val();
        
        /*이메일 유효성 체크*/
    	if (!getMail.test($("#email-input").val())) {
    		alert("이메일 형식에 맞게 입력해주세요");
    		$("#adminEmail").val("");
    		$("#adminEmail").focus();
    		return false;
    	}

   		
    	/*ajax 실행*/
    	$.ajax({
    	       url: 'searchEmail.do',
    	       method:'POST',
    	       data:{
    	           email:userInputEmail,
    	       },
    	       success : function(data){
    	    	    if(data.emailCheck == 'true'){
    	    	    	var target = $('.email-check-div');
        	       		target.css('display','block');
    	    	    }else{
    	    	    	alert('가입되어 잇는 이메일이 아닙니다');
    	    	    }
    	    	    
    	       		
    	       },
    	       error : function(err){
    	       	alert("통신에러발생");
    	       	console.log(err);
    	       }
    	    });


    });
    
});





