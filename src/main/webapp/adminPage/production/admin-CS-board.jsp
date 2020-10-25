<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">

    <link href="css/maps/myCss.css" rel="stylesheet">
    <script src="../../script/jquery-3.5.1-min.js"></script>
    <script>
   	
     $(document).on('click','#reply',function(){
    	   
         // 답변글 입력 여부 확인
            // form 태그 생성
            var article_form = $('<form></form>');
            
            // form 설정  ( 태그 변수 , 설정값 )
            article_form.attr('method','post');
            article_form.attr('action','qnaReply.do');
            
            article_form.append($('<input/>', {type : 'hidden', name : 'seq', value : '${ board.seq }'}));
            article_form.append($('<input/>', {type : 'hidden', name : 'title', value : '${ board.title }'}));
            // 보낼 데이터
            var board_content_client = $('.client_reply').text(); // 클라이언트 요청글 div
            article_form.append($('<input/>', {type : 'hidden', name : 'content', value : board_content_client}));
            
            var board_content_admin = $('.admin_reply').text(); // 클라이언트 요청글 div
            article_form.append($('<input/>', {type : 'hidden', name : 'replycontent', value : board_content_admin}));
            
            article_form.append($('<input/>', {type : 'hidden', name : 'email', value : '${ board.email }'}));
            article_form.append($('<input/>', {type : 'hidden', name : 'reply', value : 'Y'}));
            
            // form 태그 위치
            article_form.appendTo('body');
            
            article_form.submit();

     });
    </script>

  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view" style="width: 100%;">
            
            <br />

            <!-- sidebar menu -->
            <a style="display: inline-block; width: 80px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;" onclick="changePass()">비밀번호변경</a>
	                <a style="display: inline-block; width: 60px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;" href="adminLogout.do">로그아웃</a>
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  
                  <li><a><i class="fa fa-edit"></i> 회원<span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="getUserManager.do">회원 관리</a></li>
	                      <li><a href="searchUser.do">회원 검색</a></li>
	                      <li><a href="getUserLog.do">회원 로그</a></li>
	                    </ul>
	                  </li>
	
	
	                  <li><a><i class="fa fa-desktop"></i> 프로젝트<span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="projectArticle.do">게시글</a></li>
	                      <li><a href="projectInfo.do">프로젝트</a></li>
	                    </ul>
	                  </li>
	                  
	                  <li><a><i class="fa fa-sitemap"></i> CS <span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="qnaBoardList.do">1:1 문의</a></li>
	                    </ul>
	                  </li>                  

                  
                  
                </ul>
              </div>

              

            </div>
            <!--  //side bar  -->
            
          </div>
        </div>

       

        <!-- page content -->
        <div class="right_col" role="main">
            <div style="width: 100%;">
                <div>
                  <span><h1><strong>고객 문의</strong></h1></span>
                  <hr>
                </div>

                <div id="admin_cs_article_contentArea">

                      <div>
                          <span id="admin_cs_article_contentArea_no">${ board.seq }</span>
                          <span id="admin_cs_article_contentArea_title">${ board.title }</span>
                          <span id="admin_cs_article_contentArea_writer">${ board.writer }</span>
                          <span id="admin_cs_article_contentArea_regDate">${ board.time }</span>
                      </div>

						<hr>

                      <div>
                          <div class="client_reply" id="admin_cs_article_contentArea_divText" contenteditable="false">${ board.content }</div>
                      </div>

                      <hr>
                      <hr>

                      <div>
                          <div class="admin_reply" id="admin_cs_article_contentArea_divText" contenteditable="true"></div>
                      </div>

                      <hr>
                      <div id="admin_cs_article_contentArea_lower_btn">
                        <a href="qnaBoardList.do">취소</a>
                        <a id="reply" >답변하기</a>
                      </div>

                </div>
            </div>
        </div>
        <!-- //page content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
	
  </body>
</html>
