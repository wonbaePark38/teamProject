<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link href="css/connectManage.css" rel="stylesheet">
<script src="script/jquery-3.5.1-min.js"></script>
<script type="text/javascript" src="script/connectManage.js"></script>
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
						<strong>접속 PC 이름: <c:out value="${connectDevices[0]}"/></strong>
						<span class="last-use">로그인한 시간: <c:out value='${logHistoryArr[0]}'/>
						</span>
					</div>
					<div class="table-right">

						<label id="using-device" style="display: block;"> 
							<span>현재 접속 기기</span>
						</label>
					</div>

				</div>
				
				<div class="table-row">
					<div class="table-left">
						접속 PC 이름: <c:out value="${connectDevices[1]}"/>
						<span class="last-use">로그인한 시간: <c:out value='${logHistoryArr[1]}'/>
						</span>
					</div>
					<div class="table-right">

						<label id="using-device" style="display: block;">
								
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