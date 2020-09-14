/**
 * 계정정보 페이지에서 쓰는 자바스크립트 파일
 */

$(document).ready(function(){
	
	$('#searchArea').css('display','none'); //헤더 검색창 숨김
	//프로필 사진 변경됐을때 이벤트
	$(document).on('change','.profile-photo-upload',function(){
		var splitFile = $('.profile-photo-upload').val().split('\\');
		var profileFileName = splitFile[splitFile.length-1];
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".photo-area img").attr("src", data.target.result).width(90);       
				$(".photo-area img").css("border-radius",'50%');
			}
			reader.readAsDataURL(this.files[0]);
		}
		$('#uploadBt').css('display','block');
	});
	
	//편집 버튼 이벤트
	$('.edit').click(function(){
		target = $(this).prev();
			
		$(this).prev().css('border-bottom','1px solid black');
		$(this).prev().removeAttr("readonly");
		$('#confirm').css('display','block');
	});
	
	$('#info-cancle').click(function(){
		$('#confirm').css('display','none');
	})
	
	//정보 변경 확인 버튼 이벤트
	$('#info-confirm').click(function(){
		var sendData = {
				phoneNumber : $('#user-phone-number').val(),
				companyName : $('#company-name').val(),
				department : $('#department').val(),
				myPosition : $('#position').val(),
				companyCallNumber : $('#company-call-number').val()
		}
		
		$.ajax({
			type:'POST',
			data:sendData,
			url : 'updateAccountInfo.do'
		}).done(function(data){
			$('#hidden-status').css('display','block');
			setTimeout(function() {
				$('#hidden-status').css('display','none');
				$('#confirm').css('display','none');
				}, 3000);
			
		}).fail(function(err){
			alert('통신에러');
		});
		
	})
	
});

