/**
 * 잠금 모드 설정 페이지 스크립트 파일 
 */

$(document).ready(function(){
	$('#searchArea').css('display','none');
	
	/*페이지 로딩 됐을때 화면에 보여줄 값 세팅*/
	var status = $('#session').val();
	
	if(status == 'on'){
		$('#lock').prop('checked',true);
		$('.lock-select').attr('disabled',false);
		var selectValue = $('#sessionSelect').val();
		$('.lock-select').val(selectValue);
	}
	/*락모드 슬라이드 이벤트*/
	$('#lock').click(function(){
		
		$('#change-lock-settingBt').show();
		$("p").toggle();
		
		if($('input:checkbox[id="lock"]').is(":checked")){
			$('#lock').val('on');
			$('.lock-select').attr('disabled',false);
			
		}else{
			console.log('잠금모드 사용 해체 체크');
			$('#lock').val('off');
			$('.lock-select').attr('disabled',true);
		}
	});
	
	
	
	/*값 변경되면 화면에 적용 버튼 띄워줌*/
	$('.lock-select').change(function(){
		var temp = this.value;
		$('#change-lock-settingBt').show();
	})
	
	//적용 버튼 클릭이벤트
	$('#change-lock-settingBt').click(function(){
		var switchStatus = $('#lock').val();
		var selectValue = $('.lock-select').val();
		var sendData = {
			lockTime : selectValue,
			lockSwitchStatus : switchStatus
		}
		
		
		$.ajax({
			type : 'POST',
			url : 'lockSetting.do',
			data : sendData
		}).done(function(){
			$('#hidden-status').css('display','block');
			setTimeout(function() {
				$('#hidden-status').css('display','none');
				$('#change-lock-settingBt').css('display','none');
				}, 3000);
			setTimeout(function() {
				location.reload();
				}, 3000);
		}).fail(function(){
			alert('변경 실패');
		});
	});
});