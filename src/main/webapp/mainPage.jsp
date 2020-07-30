<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="css/task.css" rel="stylesheet">
	<link href="css/messanger_css.css" rel="stylesheet">
	<script src="script/jquery-3.5.1-min.js"></script>
	<link href="css/contentPage.css" rel="stylesheet">



</head>
<style>
</style>

<body>


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
							</select> <input type="text" id="inputkeyword" value="텍스트입력" onfocus="this.value='';">
							<input type="submit" value="검색" onclick="searchPress()">
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
					<a id="newPrjBtn">새 프로젝트</a>

				</div>
				<!--사이드바-->
				<div class="sidebar">
					<a onclick="acyncMovePage1('content.jsp')" class="list-group-item">전체</a>
					<a href="#" class="list-group-item">미보관</a>
					<a href="#" class="list-group-item">읽지않음</a>
					<a href="#" class="list-group-item">즐겨찾기</a>

					<div style="font-size: 10pt; color: #C0C0C0">모아보기</div>
					<a onclick="acyncMovePage('task.jsp')" class="list-group-item">전체 업무</a>
					<a onclick="acyncMovePage('calendar.jsp')" class="list-group-item">전체 일정</a>
					<a href="totalFile.html" class="list-group-item">전체 파일</a>
					<a href="#" class="list-group-item">담아둔 글</a>
					<a href="#" class="list-group-item">나를 지정</a>
					<a href="#" class="list-group-item">내 게시물</a>

					<div class="menu_plus">
						<a class="sort" onclick="new_plus()">보관함</a>

					</div>
					<div class="list-group">
						<a href="#" class="list-group-item">마케팅</a> <a href="#" class="list-group-item">디자인</a> <a
							href="#" class="list-group-item">엔지니어링</a> <a href="#" class="list-group-item">숨김</a>

					</div>

				</div>
				<!--sidebar-->
				<div class="clientCenterContainer">

					<ul id="helpMenu_on">
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
								<a href="privateConfig.html">환경설정</a>
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
									<span style="font-size: 12px;">
										<stong>내 프로필</stong>
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
									<span style="font-size: 12px;">
										<stong>전체 연락처</stong>
									</span>
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
					<!-- 게시글 넣는곳 -->
					<!-- 게시글 넣는곳 -->
					<div class="article">
						<div class="article_margin">

							<!-- 타이틀 -->
							<div class="title_margin">
								<div class="title_border">
									<p id="title">Article</p>
								</div>
							</div>
							<!-- 타이틀 -->

							<!-- 업무 리포트 -->
							<div class="work_report_border">
								<div class="work_report">
									<div class="work_report_title">
										<!-- 프로젝트 명 -->
										<p style="display: inline-block;">프로젝트명</p>

										<a id="work_report_fold" onclick="fold()"> 접기</a>

									</div>

									<!-- 차트 영역 -->
									<div id="chart" style="float: none;">
										<!-- 파이차트 -->
										<div id="piechart"></div>
										<!-- //파이차트 -->

										<!-- 차트 통계 -->
										<div class="piechart_table">
											<table>
												<tr>
													<td>요청</td>
													<td>진행</td>
													<td>피드백</td>
													<td>완료</td>
													<td>보류</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
													<td>4</td>
													<td>5</td>
												</tr>
											</table>
										</div>
										<!-- //차트 통계 -->
									</div>
									<!-- //차트 영역 -->

								</div>
							</div>
							<!-- //업무 리포트 -->



							<!-- 글작성 폼 -->
							<div id="write_form_margin">
								<div id="write_form_border">

									<div id="write_form_select_div">
										<div id="write_form_select">

											<!-- 글작성 선택 -->
											<table id="write_form_select_table">
												<tr>
													<td><span onclick="writeForm()">글쓰기</span></td>
													<td><span onclick="write20Form()">글쓰기 2.0</span></td>
													<td><span onclick="workForm()">업무</span></td>
													<td><span onclick="scheduleForm()">일정</span></td>
													<td><span onclick="todoForm()">할일</span></td>
												</tr>
											</table>
											<!-- //글작성 선택 -->

										</div>
										<hr>
										<!-- 글쓰기 양식 -->
										<div id="write_form_content">

											<!-- 글 쓰기 -->
											<form>
												<div id="writeForm_div">
													<div name="writeForm" class="div_text_write" contenteditable="true"
														placeholder="내용입력"></div>

													<!-- 이미지 업로드 -->
													<div>
														<div class="post_images"></div>
													</div>
													<!-- //이미지 업로드 -->



													<!-- 하단 툴바 -->
													<hr>
													<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

														<a class="add_file"></a>
														<a class="add_pic"></a>
														<div style="display: inline-block; float: right;">
															<select style=" vertical-align: middle; height: 27px;">
																<option></option>
																<option></option>
															</select>
															<a class="submit_a">올리기</a>
														</div>
													</div>
													<!-- //하단 툴바 -->
												</div>
											</form>
											<!-- //글 쓰기 -->

											<!-- 글쓰기 2.0 -->
											<form>
												<div class="write20_form" id="write20Form_div">

													<!-- 제목입력 -->
													<div class="writeForm2_title">
														<input name="writeForm2_title" type="text"
															placeholder="제목을 입력해 주세요"
															style="width: 80%; border-style: none;">
													</div>
													<hr>
													<!-- 내용입력 -->
													<div class="writeForm2_content">
														<div name="writeForm2_contet" class="div_text_write"
															contenteditable="true" placeholder="내용을 입력해 주세요"></div>
													</div>
													<!-- //내용입력 -->

													<!-- 지도 영역 -->
													<div id="location_div">
														<div id="locationMap"></div>
													</div>
													<!-- //지도 영역 -->



													<!-- 하단 툴바 -->
													<hr>
													<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

														<a class="add_file"></a>
														<a class="add_pic"></a>
														<a class="add_loc" onclick="locationPick()"></a>
														<div style="display: inline-block; float: right;">
															<select style=" vertical-align: middle; height: 27px;">
																<option></option>
																<option></option>
															</select>
															<a class="submit_a">올리기</a>
														</div>


														<!-- 툴바 장소 검색 -->
														<div id="search_location_div">
															<input id="search_location" type="text"
																name="location_name">
														</div>
														<!-- //툴바 장소 검색 -->

													</div>

													<!-- //하단 툴바 -->

												</div>
											</form>
											<!-- //글쓰기 2.0 -->



											<!-- 업무 글쓰기 -->
											<form>
												<div class="work_form" id="workForm_div">

													<!-- 업무명 -->
													<div id="work_form_title">
														<input type="text" name="workForm_title"
															placeholder="업무명을 입력해 주세요"
															style="width: 80%; border-style: none;">
													</div>
													<!-- //업무명 -->
													<hr>
													<!-- 상태 -->
													<div class="work_form_status">
														<label id="work_status_img"></label>
														<!-- 상태 선택 테이블 -->
														<div id="status_select_div">
															<div style="display: inline-block; width: 16%;">
																<span id="request" onclick="request()" value="request"
																	style="background-color: #4aaefb;">요청</span>
															</div>
															<div style="display: inline-block; width: 16%;">
																<span id="doing" onclick="doing()"
																	value="doing">진행</span>
															</div>
															<div style="display: inline-block; width: 16%;">
																<span id="feedback" onclick="feedback()"
																	value="feedback">피드백</span>
															</div>
															<div style="display: inline-block; width: 16%;">
																<span id="complete" onclick="complete()"
																	value="complete">완료</span>
															</div>
															<div style="display: inline-block; width: 16%;">
																<span id="postpone" onclick="postpone()"
																	value="postpone">보류</span>
															</div>
														</div>
														<!-- //상태 선택 테이블 -->

													</div>
													<!-- //상태 -->
													<hr>
													<!-- 담당자 -->
													<div class="work_form_manager">
														<div>
															<label id="work_worker_img"></label>
															<input type="text" id="work_worker_select"
																onclick="work_workerSelect()" placeholder="담당자 추가">
															<div id="worker_select_div">
																<ul
																	style="list-style: none; background-color: white; padding-left: 0px;">
																	<li>테스트1</li>
																	<li>테스트2</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>
																	<li>테스트3</li>

																</ul>
															</div>
														</div>
													</div>
													<!-- //담당자 -->

													<hr>


													<!-- 추가항목 -->
													<div id="external">
														<a id="external_button" onclick="external_button()">추가항목</a>
													</div>


													<div id="work_form_external_div">
														<!-- 시작일 -->
														<div>
															<div>
																<label id="work_start_img"></label>
																<div style="display: inline;">
																	<input type="text" id="start_date" placeholder="시작일"
																		style="border-style: none;">
																</div>

															</div>
														</div>
														<!-- 시작일 -->

														<hr>

														<!-- 마감일 -->
														<div>
															<div>
																<label id="work_end_img"></label>
																<div style="display: inline;">
																	<input type="text" id="end_date" placeholder="마감일"
																		style="border-style: none;">
																</div>

															</div>
														</div>
														<!-- 마감일 -->

														<hr>

														<!-- 달성도 -->
														<div>
															<div>
																<label id="work_progress_img"></label>
																<div style="display: inline;">
																	<progress id="progress" value="0" max="100"
																		onclick="progressBar()"></progress>
																</div>
															</div>
														</div>
														<!-- 달성도 -->

														<hr>

														<!-- 우선순위 -->
														<div>
															<div>
																<label id="work_order_img"></label>
																<div style="width: 40%; display: inline-block;">
																	<input type="text" placeholder="우선순위 선택"
																		style="border-style: none;">
																</div>
															</div>
														</div>
														<!-- 우선순위 -->
														<div id="order_div">
															<div>
																<ul>
																	<li>낮음</li>
																	<li>보통</li>
																	<li>높음</li>
																	<li>긴급</li>
																</ul>
															</div>
														</div>
														<hr>

													</div>
													<!-- //추가항목 -->


													<!-- 내용 -->
													<div class="work_form_content">
														<div class="div_text_write" contenteditable="true"
															style="width: 100%;" placeholder="내용을 입력해 주세요"></div>
													</div>
													<!-- //내용 -->




													<!-- 하단 툴바 -->
													<hr>
													<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

														<a class="add_file"></a>
														<a class="add_pic"></a>
														<div style="display: inline-block; float: right;">
															<select style=" vertical-align: middle; height: 27px;">
																<option></option>
																<option></option>
															</select>
															<a class="submit_a">올리기</a>
														</div>
													</div>

													<!-- //하단 툴바 -->


												</div>
											</form>
											<!-- //업무 글쓰기 -->




											<!-- 일정 -->
											<form>
												<div class="schedule_form" id="scheduleForm_div">
													<div>
														<!-- 일정 제목 -->
														<div>
															<input type="text" style="width: 100%; border-style: none;"
																placeholder="일정 제목을 입력해주세요">
														</div>
														<!-- //일정 제목 -->

														<hr>

														<!-- 일정 내용 -->
														<div class="schedule_content">

															<ul
																style="list-style: none; padding-left: 5px; margin-bottom: 0px;">
																<!-- 데이트 피커 -->
																<li>
																	<span id="sche_time_img"></span>
																	<!-- 날짜 선택 -->
																	<div style="display: inline-block; width: 80%;">
																		<input type="text" id="sche_start_date"
																			placeholder="오늘날자"
																			style="width: 20%;">&nbsp;

																		<select name="start_time"
																			id="start_time_select">
																			<option>00:00</option>
																			<option>00:30</option>
																			<option>01:00</option>
																			<option>01:30</option>
																			<option>02:00</option>
																			<option>02:30</option>
																		</select> &nbsp;~&nbsp; <input type="text"
																			id="sche_end_date" placeholder="종료날자"
																			style="width: 20%;">&nbsp;

																		<select name="end_time" id="end_time_select">
																			<option>00:00</option>
																			<option>00:30</option>
																			<option>01:00</option>
																			<option>01:30</option>
																			<option>02:00</option>
																			<option>02:30</option>
																		</select> <label> <input type="checkbox"
																				id="alldayCheck" onclick="alldayBtn()">
																			<span>종일</span>
																		</label>
																	</div> <!-- //날짜 선택 -->
																</li>
																<!-- //데이트 피커 -->

																<hr>

																<!-- 장소검색 -->
																<li>
																	<span id="sche_loc_img"
																		style="display: inline-block;"></span>
																	<!-- 장소 검색 -->
																	<div class="schedule_place" id="sche_place"
																		style="display: inline-block;">
																		<input id="address" type="text"
																			placeholder="주소입력" />
																	</div>
																</li>
																<!-- //장소 검색 -->

																<!-- google Map -->
																<div id="googleMap_div">
																	<div id="googleMap"
																		style="width: 100%; height: 200px;"></div>
																</div>
																<!-- //google Map -->

																<hr>
																<!-- 몇분전에 알람줄지 -->
																<li>
																	<!-- 알람 -->
																	<div class="schedule_alarm">

																		<span id="sche_alarm_img"></span>
																		<select>
																			<option>10분전</option>
																			<option>30분전</option>
																			<option>1시간전</option>
																			<option>2시간전</option>
																			<option>12시간전</option>
																		</select>
																</li>
																<!-- //몇분전에 알람줄지 -->

																<hr>

																<!-- 일정 메모 -->
																<li>
																	<div>
																		<div class="div_text_write"
																			contenteditable="true"></div>
																	</div>
																</li>

																<li>
																	<!-- 하단 툴바 -->
																	<hr>
																	<div
																		style="width: 100%; text-align: right; margin-top: 5px; margin-bottom: 5px;">
																		<div style="display: inline-block;">
																			<select
																				style=" vertical-align: middle; height: 27px;">
																				<option></option>
																				<option></option>
																			</select>
																			<a class="submit_a">올리기</a>
																		</div>
																	</div>
																	<!-- //하단 툴바 -->
																</li>

																<!-- //일정 메모 -->
															</ul>

														</div>
														<!-- //일정 내용 -->

													</div>
												</div>
											</form>
											<!-- //일정 -->


											<!-- 할일 -->
											<form>
												<div class="todo_form" id="todoForm_div">
													<!-- 할일 제목 -->
													<div>
														<input placeholder="할일제목을 입력해 주세요"
															style="width: 80%; border-style: none;">
													</div>
													<!-- //할일 제목 -->


													<div id="todoContent_external"></div>
													<!-- //할일내용 -->


													<!-- 할일 추가 -->
													<div>
														<span id="todo_append_img"></span>
														<a id="todo_append" onclick="todoAppend()"> 할일 추가 </a>

													</div>
													<!-- //할일 추가 -->

													<!-- 하단 툴바 -->
													<hr>
													<div
														style="width: 100%; text-align: right; margin-top: 5px; margin-bottom: 5px;">
														<div style="display: inline-block;">
															<select style=" vertical-align: middle; height: 27px;">
																<option></option>
																<option></option>
															</select>
															<a class="submit_a">올리기</a>
														</div>
													</div>

													<!-- //하단 툴바 -->

												</div>
											</form>
											<!-- //할일 -->



										</div>
										<!-- //write_form -->

									</div>
									<!-- write_form_border -->
								</div>
							</div>
							<!-- //글작성 폼 -->
							<!-- 미확인 알람 -->
                     <div id="unread_alarm_div" style="width: 100%;">
                        <div style="width: 100%; height: 50px; background-color: white;">
                           <span id="unread_alarm_img" style="display: inline-block; vertical-align: middle; margin-left: 8px; margin-right: 11px; width: 20px; height: 22px; background: url(images/sp_sectiontitle_ico1.gif) no-repeat 0 -44px;"></span>
                           <h5 style="display: inline-block; vertical-align: middle; margin-top: 10px; font-size: 15px;"><strong>미확인 알람</strong></h5>
                           <span style="display: inline-block; vertical-align: middle; text-align: center; width: 30px; height: 14px; border-radius: 8px; background-color: red; font-size: 12px;">12</span>
                           <span style="display: inline-block; vertical-align: middle; margin-left: 300px; font-size: 13px;"><strong>모두읽음</strong></span>
                        </div>
                        <!-- 알람글 최초 3개 -->
                        <!-- forEach -->
                        <div style="background-color: lightgray; width: 100%;">
                           <div style="width: 100%; padding: 5px 5px 5px 5px;">
                              <div style="display: inline-block;">
                                 <img src="images/empty_photo_s.png">
                              </div>
                              <div style="display: inline-block; width: 400px; vertical-align: middle;">
                                 <span style="font-size: 12px;"><strong>글쓴놈</strong></span>
                                 <span style="font-size: 10px;">현재일자 |</span>
                                 <span style="font-size: 10px;">현재시간</span>
                                 <br>
                                 <span style="font-size: 10px;">글내용입니다</span>
                              </div>
                              <span style="display: inline-block; vertical-align: middle; text-align: center; font-size: 12px; border-radius: 10px; border: 3px solid #676869; background-color: lightgray; width: 45px; height: 25px; margin-left: 20px;">
                                 보기
                              </span>
                           </div>
                        </div>
                     </div>
                     <!-- //forEach -->
                     <div style="text-align: center; vertical-align: middle; background-color: white;">
                        <span style="font-size: 9px;">더보기</span>
                     </div>
                     <!-- //미확인 알람 -->

                     <!-- 상단 고정글 -->
                     <div id="upper_fixed_article" style="margin-top: 10px;">
                        <div style="width: 100%; height: 35px; background-color: white; padding: 5px 5px 5px 5px;">
                           <span id="upper_fixed_img" style="display: inline-block;vertical-align: middle; width: 20px; height: 22px; background: url(images/sp_sectiontitle_ico1.gif) no-repeat 0 -66px;"></span>
                           <span style="display: inline-block;">상단 고정글</span>
                           <span style="margin-left: 5px;"><strong>2</strong></span>

                        </div>
                        <!-- forEach -->
                        <div style="background-color: white; padding: 5px;">
                           <div style="display: inline-block; width: 270px;">
                              <span style="display: inline-block;">[피드백]</span>
                              <span style="display: inline-block;">글 제목</span>
                           </div>
                           <span style="display: inline-block; vertical-align: middle; text-align: center; width: 60px; height: 13px; font-size: 10px; border-radius: 5px; background-color: lightblue; margin-left: 170px;">요청</span>
                        </div>
                        <!-- 누르면 나올 게시물 -->
                        <div style="display: none;">

                        </div>
                        <!-- //누르면 나올 게시물 -->
                        <!-- //forEach -->
                     </div>
                     <!-- //상단 고정글 -->
						</div>
					</div>
					<!-- //게시글 넣는곳 -->
					<!-- //게시글 넣는곳 -->

				</div>
				<!-- //센터영역-->
				<!--오른쪽영역-->
				<!-- 세영 -->
				<div class="rightContainer">



					<div class="aside_wrap">
					   <div>
						  <a href="#" class="btn_listback">이전화면</a>
					   </div>
	 
					   <div class="set_wrap col-12">
						  <ul style="padding-inline-start: 0px;">
							 <li><a href="#" id="file-box" class="ico1"
								style="padding-top: 30px; height: 50px;">파일함</a></li>
							 <li><a href="#" id="task-list" class="ico5"
								style="padding-top: 30px; height: 50px;">업무</a></li>
							 <li><a href="#" id="schedule-calendar" class="ico4"
								style="padding-top: 30px; height: 50px;">일정</a></li>
							 <li><a href="#" id="todo-list" class="ico3"
								style="padding-top: 30px; height: 50px;">할일</a></li>
						  </ul>
					   </div>
	 
					   <div>
						  <div class="r_invite_box">
							 <a id="project-invite-btn" class="invite">초대하기</a>
						  </div>
						  <!-- 참여자목록 -->
	 
						  <div class="participant_wrap">
							 <div>
								<div class="msg_user">
								   <strong>전체 참여자</strong>&nbsp; <strong>2</strong>
								   <!-- 프로젝트 참여인원 db -->
								   <strong>명</strong> <a>전체보기</a>
								</div>
							 </div>
	 
							 <div>
								<div>
								   <h5>
									  <strong id="msg">관리자</strong> <span id="msg">(1)</span>
								   </h5>
								</div>
								<ul>
								   <li class="right-sendience-li">
									  <div class="msgphoto">
										 <img id="uimg" src="images/noimg.gif">
									  </div>
									  <div id="sendience-right-btns" class="btn_right">
										 <a id="sendience-chat" class="btn chat"> <span
											class="blind">채팅</span>
										 </a>
									  </div>
									  <div class="username" style="cursor: pointer;">
										 <span id="sendience-name" user-id="" use-intt-id="">안세영
											(나)</span>
									  </div>
								   </li>
								</ul>
	 
								<div>
								   <h5>
									  <strong id="msg">참여자</strong> <span id="msg">(1)</span>
								   </h5>
								</div>
								<ul>
								   <li class="right-sendience-li">
									  <div class="msgphoto">
										 <img id="uimg" src="images/noimg.gif">
									  </div>
									  <div id="sendience-right-btns" class="btn_right">
										 <a id="sendience-chat" class="btn chat"> <span
											class="blind">채팅</span>
										 </a>
									  </div>
									  <div class="username" style="cursor: pointer;">
										 <span id="sendience-name" user-id="" use-intt-id="">장원종</span>
									  </div>
								   </li>
								</ul>
							 </div>
						  </div>
	 
						  <div class="btn_prj_chat_box">
							 <a id="project-open-chat" class="btn_prj_chat">프로젝트 채팅</a>
						  </div>
	 
					   </div>
					</div>
	 
				 </div>
	 
	 
	 
				 <!-- Bootstrap core JavaScript -->
				 <script src="vendor/jquery/jquery.min.js"></script>
				 <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			 </div>
			 <!--end center-->
		 </div>
		 <div id="new_plus" style="display: none; z-index: 1001;">
				 <div style="text-align: center; width: 340px; height: 180px; border: 1px solid pink; margin-top:200px; margin-left:auto; margin-right:auto; padding: 10px 10px 10px 10px;background-color: white;">
					 <div style="text-align: center; margin: auto; padding-bottom: 10px; border-bottom: 1px solid #eaeaea; ">
						 <span style="padding-left: 15px; font-size: 20px;">보관함 만들기</span> 
						 <a href="#" style="float: right" onclick="new_plus()">X</a>
					 </div>
					 <div style="margin: auto; padding: 20px;">
						 <input type="text" placeholder="보관함명 입력(최대50자)"	style="width: 90%; height: 30px;">
						 <div style="padding-top: 15px">
							 <input class="box_btn" type="button" value="취소" onclick="new_plus()"> 
							 <input style="background-color: aqua;" class="box_btn" type="button" value="만들기">
						 </div>
					 </div>
			 </div>
		 </div>
	 

		</div>


			<!-- Bootstrap core JavaScript -->
			<script src="vendor/jquery/jquery.min.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		</div>
		<!--end center-->
	</div>
	<div id="new_plus" style="display: none; z-index: 1001;">
		<div
			style="text-align: center; width: 340px; height: 180px; border: 1px solid pink; margin-top:200px; margin-left:auto; margin-right:auto; padding: 10px 10px 10px 10px;background-color: white;">
			<div style="text-align: center; margin: auto; padding-bottom: 10px; border-bottom: 1px solid #eaeaea; ">
				<span style="padding-left: 15px; font-size: 20px;">보관함 만들기</span>
				<a href="#" style="float: right" onclick="new_plus()">X</a>
			</div>
			<div style="margin: auto; padding: 20px;">
				<input type="text" placeholder="보관함명 입력(최대50자)" style="width: 90%; height: 30px;">
				<div style="padding-top: 15px">
					<input class="box_btn" type="button" value="취소" onclick="new_plus()">
					<input style="background-color: aqua;" class="box_btn" type="button" value="만들기">
				</div>
			</div>
		</div>
	</div>
</body>

<!-- jquery -->
<script src="script/jquery-3.5.1-min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<script type="text/javascript" src="script/script.js"></script>
<script type="text/javascript" src="script/datepicker.js"></script>


<script type="text/javascript" src="script/articleScript.js"></script>
<script type="text/javascript" src="./script/script.js"></script>
<script type="text/javascript" src="./script/task.js"></script>

</html>