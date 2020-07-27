<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/listall_css.css">

</head>
<body>

	<div id="all-sendience-layer" style="z-index: 1000; background-color: rgba(0, 0, 0, 0.4); position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px; display: block;" data="profilePopup-off">
	<div class="layerstyle4 center-popup _postCopy_wrap" style="width:556px;">
		<div class="layerstyle4_po">
			<div class="layerstyle4_title">
				<h3>
					<span class="icon_url"></span>&nbsp;<span data-langcode="CLP1175">프로젝트 참여자</span></h3>
				<a id="all-sendience-layer-close-btn" class="btn_layerstyle4_close">
					<img src="images/btn_layerstyle4_close.png?" alt="닫기">
				</a>
			</div>
			<div class="layerstyle4_cont">
				<!-- [D] 20190220 검색영역 추가 -->
				<div class="user_search_wrap">
					<span id="all-sendience-layer-srch" class="srchico"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span><input type="text" placeholder="참여자명으로 검색" maxlength="30" class="ui-autocomplete-input" autocomplete="off"><button type="button" title="삭제" style="display: none;"></button></span>
				</div>
				<!-- //[D] 20190220 검색영역 추가 -->
				
				<!-- scroll 영역 -->		
				<div class="postCopy_scroll" style="padding:0 0 20px 0; min-height: 500px; max-height: 500px;">
					<p style="padding-top:160px; padding-right:20px; text-align:center; display: none;"><strong style="font-size:16px;color:#58585c;" >검색 결과가 존재하지 않습니다.</strong></p>
					<!-- 20160621 수정 -->
					<div id="all-sendience-scroll-layer" class="mCustomScrollbar _mCS_12 mCS-autoHide mCS_no_scrollbar" style="position:relative; height:500px;overflow-y:auto;"><div id="mCSB_12" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_12_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
						<div style="display: block;"><!-- [D] 20190220 수정 : class 삭제 / style 삭제 -->
							<!-- <h4 class="aplct_title" data-langcode="CLP1175">프로젝트 참여자</h4> -->
							<!-- 20160621 수정 -->
							<ul id="all-sendience-list" class="aplct_libx profile-list"><li class="all-sendience-li">
			<img style="cursor: pointer; background-image: url(images/thumb26.gif); background-size: cover; background-repeat: no-repeat;" id="prfl-phtg" src="images/thumb26.gif" onerror="" alt="" class="mCS_img_loaded">
			<div class="profile-info">
				<span style="cursor: pointer;" id="user-nm" class="name" >안세영 (나)</span>
				<span style="cursor: pointer;" id="" class="rank" ></span>
				<div class="job" style="display: block;"></div>
			</div>
			<div class="project-admin">
				<div id="manager-yn" style="display: block;" class="admin">
					<span >관리자</span>
				</div>
			</div>
			<div class="btn_right" id="more">
		<a id="sendience-more" class="btn set">
			<span class="blind" >설정</span>
		</a>
		<div id="sendience-more-layer" class="layerstyle1 type4 sendience-all-more" style="z-index:500; display: none; top: 60px; right: -16px;">
			<div class="layerstyle1_po">
				<span class="tail" style="right:20px;"></span>
				<ul class="icon_set_list">
					<li>
						<a id="sendience-out" >나가기</a>
					</li>
					<li>
						<a id="toggle-set-manager" >관리자 지정 해제</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</li><li class="all-sendience-li">
			<img style="cursor: pointer; background-image: url(&quot;https://flow.team/flowImg/FLOW_20200722826857_39de1aaa-f30e-494e-b525-fc6c3fa2219d.png&quot;); background-size: cover; background-repeat: no-repeat;" id="prfl-phtg" src="https://flow.team/flowImg/FLOW_20200722826857_39de1aaa-f30e-494e-b525-fc6c3fa2219d.png" onerror="" alt="" class="mCS_img_loaded">
			<div class="profile-info">
				<span style="cursor: pointer;" id="user-nm" class="name">홍길동</span>
				<span style="cursor: pointer;" id="" class="rank" ></span>
				<div class="job" style="display: block;"></div>
			</div>
			<div class="project-admin">
				<div id="manager-yn" style="display:none;" class="admin">
					<span >관리자</span>
				</div>
			</div>
			<div class="btn_right" id="more">
		<a id="sendience-more" class="btn set">
			<span class="blind" >설정</span>
		</a>
		<div id="sendience-more-layer" class="layerstyle1 type4 sendience-all-more" style="z-index:500; display: none; top: 60px; right: -16px;">
			<div class="layerstyle1_po">
				<span class="tail" style="right:20px;"></span>
				<ul class="icon_set_list">
					<li>
						<a id="sendience-out" >내보내기</a>
					</li>
					<li>
						<a id="toggle-set-manager" >관리자 지정</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</li></ul>
							<!-- <ul id="all-sendience-list" class="aplct_libx">
							</ul> -->
							<div id="inviting-div" style="display:none;">
								<h4 class="aplct_title" >초대중 참여자</h4>
								<ul id="all-sendience-inviting-list" class="aplct_libx">
								</ul>
							</div>
						</div>
					</div><div id="mCSB_12_scrollbar_vertical" class="mCSB_scrollTools mCSB_12_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_12_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
				</div>
				<div id="more-layer-list">
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>