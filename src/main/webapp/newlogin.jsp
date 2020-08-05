<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta charset="utf-8" />
    
    
<title>Login</title>
<link rel="stylesheet" href="css/login_css.css" />
<script src="vendor/jquery/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="script/script.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
	<c:if test="${status eq 'false'}">
		<script type="text/javascript">
			loginErrorView();
		</script>
		
	</c:if>
	<div>
		<div class="btn-register">
			<a href="signup.jsp">회원가입</a>
		</div>
	</div>

	<form method="POST" action="login.do" name="loginBt">
	<div class="signup_box">
		<div>
			<ul>
				<li>
					<input type="text" id="USER_ID" name="email" placeholder="이메일 또는 아이디" >
				</li>
				<li>
					<input type="password" id="USER_PW" name="password" placeholder="비밀번호" >
				</li>
			</ul>
			<div>
				<input type="checkbox">&nbsp;<span>자동 로그인</span>
			</div>
			<input type="button" onclick="loginErrchk()" class="signup_btn_st1"  disabled=disabled value="로그인">
			
		</div>
		<div class="forgot-password">
			<a>비밀번호를 잊어버리셨나요?</a>
		</div>
		<div class="line_through">
			<span>
				<em>또는</em>
			</span>
		</div>
		</form>

	<ul class="another_id">
		<form method="POST" action="slogin.do" name="googleSubmit">
			<a href='javascript:void(0);' onclick="startGoogleLogin()">
			<input type="hidden" id="googleInfo" name="email" value="${userVO.email}">
			<input type="hidden" id="socialGoogle" name="socialCompare" value="${userVO.socialCompare}">
				<li class="google" id="googleBt"><span>Google 계정으로 시작</span></li>

			</a>
		</form>

		<form method="POST" action="slogin.do" name="kakaoSubmit">
			<a href='javascript:void(0);' onclick="startKakaoLogin()">
			<input type="hidden" id="kakaoInfo" name="email">
			<input type="hidden" id="kakaoName" name="name">
			
			<input type="hidden" id="socialKakao" name="socialCompare" value="${userVO.socialCompare}">
				<li class="kakao" id="kakaoBt"><span>Kakao 계정으로 시작</span></li>

			</a>
		</form>
	</ul>

	</div>
	
	
</body>

</html>