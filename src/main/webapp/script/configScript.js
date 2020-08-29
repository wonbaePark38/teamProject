
$(document).ready(function () {
  
	$('#searchArea').css('display','none');

    var check = $("input[id='alram1']");
    var check2 = $("input[id='alram2']");
    var lock = $("input[id='lock']");
    
    check.click(function(){
        $("p").toggle();
        var status =$('#alram1');
        if($('input:checkbox[id="alram1"]').is(":checked")){
            console.log('체크됨');
            $('.checkbox-style').attr('disabled',false);
        }else{
            console.log('체크해제');
            $('.checkbox-style').attr('disabled',true);
        }
    });

    check2.click(function(){
        $("p").toggle();
        var status =$('#alram2');
        if($('input:checkbox[id="alram2"]').is(":checked")){
            console.log('체크됨');
            $('.start-combobox').attr('disabled',false);
            $('.end-combobox').attr('disabled',false);
        }else{
            $('.start-combobox').attr('disabled',true);
            $('.end-combobox').attr('disabled',true);
            console.log('체크해제');
            
        }
    });

    
    
	

    
});

		

/*
 * settingPassword.jsp에서 쓰는 함수
 */
function passwordCheck(){
	var getCheck= RegExp(/^[a-zA-Z0-9]{6,16}$/);
	// 비밀번호 공백 확인
	if ($("#password1").val() == "") {
		alert("패스워드가 입력되지 않았습니다");
		$("#password1").focus();
		return false;
	}
	// 비밀번호 유효성검사
	if (!getCheck.test($("#password1").val())) {
		alert("형식에 맞게 입력해주세요");
		$("#password1").val("");
		$("#password1").focus();
		return false;
	}
	// 비밀번호 확인란 공백 확인
	if ($("#password2").val() == "") {
		alert("비밀번호 확인란이 비었습니다.");
		$("#password2").focus();
		return false;
	}
	// 비밀번호 서로확인
	if ($("#password1").val() != $("#password2").val()) {
		alert("비밀번호가 서로 같아야 합니다.");
		$("#password1").val("");
		$("#password2").val("");
		$("#password1").focus();
		return false;
	} 
	return true;
}
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
function removeDevice(){
    alert('제거버튼 클릭');
}