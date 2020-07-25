<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/task.css" rel="stylesheet">
<script type="text/javascript">
	function dimmed(){
	    document.getElementById('dimmed').style.display=(document.getElementById('dimmed').style.display=='block') ? 'none' : 'block';
	  }
</script>
</head>
<body>
	<div class="header" style="background-color: pink; width: 100%; margin: auto; z-index: 1;">
		<div style="float: right;">
			<input type="button" onclick="dimmed()">
			<div>
				<div id="dimmed" style="display: none; z-index: 2;"></div>
			</div>
			<div>
				
			</div>
		</div>
		<div style="text-align: center;">
			<span>사용자 이름</span>
		</div>
	</div>

	<div class="div_text_write" contenteditable="false"	style="background-color: aqua; height: 300px; border-top: 1px solid #eaeaea; z-index: 1;">
		<div class="you">
			<span style="float: left;"><img src="">사진</span>
			<div style="padding: 4px 97px 4px 59px;">
				<span>이름</span>
				<div>
					<span style="float: left;">메세지</span>
					<div class="메세지 옆에 버튼">
						&nbsp;<span>현재 시간</span>
						<a onclick="">...</a>
					</div>
				</div>
			</div>
			<!-- 메세지 입려시 출력됨 -->
		</div>
		<div class="me" style="padding: 4px 16px 4px 91px;">
			<div style="float: right;">
				&nbsp;<span>메세지</span>
			</div>
			<div style="text-align: right; float: right;">
				<a onclick="">...</a>
				<span>현재 시간</span>
			</div>
		</div>
		
	</div>
	<!-- 채팅내용 -->
	
	<div class="파일 이미지 이모티콘" style="border-top: 1px solid #eaeaea; border-bottom: 1px solid #eaeaea;">
		<input type="button" value="파일첨부">
		<input type="button" value="타이머">
	</div>
	<div class="div_text_write" contenteditable="true" placeholder="메세지를 입력하세요" style="height: 100px;"></div>
</body>
</html>