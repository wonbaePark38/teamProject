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
<script type="text/javascript" src="script/fileupload.js"></script>
<script type="text/javascript" src="script/task.js"></script>
<!-- projectdir -->
<script>
	function init(){
		$('#locker_list').text('보관함 설정');
		$('#locker_hide').text('숨기기');
		$('.dir_set_bar').hide();
		$('.headerWrap').show();
		
		// 프로젝트 선택css
		$('.setting_div').attr('id','setting_');
		$('.dir_set_on').attr('class','dir_set');
		$(this).attr('class','dir_set');
		$('.project_div_on').attr('class','project_div');
		$('.div_btn').hide();
		$('.div_btn_on').hide();
	}

	$(document).on('click', '#main_side', function() {
		init();
		
		var click_menu = $(this).text().trim();
		
		$('#none_project').show();
		if (click_menu == '전체') {
			$('.content_type').hide();
			$('#project_dir_list1').show();
		} else if (click_menu == '미보관') {
			$('.content_type').hide();
			$('#project_dir_list2').css('display', 'inline-block');
		} else if (click_menu == '읽지않음') {
			$('.content_type').hide();
			$('#project_dir_list3').css('display', 'inline-block');
		} else if (click_menu == '즐겨찾기') {
			$('.content_type').hide();
			$('#project_dir_list4').css('display', 'inline-block');
		} else if (click_menu == '전체 업무') {
			alert('전체 업무');
		} else if (click_menu == '전체 일정') {
			alert('전체 일정');
		} else if (click_menu == '전체 파일') {
			alert('전체 파일');
		} else if (click_menu == '담아둔 글') {
			alert('담아둔 글');
		} else if (click_menu == '나를 지정') {
			alert('나를 지정');
		} else if (click_menu == '내 게시물') {
			alert('내 게시물');
		} else if (click_menu == '숨김') {
			$('.content_type').hide();
			$('.setting_div').attr('id','setting_hide');
			$('#locker_hide').text('숨기기 해제');
			$('#locker_n').text(click_menu);
			$('#hide_load').css('display', 'inline-block');
			
		} else {
			// 보관함 선택
			$('.content_type').hide();
			$('.setting_div').attr('id','setting_locker');
			$('#locker_list').text('보관함 해제');
			$('div[id='+click_menu+']').css('display', 'inline-block');
		}
	});
	
	// 보관함 설정
	$(document).on('click', '.locker_setbtn', function() {
		// 선택된 프로젝트
		var select_project = "";
		var select_btn = false;
		
		// 프로젝트 선택 여부
		$("input:button[class=div_btn_on]").each(function(){
			select_project += ($(this).next().val())+",";
		});
		
		// 보관함 추가
		if ($(this).attr('id') == 'locker_list') {
			if ($('#locker_list').text() == '보관함 설정') {
				if (select_project == null || select_project == '') {
					alert('프로젝트를 선택해 주세요.')
				} else {
					$('.locker_list_set').toggle();	
				} 
			} else if ($('#locker_list').text() == '보관함 해제') {
				alert('2');
			}
			
		// 프로젝트 숨기기
		} else if ($(this).attr('id') == 'locker_hide') {

			var hide_locker = null;

			// 숨김 여부
			if ($('#locker_hide').text() == '숨기기') {
				hide_locker = 1;
			} else if($('#locker_hide').text() == '숨기기 해제') {
				hide_locker = 0;
			} 
			
			// 프로젝트 선택 여부
			if (select_project == null || select_project == '') {
				alert('프로젝트를 선택해 주세요.')
			} else {
				select_project = select_project.substr(0, select_project.length-1);
				
				
				// form 생성
				var hide_locker_set_name = $('<form></form>');
	
				// form 설정
				hide_locker_set_name.attr('method', 'post');
				hide_locker_set_name.attr('action', 'hidelocker.do');
	
				// form 데이터
				hide_locker_set_name.append($('<input/>', {type : 'hidden', name :'project_id_list', value :select_project}));
				hide_locker_set_name.append($('<input/>', {type : 'hidden', name :'hide_locker', value :hide_locker}));
	
				// form 생성하는 곳
				hide_locker_set_name.appendTo('.mainWrap');
	
				hide_locker_set_name.submit();
			}
		}
	});
	
	// 보관함 삭제
	$(document).on('click', '#locker_del', function() {
		
		var locker_del_list = '';
		var locker_del_name = $(this).next().text();
		var locker_del_id = $(this).prev().val();
		
		$('div[id=test]').children('input[name=project_id]').each(function(){alert($(this).val())}); 
		
		
		// form 생성
		var locker_del = $('<form></form>');

		// form 설정
		locker_del.attr('method', 'post');
		locker_del.attr('action', 'deletelocker.do');

		// form 데이터
		locker_del.append($('<input/>', {type : 'hidden', name :'project_locker', value :locker_del_name}));
		locker_del.append($('<input/>', {type : 'hidden', name :'locker_list_id', value :locker_del_id}));

		// form 생성하는 곳
		locker_del.appendTo('.mainWrap');

		locker_del.submit();
	});
	
	// 보관함에 프로젝트 추가
	$(document).on('click','#locker_success',function(){
		
		// 선택된 프로젝트
		var select_project = "";
		$("input:button[class=div_btn_on]").each(function(){
			select_project += ($(this).next().val())+",";
		});
		select_project = select_project.substr(0, select_project.length-1);

		// 선택된 보관함
		var select_locker = "";
		
		if ($('#locker_list').text() == '보관함 설정') {
			select_locker = $('input[name="locker_cbox"]:checked').val();
		} else if ($('#locker_list').text() == '보관함 해제') {
			select_locker = null;
		}
		
		alert(select_locker);
		
		if (select_project == null || select_project == '') {
			alert('프로젝트를 선택해 주세요.')
		} else{
			
			
			// form 생성
			var locker_set_name = $('<form></form>');
				// form 설정
			locker_set_name.attr('method', 'post');
			locker_set_name.attr('action', 'updatelocker.do');
				// form 데이터
			locker_set_name.append($('<input/>', {type : 'hidden', name :'project_id_list', value :select_project}));
			locker_set_name.append($('<input/>', {type : 'hidden', name :'project_locker', value :select_locker}));
			
			// form 생성하는 곳
			locker_set_name.appendTo('.mainWrap');
		
			locker_set_name.submit();
		}
	}); 
	
	$(document).on('click','#locker_add',function(){
		// 특수문자 구분
		var blank_pattern = /[\s]/g;
		var locker_name = $('#locker_name').val();
		var locker_name_check = null;
		$('a[id=main_side]').each(function(){
			if ($(this).text().trim() == locker_name) {
				locker_name_check = true;
			}
		});
		
		if (locker_name_check == true) {
			alert("중복된 보관함이 있습니다."); 
		} else if(locker_name == '' || locker_name == null) {
			alert("보관함 이름을 입력해주세요."); 
		} else if(blank_pattern.test(locker_name) != true ) { 
			// form 생성
			var locker_form = $('<form></form>');
			
			// form 설정
			locker_form.attr('method','post');
			locker_form.attr('action','insertlocker.do');
			// form 데이터
			locker_form.append($('<input/>',{type:'hidden', name:'locker_name', value:locker_name}));
			
			// form 생성하는 곳
			locker_form.appendTo('.mainWrap');
			locker_form.submit();
		} else {
			alert("공백이나 특수문자는 사용할 수 없습니다."); 
			
		}
		
	});
</script>
</head>
<style>
</style>

<body>
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
						style="padding: .5rem 1.25rem;">읽지않음</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem;">즐겨찾기</a>

					<div style="font-size: 10pt; color: #C0C0C0">모아보기</div>
					<a id="main_side" class="list-group-item"
						style="padding: .5rem 1.25rem;">전체 업무</a> <a id="main_side"
						href="calendar.jsp" class="list-group-item"
						style="padding: .5rem 1.25rem;">전체 일정</a> <a id="main_side"
						href="totalFileView.do" class="list-group-item"
						style="padding: .5rem 1.25rem;">전체 파일</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem;">담아둔 글</a>
					<a id="main_side" class="list-group-item"
						style="padding: .5rem 1.25rem;">나를 지정</a> <a id="main_side"
						class="list-group-item" style="padding: .5rem 1.25rem;">내 게시물</a>

					<div class="menu_plus">
						<a class="sort" onclick="new_plus()">보관함</a>
					</div>
					<c:forEach var="locker_list" items="${projectLockerList}">
						<input type="hidden" name="locker_list_id" value="${locker_list.locker_list_id}">
						<span id="locker_del" style="position:absolute; background-color: pink; width: 15px; height: 15px; z-index: 300; right: 15px; margin-top: 12px;"></span>
						<a id="main_side" class="list-group-item"
							style="padding: .5rem 1.25rem;">${locker_list.locker_name}
						</a>
					</c:forEach>
					<a id="main_side" class="list-group-item" style="padding: .5rem 1.25rem;">
						숨김
					</a>

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
					<a onclick="">X</a>
					<h3>보관함 설정</h3>
				</div>
				<div class="locker_save_list">
					<ul>
						<c:forEach var="locker_list" items="${projectLockerList}">
							<li>
								<input type="hidden" name="locker_list_id" value="${locker_list.locker_list_id }"/>
								<label><input name="locker_cbox" type="radio" value="${locker_list.locker_name}">${locker_list.locker_name}</label><br>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="locker_set_div" style="width: 100%; font-size: 20px; height: 40px;">
					<span id="locker_success" style="padding: 5px 55px;">확인</span>
					<span class="locker_list_set" style="padding: 5px 55px;">취소</span>
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
						<input class="box_btn" type="button" value="취소"
							onclick="new_plus()"> <input id="locker_add"
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

</html>