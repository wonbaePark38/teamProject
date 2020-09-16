<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>푸쉬 알림 설정</title>
<script src="script/jquery-3.5.1-min.js"></script>
<link href="css/pushAlramSetting.css" rel="stylesheet">
<script type="text/javascript" src="script/pushAlramSetting.js"></script>

</head>

<body>
	<div class="wrap">
		<jsp:include page="privateConfigHeader.jsp" flush="true" />
		<div class="centerArea">
			<jsp:include page="privateConfigSidebar.jsp" flush="true" />
			<div class="article">
				<header> 푸쉬 알림 설정 </header>

				<div class="alram-switch-div">
					<strong> 알림 </strong>
					<div class="alram-switch">
			
						<label class="switch1">
						<c:choose>
							<c:when test="${user.pushAlram eq 'on'}">
							 	<input type="checkbox" id="controll-alram" checked="checked">
					  		</c:when>
							<c:otherwise>
						 		<input type="checkbox" id="controll-alram">
							</c:otherwise>			
						</c:choose>
						 	
							
							<span class="slider1 round"></span>
						</label>

					</div>
				</div>

				<div>채팅 알림을 실시간으로 알려드립니다.</div>

				<div class="alram-type">
					<div>
					

					<div class="chatting-alram">
						<c:choose>
							<c:when test="${user.chatAlram eq 'true'}">
								<input type="checkbox" id="chat-check" class="checkbox-style two" checked="checked"> 
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="chat-check" class="checkbox-style two">
							</c:otherwise>
						</c:choose>
						<span style="margin-left: 10px;">채팅 알림</span>
					</div>
					
					</div>
					<div>
						<button type="button" id='push-confirm'>적용하기</button> 
					</div>
				</div>
				<div id="hidden-status">
					변경되었습니다
				</div>
			</div> <!-- end article -->
		</div><!-- centerarea -->
		
	</div><!-- wrap -->
	
</body>

</html>