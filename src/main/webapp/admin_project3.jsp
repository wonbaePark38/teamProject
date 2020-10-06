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
		<span id="flow-open-proj" class="left-menu" style="display: inline;">


			<!-- 대타이틀 -->
			<div class="titleh1_style">
				<div>
					<h1>공개 프로젝트 관리</h1>
				</div>
			</div>
			<!-- //대타이틀 -->
			
			<!-- 검색테이블 -->
			<div class="srch_table mgt10">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
						<col style="width: 350px;">
						<col style="width: 110px;">
						<col style="width: 310px;">
						<col>
					</colgroup>
					<tbody><tr>
						
					</tr><tr>
						<td colspan="4"><select style="width: 120px; cursor: pointer">
								<option>프로젝트명</option>
						</select> <input id="open_proj_srch_word" type="text" placeholder="프로젝트명" style="width: 490px;"></td>
						<td id="excel-open-prj-bt-where"><a id="srch-openprj-bt" style="cursor: pointer" class="btn srchbtn_style" >검색</a></td>
					</tr>
				</tbody></table>
			</div>
			<!-- //검색테이블 -->
			
		
			
			<!-- 리스트테이블 -->
			<div class="list_table mgt10 mgb15">
				<table cellpadding="0" cellspacing="0">
					<caption></caption>
					<colgroup>
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
							<th scope="col"><div>
									<span>카테고리명</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>프로젝트명</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>참여자수</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>게시물수</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>댓글수</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>최근활동일</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>생성일</span><a style="cursor: pointer" class=""></a>
								</div></th>
						</tr>
					</thead>
				</table>
				<!-- scroll -->
				<div id="open_scroll" class="scrollbox mCustomScrollbar _mCS_26 mCS-autoHide mCS_no_scrollbar" style="height: 600px"><div id="mCSB_26" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_26_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
					<table id="open_table" cellpadding="0" cellspacing="0">
						<caption></caption>
						<thead style="display:none;">
						<tr>
							<th scope="col"><div>
									<span>카테고리명</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>프로젝트명</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>참여자수</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>게시물수</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>댓글수</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>최근활동일</span><a style="cursor: pointer" class=""></a>
								</div></th>
							<th scope="col"><div>
									<span>생성일</span><a style="cursor: pointer" class=""></a>
								</div></th>
						</tr>
					</thead>
						<colgroup>
							<col style="">
							<col style="">
							<col style="">
							<col style="">
							<col style="">
							<col style="">
							<col style="">
						</colgroup>
						<tbody id="open_proj_tbody"><tr style="background-color: rgb(255, 255, 255); cursor: pointer;"><td>업무관련</td><td style="">123123</td><td>1</td><td>0</td><td>0</td><td>2020.07.29 22:12</td><td>2020.07.29 22:12</td></tr></tbody>
					</table>
				</div><div id="mCSB_26_scrollbar_vertical" class="mCSB_scrollTools mCSB_26_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_26_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
				<!-- //scroll -->
			</div>
			<!-- //리스트테이블 -->
			
			
			
			<div id="projEditPopUp" class="bgmodal_wrap" style="position: fixed; top: 50%; left: 50%; margin-top: -469.5px; margin-left: -739.5px; display: none;">
			
				<div class="lyaer_popup_wrap" style="width:900px;margin-top:-370px;margin-left:-450px;">
					<div class="lyaer_popup_top">
						<h1><span>공개 프로젝트 정보</span><input style="cursor:pointer" type="button" class="pop_close" title="닫기"></h1>
					</div>
					<div class="lyaer_popup_cont">
						<div class="srch_table mgt10">
							<table cellpadding="0" cellspacing="0" class="htlowtype">
								<colgroup>
								<col style="width:150px;"><col>
								</colgroup>
			
								
								 
								<tbody><tr>
									<th scope="row">카테고리</th>
									<td>
										<select id="openProjectCategory">
										<option value="0" selected="selected" data="277006">업무관련</option><option value="1" data="277007">동호회</option><option value="2" data="277008">정보공유</option><option value="3" data="277009">학습</option></select>				
									</td>
								</tr>
								
								<tr>
									<th scope="row">프로젝트명</th>
									<td><input name="open_proj_name" type="text" placeholder="프로젝트명을 입력하세요" style="width:98.5%;" maxlength="100" ></td>
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
														<th scope="col"><div>관리자명</div></th>
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
													<tbody id="mngr_tbody"></tbody>
												</table>
											</div>
											<!-- //scroll -->
										</div>
										<!-- //리스트테이블 -->
									</td>
								</tr>	
						
								<tr>
								    <th scope="row" >글 / 댓글 작성 권한</th>
									<td>
								        <div class="radiobox">
											<label class="on"><input checked="" type="radio" name="mngr_wr_yn" value="N" style="cursor: pointer;">&nbsp;<span style="cursor:pointer">전체</span></label>&nbsp;&nbsp;
											<label class="on"><input type="radio" name="mngr_wr_yn" value="Y" style="cursor: pointer;">&nbsp;<span style="cursor:pointer">관리자만 글/댓글 작성 가능</span></label>
										</div>
								    </td>
								</tr>
								<tr>
								    <th scope="row" >글 조회 권한</th>
									<td>
								        <div class="radiobox">
											<label class="on"><input disabled="true" checked="" type="radio" name="srch_auth_yn" value="N" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" >전체</span></label>&nbsp;&nbsp;
											<label class="on"><input type="radio" name="srch_auth_yn" value="Y" disabled="disabled" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" >관리자 + 글 작성 본인만 조회 가능</span></label>
											<span id="mngrAlert" style="color:red" >※ 프로젝트 생성 후 권한 변경 불가 </span>
										</div> 
								    </td>
								</tr>
								<tr>
								    <th scope="row" >파일 다운로드 권한</th>
									<td>
								        <div class="radiobox">
											<label class="on"><input checked="" type="radio" name="prj_auth" value="N" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" >전체</span></label>&nbsp;&nbsp;
											<label class="on"><input type="radio" name="prj_auth" value="Y" style="cursor: pointer;">&nbsp;<span style="cursor:pointer" >관리자 + 글 작성 본인만 다운로드 가능  <span style="color: red">(*문서 및 이미지 조회도 차단됩니다)</span></span></label>
										</div>
								    </td>
								</tr>
							</tbody></table>
						</div>
						<!-- // -->
			
						<div class="t_center mgt15 btn_wrap">
							<div class="left"><a id="del_open_proj" style="cursor:pointer" class="btn btn_popstyle2 bgred" >삭제</a></div>
							<a id="projEditSubmit" style="cursor:pointer" class="btn btn_popstyle1 bgblue" >수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a style="cursor:pointer" class="btn btn_popstyle1 pop_close" >취소</a>
						</div>
					</div>
				</div>
			</div>
			
			
			</span>
		
	</div>

</body>
<script>


$("#mCSB_13_container > table > tbody > tr").click(function() {
	$(".bgmodal_wrap").css("display", "block");
});
$("#open_proj_tbody > tr").click(function() {
	$(".bgmodal_wrap").css("display", "block");
});


$("#comm_proj_tbody > tr").click(function() {
	$(".add_exp").css("display", "table-cell");
	$(".bgmodal_wrap").css("display", "block");
	$("#mngrAdd").css("display", "inline-block");
	$("#del_proj").css("display", "block");
	$("#save-or-edit").text("수정");
});

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