<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>메인페이지</title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/mainPage.css" rel="stylesheet">
<link href="css/write_completion.css" rel="stylesheet">
<link href="css/messanger_css.css" rel="stylesheet">
<script src="script/page_ajax.js"></script>
<link href="css/contentPage.css" rel="stylesheet">

<script src="script/jquery-3.5.1-min.js"></script>
<script type="text/javascript" src="script/submit.js"></script>
<script type="text/javascript" src="script/fileupload.js"></script>

<!-- projectdir -->
<script>
	$(document).on('click','#main_side',function(){
		var click_id = $(this).text();
		if (click_id == '전체') {
			location.href = "projectdir.do";
		} else if(click_id == '미보관'){
			
		} else if(click_id == '읽지않음'){
			alert('읽지않음');
		} else if(click_id == '즐겨찾기'){
			alert('즐겨찾기');
		} else if(click_id == '전체 업무'){
			alert('전체 업무');
		} else if(click_id == '전체 일정'){
			alert('전체 일정');
		} else if(click_id == '전체 파일'){
			alert('전체 파일');
		} else if(click_id == '담아둔 글'){
			alert('담아둔 글');
		} else if(click_id == '나를 지정'){
			alert('나를 지정');
		} else if(click_id == '내 게시물'){
			alert('내 게시물');
		}
	});
</script>
</head>
<style>
</style>

<body>
	<input type="hidden" id="member_id" name="seq" value="${user.seq}">
	
	<div class="mainWrap">
		<!-- Navigation -->
		<div class="headerContainer">
			<div class="headerWrap">
				<div class="headerLeft">
					<div class="headLogo">
						<a href="#"><img src="images/logo_top.png"></a>
					</div>
					<div id="searchArea">

						<form style="width: 100%" action="#" name=search method="POST">

							<select class="searchButton" name="category">
								<option value="menu1">전체</option>
								<option value="menu2">프로젝트</option>
								<option value="menu3">글</option>
								<option value="menu4">댓글</option>
								<option value="menu5">참여자</option>
							</select> <input type="text" id="inputkeyword" value="텍스트입력"
								onfocus="this.value='';"> <input type="submit"
								value="검색" onclick="searchPress()">
						</form>
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

		<!--end navigation-->


		<div class="centerArea" id="ch">
			<!--중앙영역-->
			<!--   <div class="leftContainer">-->

			<div class="sidebarContainer">

				<div class="new_collabo">
					<a id="newPrjBtn" onclick="newprojectPop('newproject.jsp')">새
						프로젝트</a>

				</div>
				<!--사이드바-->
				<div class="sidebar">
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">전체</a>
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">미보관</a> 
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">읽지않음</a> 
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">즐겨찾기</a>

					<div style="font-size: 10pt; color: #C0C0C0">모아보기</div>
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">전체 업무</a> 
					<a id="main_side" href="calendar.jsp" class="list-group-item" style="padding: .5rem 1.25rem;">전체 일정</a>
					<a id="main_side" href="totalFile.html" class="list-group-item" style="padding: .5rem 1.25rem;">전체 파일</a> 
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">담아둔 글</a>
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">나를 지정</a>
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">내 게시물</a>

					<div class="menu_plus">
						<a class="sort" onclick="new_plus()">보관함</a>

					</div>
					<div class="list-group">
						<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">마케팅</a> 
						<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">디자인</a> 
						<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">엔지니어링</a>
						<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">숨김</a>
					</div>

				</div>
				<!--sidebar-->
				<div class="clientCenterContainer">

					<ul id="helpMenu_on">
						<li><a id="oneToOneBt">1:1 문의</a></li>
						<li><a id="helpBt">도움말</a></li>
						<li><a id="pcVersionDownloadBt">데스크탑 앱 다운로드</a></li>
						<li><a id="newNoticeBt">플로우 새소식</a></li>
						<!-- 알림 있을 경우 class on 추가 -->
					</ul>
					<div class="helpButtonContainer">
						<div id="helpMenuImg"></div>
						<button id="helpMenuBt" onclick="clientCenterFold()">고객센터</button>
					</div>
				</div>

			</div>

			<div style="display: inline-block;" id="ch2">
				<div class="contents" style="float: left; width: 848px;">
					<!-- 센터영역 -->

					<!-- 옵션 영역 -->
					<div id="header_option_div">
						<!-- 유저 정보 -->
						<div id="option_user"
							style="margin-top: 20px; margin-bottom: 10px;">
							<div style="text-align: center;">
								<img src="images/account_default30.png"
									style="border-radius: 20px;">
							</div>
							<div style="text-align: center;">
								<span> <strong>사용자명</strong>
								</span>
							</div>
							<div style="text-align: center;">
								<span style="font-size: 12px;"> test버전 이용중 </span>
							</div>
						</div>
						<!-- //유저 정보 -->
						<hr>
						<!-- 옵션 -->
						<div style="margin-left: 10px;">
							<div style="margin-top: 10px;">
								<img src="images/pf_ico1_off.png"> <a
									href="privateConfig.jsp">환경설정</a>
							</div>
							<div style="margin-top: 10px;">
								<img src="images/pf_ico5_off.png"> <a>도움말</a>
							</div>
							<div style="margin-top: 10px;">
								<img src="images/pf_ico3_off.png"> <a>로그아웃</a>
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
								<input type="text" style="width: 100%;" placeholder="미확인 알람 검색">
							</div>

							<!-- forEach -->
							<div>
								<div style="width: 20%; display: inline-block;">
									<img src="images/empty_photo_s.png">
								</div>
								<div style="width: 75%; display: inline-block;">
									<div style="height: 18px;">
										<span style="font-size: 12px;"><strong>프로젝트명</strong></span> <span
											style="margin-top: 5px; font-size: 10px; float: right;">작성
											시간</span>
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
								<input type="text" style="width: 100%;" placeholder="전체 알람 검색">
							</div>

							<!-- forEach -->
							<div>
								<div style="width: 20%; display: inline-block;">
									<img src="images/empty_photo_s.png">
								</div>
								<div style="width: 75%; display: inline-block;">
									<div style="height: 18px;">
										<span style="font-size: 12px;"><strong>프로젝트명</strong></span> <span
											style="margin-top: 5px; font-size: 10px; float: right;">작성
											시간</span>
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
								<input type="text" style="width: 100%;"
									placeholder="채팅방 또는 이름 검색">
							</div>

							<!-- forEach -->
							<div style="vertical-align: middle;">
								<div style="display: inline-block;">
									<img src="images/empty_photo_s.png"
										style="margin-bottom: 20px;">
								</div>
								<div style="width: 75%; display: inline-block;">
									<div>
										<span style="font-size: 9px; max-width: 155px;">채팅방이름</span> <span
											style="font-size: 9px;">인원수</span> <span
											style="font-size: 9px; float: right; margin-top: 9px;">마지막채팅시간</span>
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
								<input type="text" style="width: 100%;"
									placeholder="이름,소속 또는 연락처 검색">
							</div>

							<!-- 내프로필 -->
							<div>
								<div>
									<span style="font-size: 12px;"> <strong>내 프로필</strong>
									</span>
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
									<span style="font-size: 12px;"> <strong>전체 연락처</strong>
									</span>
								</div>
								<!-- forEach -->
								<div style="width: 100%;">
									<div style="display: inline-block;">
										<img src="images/empty_photo_s.png">
									</div>
									<div
										style="display: inline-block; width: 80px; vertical-align: middle;">
										<span style="font-size: 11px;"><strong>참여자명</strong></span> <span
											style="font-size: 10px;">test@test.com</span>
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
					
					<jsp:include page='content.jsp'></jsp:include>
					
				</div>
			</div>
			<!--end center-->
		</div>
	</div>
</body>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<script type="text/javascript" src="script/articleScript.js"></script>
<script type="text/javascript" src="script/datepicker.js"></script>
<script type="text/javascript" src="script/datePick-jquery.js"></script>


<script type="text/javascript" src="script/script.js"></script>


</html>