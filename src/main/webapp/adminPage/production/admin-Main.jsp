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
	            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	              <div class="menu_section">
	                <a style="display: inline-block; width: 60px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;">로그아웃</a>
	                <ul class="nav side-menu">
	                  
	                  <li><a><i class="fa fa-edit"></i> 회원<span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="admin-User-management.jsp">회원 관리</a></li>
	                      <li><a href="admin-User-searchUser.jsp">회원 검색</a></li>
	                      <li><a href="admin-User-log.jsp">회원 로그</a></li>
	                    </ul>
	                  </li>
	
	
	                  <li><a><i class="fa fa-desktop"></i> 프로젝트<span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="admin-Project-article.jsp">게시글</a></li>
	                      <li><a href="admin-Project-project.jsp">프로젝트</a></li>
	                    </ul>
	                  </li>
	
	                  <li><a><i class="fa fa-bar-chart-o"></i> 매출 <span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="admin-Sales-sales.jsp">매출</a></li>
	                      <li><a href="admin-Sales-saleLog.jsp">결제내역</a></li>
	                    </ul>
	                  </li>
	
	                  
	
	                  <li><a><i class="fa fa-sitemap"></i> CS <span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="admin-CS-FAQ.jsp">FAQ 관리</a></li>
	                      <li><a href="admin-CS-QA.jsp">1:1 문의</a></li>
	                      <li><a href="admin-CS-notify.jsp">신고접수</a></li>
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
                        <td style="width: 150px;">1</td>
                        <td style="width: 150px;">2</td>
                        <td style="width: 150px;">3</td>
                    </tr>
                    </table>

                    <table style="margin-top: 20px;">
                        <tr>
                            <th style="width: 150px;">신고된 게시글 수</th>
                            <th style="width: 150px;">신고된 프로젝트수</th>
                            <th style="width: 150px;">탈퇴한 회원수</th>
                        </tr>
                        <tr>
                            <td style="width: 150px;">4</td>
                            <td style="width: 150px;">5</td>
                            <td style="width: 150px;">6</td>
                        </tr>
                        </table>
                </div>

                <div style="margin-top: 20px; width: 1150px;">

                    <div style="display: inline-block;">
                        <div>
                            <span>회원 유형 비율</span>
                        </div>
                        <div style="display: inline-block; width: 350px; height: 350px; background: cadetblue;"></div>
                    </div>

                    <div style="display: inline-block;">
                        <div>
                            <span>회원 성비</span>
                        </div>
                        <div style="display: inline-block; width: 350px; height: 350px; background: cadetblue;"></div>
                    </div>

                    <div style="display: inline-block;">
                        <div>
                            <span>프로젝트 카테고리 비율</span>
                        </div>
                        <div style="display: inline-block; width: 350px; height: 350px; background: cadetblue;"></div>
                    </div>

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
  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>
</html>