<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
	<div class="logo_load_div">
		<div class="lld_title" style="background-color: #f4f4f4; border-radius: 7px 7px 0 0; height: 43px;">
			<div style="padding: 11px 0 0 16px; font-size: 16px; float: left;">로고 등록</div>
			<a style=" float: right;padding: 10px;">X</a>
		</div>
		
		
		<div class="lld_content" style="padding: 20px;">
			<div class="logo_img" style="padding:10px; text-align: center;">
				<h2 style="margin: 0px;">우리 회사 로고를 등록하세요!</h2>
				<div class="pop_logo" style="line-height: 132px;	">
					<a id="pop_logo_btn">파일 첨부</a>
					<img id="lld_img" src="images/다운로드1.png" >
				</div>
				<div style="text-align: left;">
					<a style="display: block;">다시등록하기</a>
					<a style="color:red;">로고삭제</a>
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