<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plug</title>
<!-- Custom styles for this template -->
<link href="css/projectManagerPageSidebar.css" rel="stylesheet">
<script src="js/jquery-3.5.1-min.js"></script>	
<script src="vendor/jquery/jquery.min.js"></script>  
</head>
<body>
                <div class="sidebarContainer">
    
                    <div class="go-back-container">
                        <a id="go-back-bt">Plug</a>
    
                    </div>
                    <!--사이드바-->
                    <div class="sidebar">
                    
                    <strong class="title-text">프로젝트</strong>
                        <div class="project-menu">
                            <a href="projectManage.do" id="project-manage" >프로젝트 관리</a>
                        </div>
                        
                        <strong class="title-text">회사</strong>
                        <div class="company-menu">
                            <a href="sendInvteMailView.do" id="user-invite" >사용자 초대</a>
                        </div> 
                        
                        
                        
                        <strong class="title-text">통계/리포트</strong>
                        <div class="report-menu">
                            <a href="getConnectionStatisticsView.do" id="connect-statistics">접속 통계</a>
                            <a href="getUseStatisticsView.do" id="use-statistics" >사용 통계</a>
                        </div>
                        
                        <strong class="title-text">보안설정</strong>
                        <div class="security-menu">
                            <a href="downProhibitionView.do" id="download-contorl">파일 다운로드 제한</a>
                        </div>
                       
                    </div>
                    
             
    
                </div> <!--// sidebarcontainer-->
                
    
    
    
       
</body>

</html>