<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin_project.css">
<script type="text/javascript" src="js/lib/jquery-1.10.2.min.js"></script>
</head>
<body>

	<div class="pj_wrap">
		<span>
			<div class="titleh1_style">
				<div>
					<h1>프로젝트 관리</h1>
				</div>
			</div>
			
			<div id="HEAD-TAB" class="tab1_style mgt30">
				<a id="PROJECT_TAB" data="PROJECT" class="on" >프로젝트별</a>
			</div>
			
			<!-- 검색 테이블 -->
			<div id="PROJECT_SEARCH" class="titleh2_style" style="margin-top:15px; margin-bottom:15px">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
					<col style="width:310px;">
					<col style="width:110px;">
					<col style="width:310px;">
					<col>
					</colgroup>
					<tbody><tr>
						<td>
							<input id="project_srch_word" type="text" placeholder="프로젝트명을 적어주세요" style="width:280px;">
						</td>
						<th scope="row">
							<select style="width:100px;">
								<option data="activity-date">최근활동일</option>
								<option data="write-date" style="display: none;">게시물등록일</option>
							</select>
						</th>
						<td>
							<input type="text" id="USE_SCHD_STTG_DT" class="SCHD_STTG_DT hasDatepicker" style="width:130px;" autocomplete="off" sttg_dt="20200129">
							<input type="text" id="USE_SCHD_FNSH_DT" class="SCHD_FNSH_DT hasDatepicker" style="width:130px;" autocomplete="off" fnsh_dt="20200729">
						</td>
						<td><a id="PROJECT_SRCH_BTN" class="btn srchbtn_style" >검색</a></td>
					</tr>
				</tbody></table>
				<div class="right">
					 <button id="PROJECTExcel" class="btn_icodown" >엑셀내려받기</button>
				</div>
			</div>
			<!-- // 검색 테이블 -->
			
			<!-- 결과 리스트 테이블 -->
			<div id="PROJECT_TABLE" class="list_table mgt10 mgb15">
				<table cellpadding="0" cellspacing="0">
					<caption></caption>
					<colgroup>
						
						<col style="width:20%">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" style="display: none;"><div><span>프로젝트 번호</span><a data="PROJ_NUM"></a></div></th>
							<th scope="col"><div><span>프로젝트</span><a data="TTL"></a></div></th>
							<th scope="col"><div><span>관리자</span><a data="ADMIN"></a></div></th>
							<th scope="col"><div><span>참여자수</span><a data="JOIN_CNT"></a></div></th>
							<th scope="col"><div><span>게시물수</span><a data="PROJECT_CNT"></a></div></th>
							<th scope="col"><div><span>댓글수</span><a data="REMARK_CNT"></a></div></th>
							<th scope="col"><div><span>채팅수</span><a data="CHAT_CNT"></a></div></th>
							<th scope="col"><div><span>일정수</span><a data="SCHD_CNT"></a></div></th>
							<th scope="col"><div><span>업무수</span><a data="TASK_CNT"></a></div></th>
							<th scope="col"><div><span>최근활동일</span><a data="EDTR_DTTM"></a></div></th>
							<th scope="col"><div><span>개설일</span><a data="RGSN_DTTM"></a></div></th>
						</tr>
					</thead>
				</table>
				
				
				<!-- scroll -->
				<div id="useStatPrjScroll" class="scrollbox mCustomScrollbar _mCS_13 mCS-autoHide mCS_no_scrollbar" style="max-height: 600px;"><div id="mCSB_13" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_13_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
					<table cellpadding="0" cellspacing="0">
						<caption></caption>
						<colgroup>
							
							<col style="width:20%">
							<col style="">
							<col style="">
							<col style="">
							<col style="">
							<col style="">
							<col style="">
						</colgroup>
						<tbody><tr style="cursor: pointer; background-color: rgb(255, 255, 255);"><td>'wevevvedvsadwef' 업무공유방</td><td>안세영</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>2020-07-29 13:08</td><td>2020-07-29 13:08</td></tr></tbody>
					</table>
				</div><div id="mCSB_13_scrollbar_vertical" class="mCSB_scrollTools mCSB_13_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_13_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
				<!-- //scroll -->
			</div>
			<!-- // 결과 리스트 테이블 -->
			
			
			
			<!-- 모달창 -->
			<div id="addProjLayer2" class="bgmodal_wrap" style="position: fixed; top: 50%; left: 50%; margin-top: -469.5px; margin-left: -730px; display: none;">

			<div class="lyaer_popup_wrap" style="width:900px;margin-top:-370px;margin-left:-450px;">
				<div class="lyaer_popup_top">
					<h1><span>프로젝트 정보</span><input style="cursor:pointer" type="button" class="pop_close" title="닫기"></h1>
				</div>
				<div class="lyaer_popup_cont">
					<div class="srch_table mgt10">
						<table cellpadding="0" cellspacing="0" class="htlowtype">
							<colgroup>
							<col style="width:150px;"><col>
							</colgroup>
							<tbody><tr>
								<th scope="row">프로젝트명</th>
								<td><input name="proj_name" type="text" placeholder="프로젝트명을 입력하세요" style="width:98.5%;" maxlength="100"></td>
							</tr>
							
							
							
		                    <tr>
		                        <th scope="row">관리자</th>
		                        <td>
		                            <a id="mngrAdd2" style="cursor:pointer" class="btn btn_style1_s">추가</a>
		                            <span id="mngrAlert2" style="color:red"></span>
		                        </td>
		                    </tr>
		                    
							<tr>
								<td colspan="2">
									<!-- 리스트테이블 -->
									<div id="mngr_list_table2" class="list_table">
										<table cellpadding="0" cellspacing="0">
											<caption></caption>
											<colgroup>
											<col style="width:17%;">
											<col style="width:27%;">
											<!--<col style="width:15%;"> -->
											<col style="width:15%;">
											<col style=";">
											<col style="width:13%;">
											<col class="add_exp">
											</colgroup>
											<thead>
												<tr>
													<th scope="col"><div>사용자명</div></th>
													<th scope="col"><div>아이디</div></th>
													<!-- <th scope="col"><div>회사</div></th> --> 
													<th scope="col"><div>부서</div></th>
													<th scope="col"><div>이메일</div></th>
													<th scope="col"><div>휴대폰번호</div></th>
													<th scope="col" class="add_exp"><div>관리자</div></th>
												</tr>
											</thead>
										</table>
										<!-- scroll -->
										<div id="projUserDiv" class="scrollbox mCustomScrollbar _mCS_14 mCS-autoHide mCS_no_scrollbar" style="max-height: 195px; border-bottom: 1px solid rgb(197, 198, 203); height: auto;"><div id="mCSB_14" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_14_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
											<table cellpadding="0" cellspacing="0">
												<caption></caption>
												<colgroup>
													<col style="width:17%;">
													<col style="width:27%;">
													<!--<col style="width:15%;"> -->
													<col style="width:15%;">
													<col style=";">
													<col style="width:13%;">
													<col class="add_exp">
												</colgroup>
												<tbody id="mngr_tbody2"><tr><td name="username">안세영</td><td><span class="user_ids" data-userid="ahncount@gmail.com">ahncount@gmail.com</span></td><td></td><td></td><td></td><td>&nbsp;<a class="out_bt tbold_uline admin-release" value="destory">관리자[해제]</a></td></tr></tbody>
											</table>
										</div><div id="mCSB_14_scrollbar_vertical" class="mCSB_scrollTools mCSB_14_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_14_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>	
										<!-- //scroll -->
									</div>
									<!-- //리스트테이블 -->
								</td>
							</tr>	
										
							<tr>
							    <th scope="row">글 / 댓글 작성 권한</th>
								<td>
							        <div class="radiobox">
										<label class="on"><input type="radio" name="comprj_mngr_wr_yn" value="N" checked="">&nbsp;<span style="cursor:pointer">전체</span></label>&nbsp;&nbsp;
										<label class="on"><input type="radio" name="comprj_mngr_wr_yn" value="Y">&nbsp;<span style="cursor:pointer">관리자만 글/댓글 작성 가능</span></label>
									</div>
							    </td>
							</tr>
							<tr>
							    <th scope="row">글 조회 권한</th>
								<td>
							        <div class="radiobox">
										<label class="on"><input type="radio" name="comprj_srch_auth_yn" value="N" checked="">&nbsp;<span style="cursor:pointer">전체</span></label>&nbsp;&nbsp;
										<label class="on"><input type="radio" name="comprj_srch_auth_yn" value="Y">&nbsp;<span style="cursor:pointer" >관리자 + 글 작성 본인만 조회 가능</span></label>
										<!-- <span id="mngrAlert2" style="color:red" data-langcode="FA1456">※ 프로젝트 생성 후 권한 변경 불가 </span > -->
									</div> 
							    </td>
							</tr>
							<tr>
							    <th scope="row">파일 다운로드 권한</th>
								<td>
							        <div class="radiobox">
										<label class="on"><input type="radio" name="comprj_prj_auth" value="N" checked="">&nbsp;<span style="cursor:pointer" >전체</span></label>&nbsp;&nbsp;
										<label class="on"><input type="radio" name="comprj_prj_auth" value="Y">&nbsp;<span style="cursor:pointer">관리자 + 글 작성 본인만 다운로드 가능  <span style="color: red">(*문서 및 이미지 조회도 차단됩니다)</span></span></label>
									</div>
							    </td>
							</tr>
							<tr id="dbOfficialAppoint" style="display: none;">
							    <th scope="row">공식 프로젝트 지정</th>
								<td>
							        <div class="radiobox">
										<label class="on"><input type="checkbox" name="officail_proj_check"></label>&nbsp;&nbsp;
									</div>
							    </td>
							</tr>
						</tbody></table>
					</div>
					<!-- // -->
		
					<div class="t_center mgt15 btn_wrap">
						<div class="left"><a id="del_proj2" style="cursor:pointer" class="btn btn_popstyle2 bgred" >삭제</a></div>
						<a id="save-or-edit2" style="cursor:pointer" class="btn btn_popstyle1 bgblue" >수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="cursor:pointer" class="btn btn_popstyle1 pop_close" >취소</a>
					</div>
				</div>
			</div>
			
			<!-- 관리자페이지 -->
			<div id="proj_mngr_layer2" class="layer_popup_wrap" style="z-index: 1001; width: 570px; min-height: 180px; padding-bottom: 20px; margin-top: -300px; margin-left: -285px; display: none;">
				<div class="layer_popup_top">
				<h1 >관리자 선택</h1> 
					<a style="cursor:pointer" class="pop_close"><img src="images/btn_popclose.gif" alt="닫기"></a>
		
					<div class="srch_table mgt20">
						<table cellpadding="0" cellspacing="0">
							<colgroup>
								<col style="width:15%">
								<col style="width:35%">
								<col style="width:60%">
							</colgroup>
							<tbody>
							<tr>
								<td> 
									<select id="comm_user_catg2">
										<option >이름</option>
										<option >아이디</option>
									</select>
								</td>
								<td><input id="comm_user_srch_word2" type="text" style=""></td>
								<td><a style="cursor:pointer" class="btn srchbtn_style">검색</a></td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="layer_popup_cont">
					<div class="list_table mgt20 mgb15">
						<table cellpadding="0" cellspacing="0">
							<caption></caption>
							<colgroup>
							<col style="">
							<col style="">
							<col style="width:20%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><div><span>이름</span><a data="TTL" style="cursor:pointer" class="sort"></a></div></th>
									<th scope="col"><div><span>아이디</span><a data="SENDIENCE_CNT" style="cursor:pointer" class="sort"></a></div></th>
									<th scope="col"><div><span>선택</span><a data="COMMT_CNT" style="cursor:pointer" class="sort"></a></div></th>
								</tr>
							</thead>
						</table>
						<!-- scroll -->
						<div id="mngr_scroll2" class="scrollbox mCustomScrollbar _mCS_15 mCS-autoHide mCS_no_scrollbar" style="height:200px"><div id="mCSB_15" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 200px;" tabindex="0"><div id="mCSB_15_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
							<table cellpadding="0" cellspacing="0">
								<caption></caption>
								<colgroup>
								<col style="">
								<col style="">
								<col style="width:20%">
								</colgroup>
								<tbody id="comm_user_tbody2"><tr><td>안세영</td><td>ahncount@gmail.com</td><td>&nbsp;<a class="out_bt tbold_uline admin-release">관리자[해제]</a></td></tr></tbody>
							</table>
						</div><div id="mCSB_15_scrollbar_vertical" class="mCSB_scrollTools mCSB_15_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_15_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
						<!-- //scroll -->
					</div>
					<!-- //리스트테이블 -->
				</div>		
				
				<div class="t_center mgt15 btn_wrap">
					<a style="cursor:pointer" class="btn btn_popstyle1 bgblue">확인</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="cursor:pointer" class="btn btn_popstyle1 pop_close">취소</a>
				</div>
						
			</div>
			<div class="bgmodal" style="display: none;"></div>
		
			
		</div>
			
			
		</span>
	</div>

</body>
<script>


$("#mCSB_13_container > table > tbody > tr").click(function() {
	$(".bgmodal_wrap").css("display", "block");
})

$(".pop_close").click(function() {
	if($(".bgmodal").css("display") == "block") {
		$(".bgmodal").css("display", "none");
		$(".layer_popup_wrap").css("display", "none");	
	} else if($(".bgmodal_wrap").css("display") == "block") {
		$(".bgmodal_wrap").css("display", "none");
	}
});

$("#mngrAdd2").click(function() {
	$(".bgmodal").css("display", "block");
	$(".layer_popup_wrap").css("display", "block");
});
</script>
</html>