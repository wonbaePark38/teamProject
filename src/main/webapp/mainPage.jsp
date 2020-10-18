<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Plug</title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/mainPage.css" rel="stylesheet">
<link href="css/task.css" rel="stylesheet">
<link href="css/messanger.css" rel="stylesheet">
<script src="script/page_ajax.js"></script>
<link href="css/contentPage.css" rel="stylesheet">
<link rel="stylesheet" href="css/write_completion.css">
<script src="script/jquery-3.5.1-min.js"></script>
<script type="text/javascript" src="script/submit.js"></script>
<script type="text/javascript" src="script/fileupload.js"></script>
<script type="text/javascript" src="script/projectdir.js"></script>
</head>
<body style="background-color: rgb(242, 242, 242)">
	<div class="mainWrap">
		<!-- Navigation -->
		<jsp:include page='privateConfigHeader.jsp'></jsp:include>
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
						<input type="hidden" name="locker_list_id" value="${locker_list.locker_list_id}">
						
						<a id="main_side" class="list-group-item locker_a" style="padding: .5rem 1.25rem;">${locker_list.locker_name}<img id="locker_update"></img><img id="locker_del"></img>
						</a>
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

			<!--//사이드바-->
			<!-- </div> -->
			<!--// sidebarcontainer-->

			<!--// leftcontainer-->

			<div style="display: inline-block;" id="ch2">
				<div class="contents" style="float: left;">
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
									href="accountInfo.jsp">환경설정</a>
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

					<!-- 게시글 넣는곳 -->

					<jsp:include page="mainPage_article.jsp"></jsp:include> 


					<!-- //게시글 넣는곳 -->

					

				</div>
				<!-- //센터영역-->
				<!--오른쪽영역-->
				<!-- 세영 -->
				<div class="rightContainer">



					<div class="aside_wrap">
						<div>
							<a class="btn_listback" href="projectdir.do">이전화면</a>
						</div>

						<div class="set_wrap col-12" style="display: none;">
							<ul style="padding-inline-start: 0px;">
								<li><a href="totalFile.html" id="file-box" class="ico1"
									style="padding-top: 30px; height: 50px;">파일함</a></li>
								<li><a href="task.jsp" id="task-list" class="ico5"
									style="padding-top: 30px; height: 50px;">업무</a></li>
								<li><a href="calendar.jsp" id="schedule-calendar"
									class="ico4" style="padding-top: 30px; height: 50px;">일정</a></li>
								<li><a href="#" id="todo-list" class="ico3"
									style="padding-top: 30px; height: 50px;">할일</a></li>
							</ul>
						</div>

						<div>
							<div class="r_invite_box" style="display: none;">
								<a id="project-invite-btn" class="invite"
									onclick="invitePop('invitedetail.jsp')">초대하기</a>
							</div>
							<!-- 참여자목록 -->

							<div class="participant_wrap">
								<div>
									<div class="msg_user">
										<strong>전체 참여자</strong>&nbsp;<strong id="totaluser"></strong>
										<strong>명</strong>
									</div>
								</div>

								<div>
									<div>
										<h5>
											<strong id="msg">관리자</strong>
										</h5>
									</div>
									<ul class="u_profile">
									<c:forEach var="userList" items="${joinlist}"> 
										<c:if test="${userList.project_manager eq '1'}">
											<li class="right-sendience-li">
												<div class="msgphoto">
													<img id="uimg" src="images/noimg.gif">
												</div>
												<div class="username" style="cursor: pointer;">
													<span id="sendience-name" >${userList.member_name }</span>
													<c:if test="${userList.member_id eq user.seq}">
														<span>(나)</span>
													</c:if>
												</div>
											</li>	
										</c:if>
									</c:forEach>
									</ul>

									<div>
										<h5>
											<strong id="msg">참여자</strong> <span id="cluser"></span>
										</h5>
									</div>
									<ul id="juser" class="u_profile" style="overflow-y: scroll;max-height: 300px;">
										<c:forEach var="userList" items="${joinlist}"> 
											<c:if test="${userList.project_manager eq '0' }">
											
												<li class="right-sendience-li">
													<div class="msgphoto">
														<img id="uimg" src="images/noimg.gif">
													</div>
													<div class="username" style="cursor: pointer;">
														<span id="sendience-name" >${userList.member_name }</span>
														<c:if test="${userList.member_id eq user.seq}">
															<span>(나)</span>
														</c:if>
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>

						</div>
					</div>

				</div>


			</div>
			<!--end center-->
		</div>

		<div id="new_plus" style="display: none; z-index: 1001;">
			<div
				style="text-align: center; width: 340px; height: 180px; border: 1px solid pink; margin-top: 200px; margin-left: auto; margin-right: auto; padding: 10px 10px 10px 10px; background-color: white;">
				<div
					style="text-align: center; margin: auto; padding-bottom: 10px; border-bottom: 1px solid #eaeaea;">
					<span style="padding-left: 15px; font-size: 20px;">보관함 만들기</span> <a
						href="#" style="float: right" onclick="new_plus()">X</a>
				</div>
				<div style="margin: auto; padding: 20px;">
					<input type="text" placeholder="보관함명 입력(최대50자)"
						style="width: 90%; height: 30px;">
					<div style="padding-top: 15px">
						<input class="box_btn" type="button" value="취소"
							onclick="new_plus()"> <input
							style="background-color: aqua;" class="box_btn" type="button"
							value="만들기">
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
<script type="text/javascript" src="script/task.js"></script>

<!-- 구글지도 -->
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2ufsIg_pi0agHyW6dFEgXMCPIH8Aiw10&callback=initMap"></script>
<script type="text/javascript" src="script/googleMap.js"></script>

<!-- 구글 차트 -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="script/googleChart.js"></script>

</html>