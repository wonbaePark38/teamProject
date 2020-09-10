/**
 * 로그아웃 기록 남기는 스크립트
 */
$(document).ready(function(){
	$(window).bind("beforeunload", function (e){
		e.preventDefault();
		$.ajax({
			type : 'POST',
			url : 'updateLogoutTime.do'
		}).done(function(){
		}).fail(function(){
		})
		
	});
})