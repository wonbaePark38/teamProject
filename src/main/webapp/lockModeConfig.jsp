<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="css/lockModeConfig.css" rel="stylesheet">
<script src="script/jquery-3.5.1-min.js"></script>
<script type="text/javascript" src="script/lockModeConfig.js"></script>
</head>
<body>
	<c:if test="${setting.lockSwitchStatus eq 'on'}">
	
		<input type="hidden" name="user" id="session" value='${setting.lockSwitchStatus}'/>
		
	</c:if>
	<jsp:include page="privateConfigSidebar.jsp" flush="true" />
	<div class="wrap">
		
		
		<div class="centerArea">
			
			<div class="article">

				<header>
					<strong>잠금모드</strong>
				</header>
				<form action="lockSetting.do" method="POST">
				<div class="lock-switch-div">
					<strong> 잠금모드 설정 </strong>
					<div class="lock-switch123">
						<label class="lock-switch">
							<input type="checkbox" id="lock" name="lockSwitchStatus"> <span class="slider round"></span>
						</label>
					</div>
				</div>
				
				<h5>해당 시간만큼 사용하지 않으면 잠금처리됩니다.</h5>
				<br>
				
					<select name="lockTime" class="lock-select" disabled="disabled">
						<option value="1">1분</option>
						<option value="5">5분</option>
						<option value="10">10분</option>
						<option value="30">30분</option>
						<option value="60">1시간</option>
						<option value="120">2시간</option>
						<option value="180">3시간</option>
						<option value="240">4시간</option>
						<option value="300">5시간</option>
						<option value="360">6시간</option>
					</select>
					<input type="submit" id="change-lock-settingBt" value="적용"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>