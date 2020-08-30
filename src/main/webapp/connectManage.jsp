<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접속 기기 관리 페이지</title>
<link href="css/connectManage.css" rel="stylesheet">
<script type="text/javascript" src="script/configScript.js"></script>
</head>
<body>


	<div class="wrap">
	<jsp:include page="privateConfigHeader.jsp" flush="true" />
		<div class="centerArea">
			<jsp:include page="privateConfigSidebar.jsp" flush="true" />
			<div class="article">
				<header> 접속 기기 관리 </header>


				<!-- for문 들어올 자리-->
				<div class="table-row">
					<div class="table-left">
						<strong>접속 PC 이름: ${vo.connectDevice}</strong>
						<span class="last-use">로그인한 시간: ${vo.loginDate }
						</span>
						<%--<span class="first-use">최초 등록: ~~~~
						</span>
						 --%>
					</div>
					<div class="table-right">
						<button type="button" id="not-using-device"
							onclick="removeDevice()" style="display: none;">
							<span>제거</span>
						</button>


						<label id="using-device" style="display: block;"> <span>접속
								기기</span>
						</label>
					</div>

				</div>

				<!--end for문 -->
			</div>
			<!-- end article -->
		</div>
		<!-- end centerArea -->
	</div>
</body>
</html>