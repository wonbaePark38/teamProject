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
	<div class="admin_contents">
		<header>사용자 초대</header>
		<dl>
			<dt style="padding-top: 15px;">전용 URL</dt>
			<dd>
				<p style="margin-bottom: 15px;">전용 URL 주소를 전달하여 회사 직원들을 참여시킬 수 있습니다.</p>
				<div class="url_input_box">
					<input type="text" placeholder="플로우 기업용 주소">
					<button class="btn_copy" type="button" title="Copy" style="padding-top: 5px;"></button>
				</div>
			</dd>
			<dt style="padding-top: 15px;">이메일 초대</dt>
			<dd class="invite_url">
				<p style="margin-bottom: 15px;">직원들의 이메일 주소를 입력하여 바로 초대할 수 있습니다.</p>
				<ul style="list-style: none;">
					<li><input type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input type="text" placeholder="example@flow.team" maxlength="100"></li>
				</ul>
				<button class="btn btn1 blue">발송</button>
			</dd>
		</dl>
	</div>
</body>
</html>