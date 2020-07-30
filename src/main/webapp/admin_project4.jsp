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
		<span id="flow-open-proj-ctgr" class="left-menu" style="display: inline;">
			
			<!-- 대타이틀 -->
			<div class="titleh1_style">
				<div>
					<h1>공개 프로젝트 카테고리</h1>
				</div>
			</div>
			<!-- //대타이틀 -->
			
			<!-- btn both -->
			<div class="btn_both">
				<div class="left">
					<a id="open_catg_edit_bt" style="cursor:pointer" class="btn btn_style1 bgblue" >편집</a>
					<a id="open_catg_save_bt" style="cursor:pointer; display:none" class="btn btn_style1 bgblue" >저장</a>
					<a id="open_catg_cancel_bt" style="cursor:pointer; display:none" class="btn btn_style1" >취소</a>
				</div>
				<div class="right">
					<span style="vertical-align:middle;" >활성 상태</span>&nbsp;&nbsp;
					<label><input id="catg_active" type="checkbox" checked="">&nbsp;<span>활성</span></label>&nbsp;&nbsp;
					<label><input id="catg_inactive" type="checkbox">&nbsp;<span>비활성</span></label>
				</div>
			</div>
			
			<!-- 리스트테이블 -->
			<div class="list_table type2 mgb15">
				<table cellpadding="0" cellspacing="0">
					<caption></caption>
					<colgroup>
					<col style="width:5%;">
					<col style="width:30%;">
					<col style="width:12%;">
					<col style="width:12%;">
					<col style="width:12%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><div><a id="open_catg_add_bt" style="cursor:pointer; display:none" class="btn_style1">+ <span>추가</span></a></div></th>
							<th scope="col"><div>카테고리명</div></th>
							<th scope="col"><div>프로젝트수</div></th>
							<th scope="col"><div>활성상태</div></th>
							<th scope="col"><div></div></th>
						</tr>
					</thead>
					<tbody id="open_catg_tbody"><tr data="277006"><td class="drag_bt"><div class="btn_drag" style="display:none; cursor:pointer; margin-left:15px"></div></td><td class="catg_td">업무관련</td><td><span style="margin-left:15px">1</span></td><td class="use_yn">활성</td><td><span style="display:none; cursor:pointer; color:red; margin-left:15px; margin-right:15px" class="delete_bt btn btn_style1">삭제</span></td></tr><tr data="277007"><td class="drag_bt"><div class="btn_drag" style="display:none; cursor:pointer; margin-left:15px"></div></td><td class="catg_td">동호회</td><td><span style="margin-left:15px">0</span></td><td class="use_yn">활성</td><td><span style="display:none; cursor:pointer; color:red; margin-left:15px; margin-right:15px" class="delete_bt btn btn_style1">삭제</span></td></tr><tr data="277008"><td class="drag_bt"><div class="btn_drag" style="display:none; cursor:pointer; margin-left:15px"></div></td><td class="catg_td">정보공유</td><td><span style="margin-left:15px">0</span></td><td class="use_yn">활성</td><td><span style="display:none; cursor:pointer; color:red; margin-left:15px; margin-right:15px" class="delete_bt btn btn_style1">삭제</span></td></tr><tr data="277009"><td class="drag_bt"><div class="btn_drag" style="display:none; cursor:pointer; margin-left:15px"></div></td><td class="catg_td">학습</td><td><span style="margin-left:15px">0</span></td><td class="use_yn">활성</td><td><span style="display:none; cursor:pointer; color:red; margin-left:15px; margin-right:15px" class="delete_bt btn btn_style1">삭제</span></td></tr></tbody>
				</table>
			</div>
			<!-- //리스트테이블 -->
			</span>
		
	</div>

</body>
<script>

$("#open_catg_edit_bt").click(function() {
	
	$('.btn_both').find('.right').hide();
	
	$('.btn_drag').show();
	$('.delete_bt').show();			
	$('#open_catg_edit_bt').hide();			   //수정버튼
	$('#open_catg_save_bt').show();               //저장버튼
	$('#open_catg_add_bt').show();			   	   //추가버튼
	$('#open_catg_cancel_bt').show();			   //취소버튼

	
	
});


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