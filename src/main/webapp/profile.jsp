<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/profile_css.css" />
</head>
<body>
	

	<div id="profilePopup" class="prdbx_wrap" style="top: 50%; left: 50%; width: 400px; padding-bottom: 20px; z-index: 9100; position: fixed; margin-top: -339.5px; margin-left: -200px; display: block;">
	<div class="prof_bx">
		<div class="prof_thumb">
			<span class="bg"></span> <a class="btn_close" id="inviteBoxClose" title="닫기"></a> <img id="PRFL_PHTG" src="https://flow.team/flowImg/FLOW_20200722826857_39de1aaa-f30e-494e-b525-fc6c3fa2219d.png" alt="" onerror="" style="object-fit: cover; height: 400px; width: 400px; background-image: url(&quot;https://flow.team/flowImg/FLOW_20200722826857_39de1aaa-f30e-494e-b525-fc6c3fa2219d.png&quot;); background-size: cover; background-repeat: no-repeat;">
		</div>
		<div class="prof_info">
			<div class="prof_top">
				<div style="font-weight: bold;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;width: 340px;margin:9px 0;">
					<span id="FLNM" style="color: black;font-size: 24px;">홍길동</span>
					<span id="JBCL_NM" style="font-size: 20px;color: #969696;margin-left: 10px;"></span>
				</div>
				<p id="CMNM" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;width: 340px;" ></p>
				<a id="EDIT" class="ico_mod" style="display: none;"></a>
			</div>
			<div class="prof_cn">
				<p id="EML" style="visibility: visible;">97dnjswhd@gmail.com</p>
				<p id="CLPH_NO" style="visibility: hidden;"></p>
				<p id="CMPN_TLPH_NO" style="visibility: hidden;"></p>
			</div>
			<div class="prof_btn" style="">
				<a id="CHAT" class="btn_prd_sty1_b"><span>채팅하기</span></a> 
				<a id="PROFILE_EDIT" class="btn_prd_sty1" style="display: none;">
					<span style="color: #28272c" >프로필 수정</span>
				</a>
			</div>
			<ul class="prof-menu" style="display:none">
				<li><button type="button" class="chat-btn" data-langcode="">채팅하기</button></li>			
				<li id="profileModifyBtn" style="display: none;"><button type="button" data-langcode="">프로필수정</button></li>		
			</ul>
		</div>
	</div>
</div>

</body>
</html>