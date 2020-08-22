/**
 * 계정정보 페이지에서 쓰는 자바스크립트 파일
 */

$(document).ready(function(){
	
	$('#searchArea').css('display','none');
	
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

});