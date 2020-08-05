<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix ="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 
</head>
<body>
	
	<form action="login.do" method="post">
		<table border="1">
			<tr>
				
				<td><input type="text" name="email" value="${userVO.email}" />
			</tr>

			<tr>
				
				<td><input type="password" name="password"
					value="${userVO.password}" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	<form action="login.do" method="post">
		<table border="1">
			<tr>
				<td>구글 로그인</td>
				<input type="hidden" id="id" name="googleID">
				
				<td><input type="submit" value="구글로그인"></td>
					
			</tr>
		</table>
	</form>
	<!-- <span id="name"></span><input type="button" id="loginBtn" value="checking..." onclick="
	if(this.value ==='Google Login'){
		gauth.signIn().then(function(){
			console.log('gauth.signIn()');
			checkLoginStatus();
		});
		
	} else{
		gauth.signOut().then(function(){
			console.log('gauth.signOut()');
			checkLoginStatus();
		});
	}
">
 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>


 