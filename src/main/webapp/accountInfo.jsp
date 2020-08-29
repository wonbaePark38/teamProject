<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>계정정보</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정 정보</title>
    <link href='css/accountInfo.css' rel='stylesheet' />
    <script src="vendor/jquery/jquery.min.js"></script>
   <script type="text/javascript" src="script/accountInfo.js"></script>
    <script type="text/javascript" src="script/configScript.js"></script>

    
</head>
   
   
<body>
	
	<jsp:include page="privateConfigSidebar.jsp" flush="true" />
	<c:if test="${user.lockSwitchStatus eq 'on'}">
		<jsp:include page="lock.jsp" flush="true" />
		<input type="hidden" name="user" id="session" value='${user.lockTime}'/>
	</c:if>
	
	<div class="wrap">
	
		<div class="centerArea">
			
			
			<div class="article">
				<header> 계정 정보 </header>
				<!--end header-->
				<div class="text-area">내 프로필</div>

				<div class="myprofile">

					<div class="photo-area-container">
						<div class="photo-area">
							<c:choose>
								<c:when test="${empty vo.profileFileName}">
									<img src="images/empty_photo.png" />
								</c:when>
								<c:otherwise>
									<img src="<c:url value='/display.do?name=${vo.profileFileName }'/>" alt="상품이미지" /> 
								</c:otherwise>
							</c:choose>
							
						</div>
						<form action="profileImgChange.do" method="POST" enctype="multipart/form-data"> 
						
							<a id="change-photo"> <span class="blind">사진편집</span>
								<input type="file" name="profileImg" class="profile-photo-upload" accept="image/*">
							</a>
							<input type="submit" id="uploadBt" value="적용"/>
						</form>
						
					</div>

					<div class="info-container">
						<ul class="private-info">
							<li>
								<div>
									<label> 이름 </label> <strong class="ft_bold" id="user-name">${vo.name}</strong>
								</div>

							</li>

							<li>
								<div>
									<label> 이메일 </label> <strong class="ft_bold" id="user-email">${vo.email }</strong>
								</div>

							</li>

							<li>
								<div>
									<label> 휴대폰번호 </label> <strong class="ft_bold"
										id="user-phone-number">${vo.phoneNumber }</strong>
								</div>

							</li>



						</ul>
						<!--end private-info-->



						<ul class="company-info">
							<li>
								<div>
									<label> 회사명 </label> <strong class="ft_bold" id="user-name">${vo.companyName }</strong>
								</div>

							</li>

							<li>
								<div>
									<label> 부서명 </label> <strong class="ft_bold" id="user-email">${vo.department }</strong>
								</div>

							</li>

							<li>
								<div>
									<label> 직책 </label> <strong class="ft_bold"
										id="user-phone-number">${vo.myPosition }</strong>
								</div>

							</li>

							<li>
								<div>
									<label> 회사연락처 </label> <strong class="ft_bold"
										id="user-phone-number">${vo.companyCallNumber }</strong>
								</div>

							</li>
						</ul>
						<!--end company-info-->


					</div>
					<!--info-container-->
				</div>
				<!--end myprofile-->
			</div>
			<!-- <input type = "text" id="msg">
				<input type ="button" id="btnSend" value="전송버튼"/>
				 -->
		</div>
		<!-- centerArea -->
		
	</div>
	<!-- end wrap -->
</body>

</html>