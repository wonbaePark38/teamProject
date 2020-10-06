<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link rel="stylesheet" href="css/admin.css">
<script src="script/jquery-3.5.1-min.js"></script>	
<script>
	$(document).on('click', 'a',function(){
		var click_e = $(this).attr('id');
		if(click_e == 'pop_logo_btn'){
			$('.wrap').append(data);
		};
		if(click_e == 'logo_close'){
			alert('로고등록창 닫기');
		}; 
		if (click_e == 'reset_img') {
			alert('로고다시등록하기');
		}
		if (click_e == 'delete_img') {
			alert('로고삭제하기');
		}
	});
</script>
</head>
<body>
	<div class="logo_load_div">
		<div class="lld_title" style="background-color: #f4f4f4; border-radius: 7px 7px 0 0; height: 43px;">
			<div style="padding: 11px 0 0 16px; font-size: 16px; float: left;">로고 등록</div>
			<a id="logo_close"  class="click_btn"  style=" float: right;padding: 10px;">X</a>
		</div>
		
		
		<div class="lld_content" style="padding: 20px;">
			<div class="logo_img" style="padding:10px; text-align: center;">
				<h2 style="margin: 0px;">우리 회사 로고를 등록하세요!</h2>
				<div class="pop_logo" style="line-height: 132px;	">
					<a id="pop_logo_btn" class="click_btn" >파일 첨부</a>
					<img id="lld_img" src="images/다운로드1.png" >
				</div>
				<div style="text-align: left;">
					<a id="reset_img" style="display: block;">다시등록하기</a>
					<a id="delete_img" style="color:red;">로고삭제</a>
				</div>
			</div>
		</div>
		
		
		<div class="lld_btn">
			<input type="button" class="btn1" value="취소">
			<input type="button" class="btn1" value="저장">
		
		</div>
	</div>
	
	<div class="background_shadow" style="z-index: 200;"></div>
</body>
</html>