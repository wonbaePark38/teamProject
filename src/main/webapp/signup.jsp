<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link rel="stylesheet" href="css/signup_css.css"/>
</head>
<body>

	<div class="sign-up-wrap">
		<form action>
			<div>
				<div>
					<label class="signup-label">이메일</label>
					<div class="inputbox">
						<input type="text" id="email" placeholder="exam@email.com">
					</div>
				</div>
				<div>
					<label class="signup-label">이름</label>
					<div class="inputbox">
						<input type="text" id="name" placeholder="이름">
					</div>
				</div>
				<div>
					<label class="signup-label">비밀번호</label>
					<div class="inputbox">
						<input type="password" id="password" placeholder="비밀번호 입력">
					</div>
				</div>
				<div>
					<label class="signup-label">비밀번호 확인</label>
					<div class="inputbox">
						<input type="password" id="passwordCheck" placeholder="비밀번호 재입력">
					</div>
				</div>
				
				<div class="signup-terms">
					<input type="checkbox" id="agreeTerms">
					<span>서비스 이용약관,  개인정보취급방침 을 확인하였고, 이에 동의합니다.</span>
				</div>
			
				<div>
					<button class="btn-signup-next">다음</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>