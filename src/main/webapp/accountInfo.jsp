<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Plug</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정 정보</title>
    <link href='css/accountInfo.css' rel='stylesheet' />
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="script/accountInfo.js"></script>

    
</head>
   
   
<body style="background-color: #eaeaea;">
	
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
							<c:choose>
								<c:when test="${empty vo.profileFileName}">
									<img src="images/empty_photo.png" />
								</c:when>
								<c:otherwise>
									<img src="<c:url value='/display.do'/>" alt="프로필이미지" /> 
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
					<div id="hidden-status">
							변경되었습니다
					</div>
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
									<label> 휴대폰번호 </label> 
									<div class="edit-div">
										
										<input type="text" id="user-phone-number" readonly value="${vo.phoneNumber}">
										<a class="edit">
											<img src="images/ico_email_edit_over.png" style="vertical-align: middle;">
										</a>
									
										
									</div>
									
									
								</div>

							</li>



						</ul>
						<!--end private-info-->



						<ul class="company-info">
							<li>
								<div>
									<label> 회사명 </label> 
									<div class="edit-div">
										
										<input type="text" id="company-name" readonly value="${vo.companyName}">
										<a class="edit">
											<img src="images/ico_email_edit_over.png" style="vertical-align: middle;">
										</a>
									</div>
								</div>

							</li>

							<li>
								<div>
									<label> 부서명 </label>
									<div class="edit-div">
										
										<input type="text" id="department" readonly value="${vo.department}">
										<a class="edit">
											<img src="images/ico_email_edit_over.png" style="vertical-align: middle;">
										</a>
									</div>
								</div>

							</li>

							<li>
								<div>
									<label> 직책 </label> 
									
									<div class="edit-div">
										
										<input type="text" id="position" readonly value="${vo.myPosition}">
										<a class="edit">
											<img src="images/ico_email_edit_over.png" style="vertical-align: middle;">
										</a>
									</div>
								</div>

							</li>

							<li>
								<div>
									<label> 회사연락처 </label> 
									
									<div class="edit-div">
										
										<input type="text" id="company-call-number" readonly value="${vo.companyCallNumber }">
										<a class="edit">
											<img src="images/ico_email_edit_over.png" style="vertical-align: middle;">
										</a>
									</div>
									
								</div>

							</li>
							<li>
								<div id="confirm">
									<button type="button" id="info-confirm">적용하기</button>
									<button type="button" id="info-cancle">취소하기</button>
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