<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<!-- Custom styles for this template -->
<link href="css/projectManagerPageSidebar.css" rel="stylesheet">
  
</head>
<body>
                <div class="sidebarContainer">
    
                    <div class="go-back-container">
                        <a id="go-back-bt">flow</a>
    
                    </div>
                    <!--사이드바-->
                    <div class="sidebar">
                        <strong class="title-text">회사</strong>
                        <div class="company-menu">
                            <a href="#"  id="company-info" onclick="projectPage('office_data.jsp')">회사 정보</a>
                            <a href="#" id="user-manage" onclick="projectPage('office_user_data.jsp')">사용자 관리</a>
                            <a href="#" id="user-invite" onclick="projectPage('invite.jsp')">사용자 초대</a>
                        </div> 
                        
                        <strong class="title-text">프로젝트</strong>
                        <div class="project-menu">
                            <a href="#" id="project-manage" onclick="projectPage('admin_project.jsp')">프로젝트 관리</a>
                        
                            <a href="#" id="company-project-manage" onclick="projectPage('admin_project2.jsp')">회사 프로젝트 관리</a>
                            <a href="#" id="open-project-manage" onclick="projectPage('admin_project3.jsp')">공개 프로젝트 관리</a>
                            <a href="#" id="open-project-category" onclick="projectPage('admin_project4.jsp')">공개 프로젝트 카테고리</a>
                            
                        </div>
                        
                        <strong class="title-text">통계/리포트</strong>
                        <div class="report-menu">
                            <a href="connectionStatistics.jsp" id="connect-statistics">접속 통계</a>
                            <a href="getUseStatisticsView.do" id="use-statistics" >사용 통계</a>
                        </div>
                        
                        <strong class="title-text">보안설정</strong>
                        <div class="security-menu">
                            <a href="downProhibitionView.do" id="download-contorl">파일 다운로드 제한</a>
                        </div>
                       
                    </div>
                    
             
    
                </div> <!--// sidebarcontainer-->
                
    
    
    
       
</body>

<script type="text/javascript" src="script/page_ajax.js"></script>
<script src="js/jquery-3.5.1-min.js"></script>	
<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="script/projectManagerPage.js"></script> 
</html>