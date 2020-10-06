<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="script/pageLock.js"></script>
<link href="css/lock.css" rel="stylesheet" />
</head>
<body>

	<div id="lock-modal">
					<div class="lock-modal-content">
						<h5>잠금 모드입니다. 풀려면 비밀번호를 입력하세요</h5>
						<h5>소셜 로그인한 사람은 이메일을 입력해주세요!!!</h5>
						<br>
						<br>
						<input type="password" id="input-password" placeholder="비밀번호 입력">
						<button type="button" id="lock-password-bt" >확인</button>
						<button type="button" id="logoutBt">로그아웃</button>
					</div>
	</div>

</body>

</html>