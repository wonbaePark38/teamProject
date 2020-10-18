<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link rel="stylesheet" href="css/admin.css">
<script type="text/javascript" src="js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="script/invite.js"></script>
</head>
<body>
<jsp:include page="privateConfigHeader.jsp" flush="true" />
<script>
    	$('.headerWrap').css('width','100%');
		$('.headerWrap').css('border','0');
		$('#inputkeyword').css('display','none');
    </script>
	<div class="admin_contents">
	
	<jsp:include page="projectManagerPageSidebar.jsp" flush="true" />
		<div class="invite-div">
		
		<header class="invite-header">사용자 초대</header>
		<dl>
			
			<dt style="padding-top: 15px;">이메일 초대</dt>
			<dd class="invite_url">
				<p style="margin-bottom: 15px;">직원들의 이메일 주소를 입력하여 바로 초대할 수 있습니다.</p>
				<ul style="list-style: none;">
					<li><input class="send-mail-address" type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input class="send-mail-address" type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input class="send-mail-address" type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input class="send-mail-address" type="text" placeholder="example@flow.team" maxlength="100"></li>
					<li><input class="send-mail-address" type="text" placeholder="example@flow.team" maxlength="100"></li>
				</ul>
				<div class='status-div'>
					<button class="btn btn1 blue">발송</button>
					<div id="hidden-status">이메일 체크중입니다.</div>
				</div>
			</dd>
		</dl>
		</div>
	</div>

</body>
</html>