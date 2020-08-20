<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>개인환경 설정</title>

<link href="css/privateConfig.css" rel="stylesheet">
<script type="text/javascript" src="script/articleScript.js"></script>

<script src="vendor/jquery/jquery.min.js"></script>

<script type="text/javascript" src="script/configScript.js"></script>

<body>


	
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
		

		<!-- 옵션 영역 -->
			<div id="header_option_div">
				<!-- 유저 정보 -->
				<div id="option_user" style="margin-top: 20px; margin-bottom: 10px;">
				   <div style="text-align: center;">
					  <img src="images/account_default30.png" style="border-radius: 20px;">
				   </div>
				   <div style="text-align: center;">
					  <span>
						 <strong>${vo.name} 님</strong>
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
					  <a href="accountInfo.jsp">환경설정</a>
				   </div>
				   <div style="margin-top: 10px;">
					  <img src="images/pf_ico5_off.png">
					  <a>도움말</a>
				   </div>
				   <div style="margin-top: 10px;">
				    
				   <form action="logout.do" method="GET">
				   	   <button type="submit">
				   	   		<img src="images/pf_ico3_off.png">
				   	   		로그아웃
				   	   </button>
				  </form>
				   
					  
					 
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





				</div><!-- header right -->
			</div><!-- headerwrap -->

		</div><!-- headercontainer -->


					
	
			





</body>



</html>