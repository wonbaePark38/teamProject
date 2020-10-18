<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link rel="stylesheet" href="css/admin_project.css">
<script type="text/javascript" src="js/lib/jquery-1.10.2.min.js"></script>
</head>
<body>

	<div class="pj_wrap">
	
		<span id="flow-comm-proj" class="left-menu" style="display: inline;">
	
			<script type="text/javascript" src="/js/collabo/flow_comm_proj.js?202007290725"></script>
			
			<!-- 대타이틀 -->
			<div class="titleh1_style">
				<div>
					<h1 data-langcode="FA1422">회사 프로젝트 관리</h1>
				</div>
			</div>
			<!-- //대타이틀 -->
			
			<!-- 검색테이블 -->
			<div class="srch_table mgt10">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
					<col style="width:350px;">
					<col style="width:110px;">
					<col style="width:310px;">
					<col>
					</colgroup>
					<!--
					<tr>
						<td scope="row">
							<select style="width:330px;">
								<option>회사명</option>
							</select>
						</th>
						<th scope="row">
							<select style="width:100px;">
								<option>생성일</option>
								<option>최근 활동일</option>
							</select>
						</th>
						<td>
							<select style="width:130px;">
								<option>2012-02-22</option>
							</select>&nbsp;-
							<select style="width:130px;">
								<option>2012-02-22</option>
							</select>
						</td>
						<td><a style="cursor:pointer" class="btn srchbtn_style">검색</a></td>
					</tr>
					-->
					
					<tbody><tr>
						<td colspan="3">
							<select style="width:120px; cursor:pointer">
								<option data-langcode="FL567">프로젝트명</option>
							</select>
							<input id="comm_proj_srch_word" type="text" placeholder="프로젝트명" style="width:490px;" data-langcode="FL567">
						</td>
						<td colspan="2" id="excel-prj-bt-where"><a style="cursor:pointer" class="btn srchbtn_style" data-langcode="CPH1359">검색</a></td>
					</tr>
					
				</tbody></table>
			</div>
			<!-- //검색테이블 -->
			
			<!-- btn both -->
			<div class="btn_both top_line mgb10">
				<div class="left"><a id="addProjBtn" class="btn plusbtn_style">+ <span data-langcode="FA1434">등록</span></a></div>
			</div>
			
			<!-- 리스트테이블 -->
			<div id="comm_proj_list_table" class="list_table mgt10 mgb15">
				<table cellpadding="0" cellspacing="0">
					<caption></caption>
					<colgroup>
					<col style="">
					<col style="">
					<!-- <col style="">-->
					<col style="">
					<col style="">
					<col style="">
					<col style="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><div><span data-langcode="FA1605">최근활동일시</span><a data="TOP_RGSR_DTTM" style="cursor:pointer" class=""></a></div></th>
							<th scope="col"><div><span data-langcode="FA1436">생성일시</span><a data="RGSN_DTTM" style="cursor:pointer" class=""></a></div></th>
							<th scope="col"><div><span data-langcode="FL567">프로젝트명</span><a data="TTL" style="cursor:pointer" class=""></a></div></th>
							<!-- <th scope="col"><div>참여자수<a data="SENDIENCE_CNT" style="cursor:pointer" class="sort"></a></div></th>-->
							<th scope="col"><div><span data-langcode="FA1438">게시물수</span><a data="COMMT_CNT" style="cursor:pointer" class=""></a></div></th>
							<th scope="col"><div><span data-langcode="FA1439">댓글수</span><a data="REMARK_CNT" style="cursor:pointer" class=""></a></div></th>
							<th scope="col"><div><span data-langcode="FA1440">만든이(아이디)</span><a data="RGSR_NMID" style="cursor:pointer" class=""></a></div></th>
						</tr>
					</thead>
				</table>
				<!-- scroll -->
				<div id="proj_scroll" class="scrollbox mCustomScrollbar _mCS_23 mCS-autoHide mCS_no_scrollbar" style="height:600px"><div id="mCSB_23" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_23_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
					<table cellpadding="0" cellspacing="0">
						<caption></caption>
						<colgroup>
						<col style="">
						<col style="">
						<!--<col style="">-->
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						</colgroup>
						<tbody id="comm_proj_tbody"><tr style="cursor: pointer; background-color: rgb(255, 255, 255);"><td>2020.07.29 13:08</td><td>2020.07.29 13:08</td><td>'wevevvedvsadwef' 업무공유방</td><td>1</td><td>0</td><td>안세영(ahncount@gmail.com)</td></tr></tbody>
					</table>
				</div><div id="mCSB_23_scrollbar_vertical" class="mCSB_scrollTools mCSB_23_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_23_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
				<!-- //scroll -->
			</div>
			<!-- //리스트테이블 -->
			
			<div id="addProjLayer" class="bgmodal_wrap" style="position: fixed; top: 50%; left: 50%; margin-top: -469.5px; margin-left: -742px; display: none;">
			
				<div class="lyaer_popup_wrap" style="width:900px;margin-top:-370px;margin-left:-450px;">
					<div class="lyaer_popup_top">
						<h1><span data-langcode="FA1834">회사 프로젝트 정보</span><input style="cursor:pointer" type="button" class="pop_close" title="닫기"></h1>			
					</div>
					<div class="lyaer_popup_cont">
						<div class="srch_table mgt10">
							<table cellpadding="0" cellspacing="0" class="htlowtype">
								<colgroup>
								<col style="width:150px;"><col>
								</colgroup>
								<tbody><tr>
									<th scope="row" data-langcode="FL567">프로젝트명</th>
									<td><input name="proj_name" type="text" placeholder="프로젝트명을 입력하세요" style="width:98.5%;" maxlength="100" data-langcode="FA1441"></td>
								</tr>
								
								<!-- 
								<tr class="vtop">
									<th scope="row">참여 회사</th>
									<td>
										<div class="complist_wrap">
											<div class="complist"><a style="cursor:pointer"class="btn btn_style1_s">설정</a>&nbsp;<span>조인스중앙</span><span>JTBC</span><span>휘닉스파크</span><span>만약두줄로넘어갈때</span><span>이렇게</span><span>이렇게</span><span>이렇게</span><span>이렇게</span><span>이렇게</span><span>이렇게</span><span>조인스중앙</span><span>JTBC</span><span>휘닉스파크조인스중앙</span><span>JTBC</span><span class="last">휘닉스파</span></div>
										</div>
										<p><label style="font-size:13px;color:#afafaf;"><input type="checkbox"> 협력사 직원을 제외하는 경우, 여기에 체크하세요</label></p>
									</td>
								</tr>
								 -->
								 
								<tr>
									<th scope="row" data-langcode="H420">관리자</th>
									<td>
										<a id="mngrAdd" style="cursor:pointer" class="btn btn_style1_s" data-langcode="FA1443">추가</a>
										<span id="mngrAlert" style="color:red"></span>						
									</td>
								</tr>
								
								<tr>
									<td colspan="2">
										<!-- 리스트테이블 -->
										<div id="mngr_list_table" class="list_table">
											<table cellpadding="0" cellspacing="0">
												<caption></caption>
												<colgroup>
												<col style="width:17%;">
												<col style="width:27%;">
												<!--<col style="width:15%;"> -->
												<col style="width:15%;">
												<col style=";">
												<col style="width:13%;">
												<col style="width:9%;" class="add_exp">
												</colgroup>
												<thead>
													<tr>
														<th scope="col"><div data-langcode="FA1444">관리자명</div></th>
														<th scope="col"><div data-langcode="FL561">아이디</div></th>
														<!-- <th scope="col"><div>회사</div></th> --> 
														<th scope="col"><div data-langcode="FA1399">부서</div></th>
														<th scope="col"><div data-langcode="H333">이메일</div></th>
														<th scope="col"><div data-langcode="H358">휴대폰번호</div></th>
														<th scope="col" class="add_exp"><div data-langcode="FA1449">관리자</div></th>
													</tr>
												</thead>
											</table>
											<!-- scroll -->
											<div class="scrollbox" style="max-height: 195px; border-bottom:1px solid #c5c6cb;">
												<table cellpadding="0" cellspacing="0">
													<caption></caption>
													<colgroup>
													<col style="width:17%;">
													<col style="width:27%;">
													<!--<col style="width:15%;"> -->
													<col style="width:15%;">
													<col style="">
													<col style="width:13%;">
													<col style="width:9%;" class="add_exp">
													</colgroup>
													<tbody id="mngr_tbody"><tr><td>안세영</td><td><span class="user_ids">ahncount@gmail.com</span></td><td></td><td>ahncount@gmail.com</td><td></td><td class="add_exp">&nbsp;<a class="out_bt tbold_uline">[해제]</a></td></tr></tbody>
												</table>
											</div>	
											<!-- //scroll -->
										</div>
										<!-- //리스트테이블 -->
									</td>
								</tr>	
								<!-- 
								<tr class="edit_text">
									<th  scope="row">활동요약</th>
									<td>참여자수 : 30 / 게시물 : 100 / 댓글 : 40 / 파일용량(MB) : 300 / 최근활동일 : 2018.05.04</td>
								</tr>
								<tr class="edit_text">
									<th  scope="row">생성정보</th>
									<td>2018.01.03 / 이학준 (desk383)</td>
								</tr>	
								 -->			
								<tr>
								    <th scope="row" data-langcode="CM1330">글 / 댓글 작성 권한</th>
									<td>
								        <div class="radiobox">
											<label class="on"><input checked="" type="radio" name="comprj_mngr_wr_yn" value="N" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" data-langcode="H197">전체</span></label>&nbsp;&nbsp;
											<label class="on"><input type="radio" name="comprj_mngr_wr_yn" value="Y" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" data-langcode="CM1332">관리자만 글/댓글 작성 가능</span></label>
										</div>
								    </td>
								</tr>
								<tr>
								    <th scope="row" data-langcode="CM1333">글 조회 권한</th>
									<td>
								        <div class="radiobox">
											<label class="on"><input checked="" type="radio" name="comprj_srch_auth_yn" value="N" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" data-langcode="H197">전체</span></label>&nbsp;&nbsp;
											<label class="on"><input type="radio" name="comprj_srch_auth_yn" value="Y" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" data-langcode="FA1455">관리자 + 글 작성 본인만 조회 가능</span></label>
											<span id="mngrAlert" style="color:red" data-langcode="FA1456">※ 프로젝트 생성 후 권한 변경 불가 </span>
										</div> 
								    </td>
								</tr>
								<tr>
								    <th scope="row" data-langcode="CM1338">파일 다운로드 권한</th>
									<td>
								        <div class="radiobox">
											<label class="on"><input checked="" type="radio" name="comprj_prj_auth" value="N" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" data-langcode="H197">전체</span></label>&nbsp;&nbsp;
											<label class="on"><input type="radio" name="comprj_prj_auth" value="Y" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" data-langcode="FA1459">관리자 + 글 작성 본인만 다운로드 가능  <span style="color: red">(*문서 및 이미지 조회도 차단됩니다)</span></span></label>
										</div>
								    </td>
								</tr>
							</tbody></table>
						</div>
						<!-- // -->
			
						<div class="t_center mgt15 btn_wrap">
							<div class="left"><a id="del_proj" style="cursor:pointer" class="btn btn_popstyle2 bgred" data-langcode="H381">삭제</a></div>
							<a id="save-or-edit" style="cursor:pointer" class="btn btn_popstyle1 bgblue" data-langcode="CT927">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a style="cursor:pointer" class="btn btn_popstyle1 pop_close" data-langcode="CD755">취소</a>
						</div>
					</div>
				</div>
				
				
				
				
				
				<!-- 관리자페이지 -->
				<div id="proj_mngr_layer" class="layer_popup_wrap" style="z-index: 1001; width: 570px; min-height: 180px; padding-bottom: 20px; margin-top: -300px; margin-left: -285px; display: none;">
					<div class="layer_popup_top">
					<h1 data-langcode="AA0107">관리자 선택</h1> 
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
										<select id="comm_user_catg">
											<option data-langcode="H331">이름</option>
											<option data-langcode="FL561">아이디</option>
										</select>
									</td>
									<td><input id="comm_user_srch_word" type="text" style=""></td>
									<td><a style="cursor:pointer" class="btn srchbtn_style" data-langcode="CPH1359">검색</a></td>
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
										<th scope="col"><div><span data-langcode="H331">이름</span><a data="TTL" style="cursor:pointer" class=""></a></div></th>
										<th scope="col"><div><span data-langcode="FL561">아이디</span><a data="SENDIENCE_CNT" style="cursor:pointer" class=""></a></div></th>
										<th scope="col"><div><span data-langcode="CLP1003">선택</span><a data="COMMT_CNT" style="cursor:pointer" class=""></a></div></th>
									</tr>
								</thead>
							</table>
							<!-- scroll -->
							<div id="mngr_scroll" class="scrollbox mCustomScrollbar _mCS_24 mCS-autoHide mCS_no_scrollbar" style="height:200px"><div id="mCSB_24" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 200px;" tabindex="0"><div id="mCSB_24_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
								<table cellpadding="0" cellspacing="0">
									<caption></caption>
									<colgroup>
									<col style="">
									<col style="">
									<col style="width:20%">
									</colgroup>
									<tbody id="comm_user_tbody"></tbody>
								</table>
							</div><div id="mCSB_24_scrollbar_vertical" class="mCSB_scrollTools mCSB_24_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_24_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
							<!-- //scroll -->
						</div>
						<!-- //리스트테이블 -->
					</div>		
					
					<div class="t_center mgt15 btn_wrap">
						<a style="cursor:pointer" class="btn btn_popstyle1 bgblue" data-langcode="H359">확인</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="cursor:pointer" class="btn btn_popstyle1 pop_close" data-langcode="CD755">취소</a>
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
$("#comm_proj_tbody > tr").click(function() {
	$(".add_exp").css("display", "table-cell");
	$(".bgmodal_wrap").css("display", "block");
	$("#mngrAdd").css("display", "inline-block");
	$("#del_proj").css("display", "block");
	$("#save-or-edit").text("수정");
})

$(".pop_close").click(function() {
	if($(".bgmodal").css("display") == "block") {
		$(".bgmodal").css("display", "none");
		$(".layer_popup_wrap").css("display", "none");	
	} else if($(".bgmodal_wrap").css("display") == "block") {
		$(".bgmodal_wrap").css("display", "none");
	}
});

$("#addProjBtn").click(function() { // 추가버튼 기능
	$(".add_exp").css("display", "none");
	$("#mngrAdd").css("display", "none");
	$(".bgmodal_wrap").css("display", "block");
	$("#del_proj").css("display", "none");
	$("#save-or-edit").text("저장");
});

$(".btn.btn_style1_s").click(function() {
	$(".layer_popup_wrap").css("display", "block");
	$(".bgmodal").css("display", "block");
});
</script>
</html>