<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/privateConfig.css" rel="stylesheet">
<script type="text/javascript" src="script/articleScript.js"></script>

<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="script/script.js"></script>
<script type="text/javascript" src="script/configScript.js"></script>
</head>
<body>
	<div class="sidebarContainer">

				<div class="go-back-container">
					<a id="go-back-bt">&lt; &nbsp; 돌아가기</a>

				</div>
				<!--사이드바-->
				<div class="sidebar">
					<div style="font-size: 10pt; color: #C0C0C0">계정</div>
					<a href="accountInfo.jsp" class="list-group-item" id="account-info">계정 정보</a>
					<a href="settingPassword.jsp" class="list-group-item" id="password-setting">비밀번호 설정</a>
				
					<hr>
					<div style="font-size: 10pt; color: #C0C0C0">설정</div>
					<a href="pushAlramSetting.jsp" class="list-group-item" id="push-alram-setting">푸쉬 알림 설정</a>
					
					<a href="favoritesSetting.jsp" class="list-group-item" id="favorites-setting">프로젝트 즐겨찾기 설정</a>
					<a href="connectManage.jsp" class="list-group-item" id="connect-device-setting">접속 기기 관리</a>
					<a href="languageSetting.jsp" class="list-group-item" id="language-setting">언어 및 타임존 설정</a>
					<a href="lockModeConfig.jsp" class="list-group-item" id="lock-mode-setting">잠금모드</a>
					<hr>

			
				

				</div>
				<div class="clientCenterContainer">

					<ul id="helpMenu_on"  style="list-style: none;">
						<li><a href="#" id="oneToOneBt">1:1 문의</a></li>
						<li><a href="#" id="helpBt">도움말</a></li>
						<li><a href="#" id="pcVersionDownloadBt">데스크탑 앱 다운로드</a></li>
						<li><a href="#" id="newNoticeBt">플로우 새소식</a></li>
						<!-- 알림 있을 경우 class on 추가 -->
					</ul>
					<div class="helpButtonContainer">
						<div id="helpMenuImg"></div>
						<button id="helpMenuBt" onclick="clientCenterFold()">고객센터</button>
					</div>
				</div>

			</div> <!--// sidebarcontainer-->
	
</body>
</html>