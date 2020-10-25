<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
</head>
<body>
<h1>이메일 인증 실패</h1>
인증키가 올바르지 않습니다. 다시 확인해주세요.<br>
5초후 로그인 페이지로 이동합니다.
</body>
<script type='text/javascript'>
setTimeout("location.href='newlogin.jsp'", 5000);
</script>
</html>