<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/task.css" rel="stylesheet">
<script type="text/javascript">

	function new_plus() {
		document.getElementById('new_plus').style.display = (document.getElementById('new_plus').style.display == 'block') ? 'none'	: 'block';
	}
</script>

</head>
<body>
	<!-- 보관함 + 누르면 -->
	<input type="button" onclick="new_plus()">
		<div id="new_plus" style="display: none; z-index: 1001;">
			<div style="text-align: center; width: 340px; height: 180px; border: 1px solid pink; margin-top:200px; margin-left:auto; margin-right:auto; padding: 10px 10px 10px 10px;background-color: white;">
				<div style="text-align: center; margin: auto; padding-bottom: 10px; border-bottom: 1px solid #eaeaea; ">
					<span style="padding-left: 15px; font-size: 20px;">보관함 만들기</span> 
					<a href="#" style="float: right" onclick="new_plus()">X</a>
				</div>
				<div style="margin: auto; padding: 20px;">
					<input type="text" placeholder="보관함명 입력(최대50자)"	style="width: 90%; height: 30px;">
					<div style="padding-top: 15px">
						<input class="box_btn" type="button" value="취소" onclick="new_plus()"> 
						<input style="background-color: aqua;" class="box_btn" type="button" value="만들기">
					</div>
				</div>
		</div>
</div>

</body>
</html> --%>