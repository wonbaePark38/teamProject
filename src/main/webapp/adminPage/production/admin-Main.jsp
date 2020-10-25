<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    
  </head>
  <body class="nav-md">
    <div class="container body">
        <div class="main_container">

            <div class="col-md-3 left_col">
                <div class="left_col scroll-view" style="width: 100%;">
                
                <br>

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
                <!-- left_col scroll-view -->
            </div>
            <!-- col-md-3 left_col -->


            <!-- page content -->
            <div class="right_col" role="main">
                <div style="width: 100%;">
                    <div>
                      <span><h1><strong>관리자페이지</strong></h1></span>
                      <hr>
                    </div>
                </div>

                <div>
                    <table>
                    <tr>
                        <th style="width: 150px;">작성된 게시글 수</th>
                        <th style="width: 150px;">생성된 프로젝트</th>
                        <th style="width: 150px;">가입한 회원수</th>
                    </tr>
                    <tr>
                        <td style="width: 150px;">${ vo.getArticlecount() }</td>
                        <td style="width: 150px;">${ vo.getProcount() }</td>
                        <td style="width: 150px;">${ vo.getUsercount() }</td>
                    </tr>
                    </table>

                </div>


            </div>
            <!-- //page content -->
        </div>
        <!-- main container -->
    </div>
    <!-- //container body -->




	
  </body>
  <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- DateJS -->
  <script src="../vendors/DateJS/build/date.js"></script>
  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>
</html>