<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link href="css/privateSidebar.css" rel="stylesheet">


<script src="vendor/jquery/jquery.min.js"></script>


</head>
<body>

	<div class="sidebarContainer">

				<input type="button" class="go-back-container" value="< 돌아가기" onclick="goback();"/>
				<!--사이드바-->
				<div class="sidebar">
					<div style="font-size: 10pt; color: #C0C0C0">계정</div>
					<a href="accountInfo.do" class="list-group-item" id="connect-device-setting">계정 정보</a>
					
					<c:if test="${user.socialCompare eq 'N'}">
						<a href="settingPassword.do" class="list-group-item" id="password-setting">비밀번호 설정</a>
					</c:if>
					<hr>
					<div style="font-size: 10pt; color: #C0C0C0">설정</div>
					<a href="pushAlramConfig.do" class="list-group-item" id="push-alram-setting">푸쉬 알림 설정</a>
					<a href="connectManage.do" class="list-group-item" id="connect-device-setting">접속 기기 관리</a>
					<a href="lockModeConfig.do" class="list-group-item" id="lock-mode-setting">잠금모드</a>
					<hr>

				</div>
				
			</div> <!--// sidebarcontainer-->

</body>
<script>
	function goback(){
		location.href = "projectdir.do";
	}
</script>
</html>