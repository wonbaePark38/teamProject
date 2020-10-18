/**
 * 프로젝트 매니저 파일 다운로드 제한 페이지에서 쓸 자바스크립트 파일
 */

$(document).ready(function(){
	//프로젝트 다운로드 금지 세팅값 가져오기
	$.ajax({
		type : 'POST',
		url : 'getDownloadSetting.do',
		
	}).done(function(data){
		if(data == 'y'){
			$('#prohibition-switch').prop('checked',true);
		}
	}).fail(function(){
		alert('프로젝트 정보 로딩 실패');
	})
	
	$('#prohibition-switch').click(function(){
		if($('input:checkbox[id="prohibition-switch"]').is(":checked")){
			$('#prohibition-switch').val('y');
		}else{
			$('#prohibition-switch').val('n');
		}
		
		var status = $('#prohibition-switch').val();
		
		$.ajax({
			type : 'POST',
			url : 'changeDownProhibitionSetting.do',
			data : {
				downProhibition : status
			}
		}).done(function(){
			$('#hidden-status').css('display','block');
			setTimeout(() => {
				$('#hidden-status').css('display','none');
			}, 2000);
		}).fail(function(){
			alert('프로젝트 정보 로딩 실패');
		})
	});
	
	
	
});