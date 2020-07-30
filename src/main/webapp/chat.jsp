<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/write_completion.css" rel="stylesheet">
<script type="text/javascript">
	function dimmed() {
		document.getElementById('dimmed').style.display = (document
				.getElementById('dimmed').style.display == 'block') ? 'none'
				: 'block';
	}
</script>
</head>
<body style="width: 380px; border: 1px solid black;">
	<div class="msg_page">
		<div class="header"
			style="background-color: pink; width: 100%; margin: auto; z-index: 1;">
			<div style="float: right;">
				<input type="button" onclick="dimmed()">
				<div>
					<div id="dimmed" style="display: none; z-index: 2;"></div>
				</div>
				<div></div>
			</div>
			<div style="text-align: center;">
				<span>사용자 이름</span>
			</div>
		</div>

		<div class="div_text_write" contenteditable="false"
			style="background-color: aqua; height: 300px; border-top: 1px solid #eaeaea; z-index: 1;">

			<div class="msg_user">

				<div class="photo" style="float: left; padding-left: 10px;">
					<img id="user_profile_msg">
				</div>
				<div class="msg_data">
					<strong style="display: inherit;">이름</strong>
					<pre style="float: left;">채팅 내용</pre>
				</div>
				<div style="float: left; padding-left: 3px; font-size: 10px;">am
					12:00</div>
				<!-- 연속 채팅 -->
				<div class="msg_data_if" style="display: flex;">
					<pre style="float: left;">채팅 내용<br>asdnfas<br>asdf</pre>
					<span
						style="float: left; padding-left: 3px; vertical-align: bottom;">am
						12:00</span>
				</div>

			</div>
			<div class="me" style="padding: 4px 16px 4px 91px;">
				<div style="float: right;">
					&nbsp;<span>메세지</span>
				</div>
				<div style="text-align: right; float: right;">
					<a onclick="">...</a> <span>현재 시간</span>
				</div>
			</div>


		</div>
		<!-- 채팅내용 -->

		<div class="파일 이미지 이모티콘"
			style="border-top: 1px solid #eaeaea; border-bottom: 1px solid #eaeaea;">
			<input type="button" value="파일첨부"> <input type="button"
				value="타이머">
		</div>
		<div class="div_text_write" contenteditable="true"
			placeholder="메세지를 입력하세요" style="height: 100px;"></div>
	</div>
</body>
</html>