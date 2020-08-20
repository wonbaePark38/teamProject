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
</head>
<body>


	<div class="wrap">
		<jsp:include page="privateConfigHeader.jsp" flush="true" />

		<div class="centerArea">
			<jsp:include page="privateConfigSidebar.jsp" flush="true" />
			<div class="article">
				<header> 계정 정보 </header>
				<!--end header-->
				<div class="text-area">내 프로필</div>

				<div class="myprofile">

					<div class="photo-area-container">
						<div class="photo-area">
						  <img src="<c:url value='/img/${vo.profileFileName}' />" alt="상품이미지" />
							<!-- <img src="<spring:url value='/img/2.png'/>" /> -->
							<!-- <img src='/display.do?name=${vo.profileFileName}'/>-->
							<!--<img width="90" height="90" src="file/{{commentImages.0.fileId}}"> -->
							
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
		</div>
		<!-- centerArea -->





	</div>
	<!-- end wrap -->
</body>
</html>