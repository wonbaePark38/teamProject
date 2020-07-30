<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


<!-- Custom styles for this template -->
<link href="css/projectManagerPage.css" rel="stylesheet">
<script type="text/javascript" src="script/articleScript.js"></script>

<script src="vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="script/projectManagerPage.js"></script>   
</head>
<body>
    <body>


        <div class="wrap">
            <!-- Navigation -->
            
    
           
    
                <div class="sidebarContainer">
    
                    <div class="go-back-container">
                        <a id="go-back-bt">flow</a>
    
                    </div>
                    <!--사이드바-->
                    <div class="sidebar">
                        <strong class="title-text">회사</strong>
                        <div class="company-menu">
                            <a href="#" class="list-group-item" id="company-info">회사 정보</a>
                            <a href="#" class="list-group-item" id="user-manage">사용자 관리</a>
                            <a href="#" class="list-group-item" id="user-invite">사용자 초대</a>
                        </div> 
                        
                        <strong class="title-text">프로젝트</strong>
                        <div class="project-menu">
                            <a href="#" class="list-group-item" id="project-manage">프로젝트 관리</a>
                        
                            <a href="#" class="list-group-item" id="company-project-manage">회사 프로젝트 관리</a>
                            <a href="#" class="list-group-item" id="open-project-manage">공개 프로젝트 관리</a>
                            <a href="#" class="list-group-item" id="open-project-category">공개 프로젝트 카테고리</a>
                            
                        </div>
                        
                        <strong class="title-text">통계/리포트</strong>
                        <div class="report-menu">
                            <a href="#" class="list-group-item" id="connect-statistics">접속 통계</a>
                            <a href="#" class="list-group-item" id="use-statistics">사용 통계</a>
                        </div>
                        
                        <strong class="title-text">보안설정</strong>
                        <div class="security-menu">
                            <a href="#" class="list-group-item" id="download-contorl">파일 다운로드 제한</a>
                        </div>
                        <strong class="title-text">로그</strong>
                        <div class="log-menu">
                           <a href="#" class="list-group-item" id="download-history">파일 다운로드 이력</a>
                        </div>
                        
                        <strong class="title-text">결제</strong>
                        <div class="payment-menu">
                            <a href="#" class="list-group-item" id="payment-info">결제 정보</a>
                          
                        </div>
                        
                    </div>
                    
                    <div class="manager-helper-container">
                       <button id="helpMenuBt">
                        <span></span>관리자 도움말
                       </button>
                    </div>
                    
    
                </div> <!--// sidebarcontainer-->
                
                <div id="ajaxpagecontainer">
                
                </div>
                
         
                
        
                
    
    
    
    
    </div><!--mainWrap-->
    
       
</body>
</html>