/**
 * 잠금 모드 설정 페이지 스크립트 파일 
 */

$(document).ready(function(){
	$('#searchArea').css('display','none');
	/*락모드 슬라이드 이벤트*/
	$('#lock').click(function(){
		
		$('#change-lock-settingBt').show();
		$("p").toggle();
		
		if($('input:checkbox[id="lock"]').is(":checked")){
			console.log('아싀발 뭔데');
			$('.lock-select').attr('disabled',false);
			
		}else{
			console.log('잠금모드 사용 해체 체크');
			$('#lock').val('off');
			$('.lock-select').attr('disabled',true);
		}
	});
	
	/*페이지 로딩 됐을때 화면에 보여줄 값 세팅*/
	var status = $('#session').val();
	if(status == 'on'){
		$('#lock').prop('checked',true);
		$('.lock-select').attr('disabled',false);
	}
	
	
	
	
	/*값 변경되면 화면에 적용 버튼 띄워줌*/
	$('.lock-select').change(function(){
		var temp = this.value;
		$('#change-lock-settingBt').show();
	})
});