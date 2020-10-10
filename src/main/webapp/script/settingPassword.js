/**
 * 비밀번호 변경 페이지에서 쓸 자바스크립트 파일
 */
$(document).ready(function(){
	$('#searchArea').css('display','none'); //헤더 검색창 숨김	
	$('.change-button').click(function(){
		if(passwordCheck()){
			var inputPassword = $("#password1").val();
			var sendData = {
				password : inputPassword
			}
			$.ajax({
				type : 'POST',
				url : 'changePassword.do',
				data : sendData,
			}).done(function(){
				$('#hidden-status').css('display','block');
				setTimeout(function() {
					$('#hidden-status').css('display','none');
					}, 3000);
			}).fail(function(){
				alert('비번 변경 실패');
			})
		}
	
	});
})

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