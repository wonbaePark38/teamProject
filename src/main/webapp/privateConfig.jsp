<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>개인환경 설정</title>



<!-- Custom styles for this template -->
<link href="css/privateConfig.css" rel="stylesheet">
<script type="text/javascript" src="script/articleScript.js"></script>

<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="script/script.js"></script>
<script type="text/javascript" src="script/configScript.js"></script>

<body>


	<div class="mainWrap">
		<!-- Navigation -->
		<div class="headerContainer">
			<div class="headerWrap">
				<div class="headerLeft">
					<div class="headLogo">
						<a href="#"><img src="images/logo_top.png"></a>
					</div>
					

				</div>
				<div class="headerRight">
					<button id="serviceUpgradeBt" onclick="test()">서비스 업그레이드</button>
					<input type="button" id="headerChatBt" onclick="headerChatting()">
					<input type="button" id="headerIconAlram" onclick="headerAlarm()">
					<input type="button" id="headerUserInfoBt" onclick="headerOption()">
	

				</div>
			</div>

		</div>


		<div class="centerArea" id="ch">
			<!--중앙영역-->

			<div class="sidebarContainer">

				<div class="go-back-container">
					<a id="go-back-bt">&lt; &nbsp; 돌아가기</a>

				</div>
				<!--사이드바-->
				<div class="sidebar">
					<div style="font-size: 10pt; color: #C0C0C0">계정</div>
					<a href="#" class="list-group-item" id="account-info">계정 정보</a>
					<a href="#" class="list-group-item" id="password-setting">비밀번호 설정</a>
				
					<hr>
					<div style="font-size: 10pt; color: #C0C0C0">설정</div>
					<a herf="#" class="list-group-item" id="push-alram-setting">푸쉬 알림 설정</a>
					
					<a href="#" class="list-group-item" id="favorites-setting">프로젝트 즐겨찾기 설정</a>
					<a href="#" class="list-group-item" id="connect-device-setting">접속 기기 관리</a>
					<a href="#" class="list-group-item" id="language-setting">언어 및 타임존 설정</a>
					<a href="#" class="list-group-item" id="lock-mode-setting">잠금모드</a>
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

			<!----------------------------------------------------->
			<!-- 옵션 영역 -->
			<div id="header_option_div">
				<!-- 유저 정보 -->
				<div id="option_user" style="margin-top: 20px; margin-bottom: 10px;">
				   <div style="text-align: center;">
					  <img src="images/account_default30.png" style="border-radius: 20px;">
				   </div>
				   <div style="text-align: center;">
					  <span>
						 <strong>사용자명</strong>
					  </span>
				   </div>
				   <div style="text-align: center;">
					  <span style="font-size: 12px;">
						 test버전 이용중
					  </span>
				   </div>
				</div>
				<!-- //유저 정보 -->
				<hr>
				<!-- 옵션 -->
				<div style="margin-left: 10px;">
				   <div style="margin-top: 10px;">
					  <img src="images/pf_ico1_off.png">
					  <a>환경설정</a>
				   </div>
				   <div style="margin-top: 10px;">
					  <img src="images/pf_ico5_off.png">
					  <a>도움말</a>
				   </div>
				   <div style="margin-top: 10px;">
					  <img src="images/pf_ico3_off.png">
					  <a>로그아웃</a>
				   </div>
				</div>

				<!-- //옵션 -->
			 </div>
			 <!-- //옵션 영역 -->

			 <!-- 알람 영역 -->
			 <div id="header_alarm_div">

				<!-- 선택 영역 -->
				<div style="margin-left: 10px;">
				   <!-- 채팅방 선택 -->
				   <div style="width: 80px; display: inline-block;">
					  <a>미확인 알람</a>
				   </div>
				   <!-- 연락처 선택 -->
				   <div style="width: 80px; display: inline-block;">
					  <a>전체 알람</a>
				   </div>
				   <!-- 알람on/off, 새채팅 -->
				   <div style="margin-left: 50px; display: inline-block;">
					  <a>모두 읽음</a>
				   </div>
				</div>
				<hr>
				<!-- //선택 영역 -->
				
				<!-- 미확인 알람 -->
				<div style="display: block;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="미확인 알람 검색">
				   </div>

				   <!-- forEach -->
				   <div>
					  <div style="width: 20%; display: inline-block;">
						 <img src="images/empty_photo_s.png">
					  </div>
					  <div style="width: 75%; display: inline-block;">
						 <div style="height: 18px;">
							<span style="font-size: 12px;"><strong>프로젝트명</strong></span>
							<span style="margin-top: 5px; font-size: 10px; float: right;">작성 시간</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">*님의 새글 등록</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">새글 내용</span>
						 </div>
					  </div>
				   </div>
				   <!-- //forEach -->
				</div>
				<!-- //미확인 알람 -->

				<!-- 전체 알람 -->
				<div style="display: none;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="전체 알람 검색">
				   </div>

				   <!-- forEach -->
				   <div>
					  <div style="width: 20%; display: inline-block;">
						 <img src="images/empty_photo_s.png">
					  </div>
					  <div style="width: 75%; display: inline-block;">
						 <div style="height: 18px;">
							<span style="font-size: 12px;"><strong>프로젝트명</strong></span>
							<span style="margin-top: 5px; font-size: 10px; float: right;">작성 시간</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">*님의 새글 등록</span>
						 </div>
						 <div style="height: 18px;">
							<span style="font-size: 10px;">새글 내용</span>
						 </div>
					  </div>
				   </div>
				   <!-- //forEach -->
				</div>
				<!-- //전체 알람 -->
			 </div>
			 <!-- //알람 영역 -->

			 <!-- 채팅 영역 -->
			 <div id="header_chat_div">
				
				<!-- 선택 영역 -->
				<div style="margin-left: 10px;">
				   <!-- 채팅방 선택 -->
				   <a onclick="headerChattingRoom()">채팅</a>
				   <!-- 연락처 선택 -->
				   <a onclick="headerContactAddresss()">연락처</a>
				   <!-- 알람on/off, 새채팅 -->
				   <div style="margin-left: 80px; display: inline-block;">
					  <div style="display: inline-block;">
						 <a>alarmOn</a>
					  </div>
					  <div style="display: inline-block;">
						 <a style="margin-left: 10px;">새채팅</a>
					  </div>
				   </div>
				</div>

				<hr>
				<!-- //선택 영역 -->
				
				<!-- 채팅방 -->
				<div id="header_chat_chattingRoom" style="display: block;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="채팅방 또는 이름 검색">
				   </div>

				   <!-- forEach -->
				   <div style="vertical-align: middle;">
					  <div style="display: inline-block;">
						 <img src="images/empty_photo_s.png" style="margin-bottom: 20px;">
					  </div>
					  <div style="width: 75%; display: inline-block;">
						 <div>
							<span style="font-size: 9px; max-width: 155px;">채팅방이름</span>
							<span style="font-size: 9px;">인원수</span>
							<span style="font-size: 9px; float: right; margin-top: 9px;">마지막채팅시간</span>
						 </div>
						 <div>
							<span style="font-size: 12px;">채팅내용</span>
						 </div>
					  </div>
				   </div>
				   <!-- //forEach -->
				</div>
				<!-- //채팅방 -->

				<!-- 연락처 -->
				<div id="header_chat_contactAddress" style="display: none;">
				   <div style="padding-left: 6px; padding-right: 6px;">
					  <input type="text" style=" width: 100%;" placeholder="이름,소속 또는 연락처 검색">
				   </div>

				   <!-- 내프로필 -->
				   <div>
					  <div>
						 <span style="font-size: 12px;"><stong>내 프로필</stong></span>
					  </div>
					  <div style="display: inline-block;">
						 <img src="images/empty_photo_s.png">
					  </div>
						 
					  <div style="display: inline-block; margin-left: 200px;">
						 <img src="images/chat_ico.png">
					  </div>
				   </div>
				   <hr>
				   <!-- //내프로필 -->

				   
				   <!-- 전체 연락처 -->
				   <div style="width: 100%;">
					  <div>
						 <span style="font-size: 12px;"><stong>전체 연락처</stong></span>
					  </div>
					  <!-- forEach -->
					  <div style="width: 100%;">
						 <div style="display: inline-block;">
							<img src="images/empty_photo_s.png">
						 </div>
						 <div style="display: inline-block; width: 80px; vertical-align: middle;">
							<span style="font-size: 11px;"><strong>참여자명</strong></span>
							<span style="font-size: 10px;">test@test.com</span>
						 </div>
						 
						 <div style="display: inline-block; margin-left: 115px;">
							<img src="images/chat_ico.png">
						 </div>
					  </div>
					  <!-- //forEach -->
				   </div>
				   <!-- //전체 연락처 -->
				</div>
				<!-- //연락처 -->
			 </div>
			 <!-- //채팅 영역 -->







			<div id="ajaxpagecontainer">

			</div>
			
		</div> <!--end centerArea-->	
			
	
			




</div>


</body>

<script src="script/jquery-3.5.1-min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript" src="script/articleScript.js"></script>
<script type="text/javascript" src="script/script.js"></script>

</html>