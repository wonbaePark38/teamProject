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

<title>Plug</title>
<link rel="stylesheet" href="css/newproject.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/mainPage.css" rel="stylesheet">
<link href="css/write_completion.css" rel="stylesheet">
<link href="css/messanger_css.css" rel="stylesheet">
<script src="script/page_ajax.js"></script>
<link href="css/contentPage.css" rel="stylesheet">

<script src="script/jquery-3.5.1-min.js"></script>
<script type="text/javascript" src="script/fileupload.js"></script>
<script type="text/javascript" src="script/task.js"></script>
<script>
	$('#project-manage-bt').css('display','none');
	
</script>
</head>
<style>
</style>

<body style="background-color: rgb(242, 242, 242);">

	<div class="mainWrap">
		<!-- Navigation -->
		
		<jsp:include page='privateConfigHeader.jsp'></jsp:include>
		<!--end navigation-->


		<div class="centerArea" id="ch">
			<!--중앙영역-->
			<!--   <div class="leftContainer">-->

			<div class="sidebarContainer">

				<div class="new_collabo">
					<a id="newPrjBtn" onclick="newprojectPop('newproject.jsp')">새 프로젝트</a>
				
				</div>
				<!--사이드바-->
				<div class="sidebar">
					<a id="main_side" class="list-group-item"
						style="padding: .5rem 1.25rem;">전체</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem;">미보관</a> <a
						id="main_side" class="list-group-item"
						style="padding: .5rem 1.25rem; text-decoration: line-through;">읽지않음</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem;">즐겨찾기</a>

					<div style="font-size: 13px; color: #000000; font-weight: bold; padding: 1px 0px 1px 10px; border-top: 1px solid #e7e8e9; margin: 22px 0 10px 0;">모아보기</div>
					<a id="main_side" class="list-group-item"
						style="padding: .5rem 1.25rem;">전체 업무</a> <a id="main_side"
						href="calendar.jsp" class="list-group-item"
						style="padding: .5rem 1.25rem; display: none;">전체 일정</a> <a id="main_side"
						href="totalFileView.do" class="list-group-item"
						style="padding: .5rem 1.25rem;">전체 파일</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem; display: none;">담아둔 글</a>
					<a id="main_side" class="list-group-item"
						style="padding: .5rem 1.25rem; display: none;">나를 지정</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem; display: none;">내 게시물</a>

					<div class="menu_plus">
						<a class="sort" onclick="new_plus()">보관함</a>
					</div>
					<c:forEach var="locker_list" items="${projectLockerList}">
						<div>
						<input type="hidden" name="locker_list_id" value="${locker_list.locker_list_id}">
							<a id="main_side" class="list-group-item locker_a" style="padding: .5rem 1.25rem;">${locker_list.locker_name}<img id="locker_update"></img><img id="locker_del"></img></a>
						</div>
					</c:forEach>
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">
						숨김
					</a>

				</div>
				<!--sidebar-->
				<div class="clientCenterContainer">

					<ul id="helpMenu_on">
						<li><a id="oneToOneBt" onclick="clientQnA()">1:1 문의</a></li>
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
									href="accountInfo.do">환경설정</a>
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
		<div class=locker_list_set>
			<div class="locker_save">
				<div class="locker_save_h">
					<span class="locker_cancel">X</span>
					<h3>보관함 설정</h3>
				</div>
				<div class="locker_save_list">
					<ul>
						<c:forEach var="locker_list" items="${projectLockerList}">
							<li>
								<input type="hidden" name="locker_list_id" value="${locker_list.locker_list_id }"/>
								<label><input style="margin:5px 10px;" name="locker_cbox" type="radio" value="${locker_list.locker_name}">${locker_list.locker_name}</label><br>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="locker_set_div" style="width: 100%; font-size: 18px; height: 40px;margin-top:8px;">
					<span id="locker_success" style="padding: 5px 55px;">확인</span>
					<span class="locker_cancel" style="padding: 5px 55px;">취소</span>
				</div>
			</div>
		</div>
		
		<div id="new_plus" style="display: none; z-index: 1001;">
			<div
				style="text-align: center; width: 340px; height: 180px; border: 1px solid pink; margin-top: 200px; margin-left: auto; margin-right: auto; padding: 10px 10px 10px 10px; background-color: white;">
				<div
					style="text-align: center; margin: auto; padding-bottom: 10px; border-bottom: 1px solid #eaeaea;">
					<span style="padding-left: 15px; font-size: 20px;">보관함 만들기</span> <a
						style="float: right" onclick="new_plus()">X</a>
				</div>
				<div style="margin: auto; padding: 20px;">
					<input id="locker_name" type="text" placeholder="보관함명 입력(최대50자)"
						style="width: 90%; height: 30px;">
					<div style="padding-top: 15px">
						<input class="box_btn" type="button" value="취소" onclick="new_plus()"> <input id="locker_add"  class="box_btn" type="button" value="만들기">
					</div>
				</div>
			</div>
		</div>
		<div id="locker_change" style="display: none; z-index: 1001;">
			<div style="text-align: center; width: 340px; height: 180px; border: 1px solid pink; margin-top: 200px; margin-left: auto; margin-right: auto; padding: 10px; background-color: white;">
				<div style="text-align: center; margin: auto; padding-bottom: 10px; border-bottom: 1px solid #eaeaea;">
					<span style="padding-left: 15px; font-size: 20px;">보관함 수정</span> 
					<a id="lc_close" style="float: right;" >X</a>
				</div>
				<div style="margin: auto; padding: 20px;">
					<input id="change_locker_name" type="text" placeholder="보관함명 입력(최대50자)"
						style="width: 90%; height: 30px;">
					<div style="padding-top: 15px">
						<input id="lc_close" class="box_btn" type="button" value="취소">
						<input id="lc_locker" class="box_btn" type="button" value="만들기">
					</div>
				</div>
			</div>
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