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
	$(document).on('click', '#setting' ,function(){
		if ($(this).val()=='수정') {
			$(this).val('취소');
		} else {
			$(this).val('수정');
		}
		$(this).parent().children('input[id^=set_btn]').fadeToggle('fast');
	});
</script>
</head>
<body>
	<div class="admin_contents">
	
		<header>회사 정보</header>
		
		
		<div class="content" style=" padding-bottom: 14px;">
		<dl>
			<dt style="padding-top: 15px;">회사명</dt>
			<dd>
				<input type="text"disabled="disabled" value="입력한 회사명" maxlength="20" style="">
				<input id="set_btn" type="button" value="저장" class="btn1 blue" style="display: none;">
				<input id="setting" type="button" class="btn1" value="수정">
			</dd>
			<dt>로고설정</dt>
			<dd>
				<div class="admin_logo_load" >
					<a onclick="officePop('office_logo.jsp')">+ 로고 등록</a>
				</div>
				<p style="font-size: 12px; color: #a2a2a2; margin: 3px 0px;">권장사항 - 200*100px, PNG / 최대 500KB</p>
			</dd>
		</dl>
		</div>
		
		
		<div class="url_setting">
			<dl>
				<dt>전용 URL</dt>
				<dd>
					<p>전용 URL 주소를 전달하여 회사 직원들을 참여시킬 수 있습니다.</p>
					<input type="text"disabled="disabled" value="https://회사주소" maxlength="20" style="color:#307cff; font:bold;">
					<input id="set_btn" type="button" value="저장" class="btn1 blue" style="display: none;">
					<input id="setting" type="button" class="btn1" value="수정">
				</dd>
			</dl>
			
		</div>
		
		
		<div class="client_set">
			<p style="margin: 8px 0px;">직원 참여 옵션</p>
			<div>
				<label style="cursor:pointer" for="teamSet1">
					<input type="radio" id="teamSet1" name="user_group" value="1">
					<span>관리자의 가입 승인 완료 후, 참여하도록 설정합니다.</span>
				</label>
			</div>
			<div>
				<label style="cursor:pointer" for="teamSet2">
					<input type="radio" id="teamSet2" name="user_group" value="2">
					<span>특정 도메인의 이메일로 가입시, 관리자 승인 없이도 바로 참여할 수 있도록 설정합니다.</span>
				</label>
			</div>
			<div class="url_box">
				<span>@</span>
				<input type="text" maxlength="50" style="width:420px;" placeholder="도메인 입력, 도메인 중복 등록 시 콤마로 구분" >
				<input type="button" value="저장" class="btn1 blue">

			</div>
		</div>	
	
	</div>
</body>
</html>