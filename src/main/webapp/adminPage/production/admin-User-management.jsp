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

    <title>user management</title>

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
            
            <br />

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
        </div>

       

        <!-- page content -->
        <div class="right_col" role="main">
          <div style="width: 100%;">
            <div>
              <span><h1><strong>회원 관리</strong></h1></span>
              <hr>
            </div>
          </div>

          <div id="admin_user_management_content">
            <div id="admin_user_management_content_info" style="margin-bottom: 20px;">
              <table>
                <tr>
                  <th>오늘 가입한 회원수</th>
                  <th>어제 가입한 회원수</th>
                  <th>총 회원 수</th>
                </tr>
                <tr>
                  <td>1</td>
                  <td>2</td>
                  <td>3</td>
                </tr>
              </table>
            </div>

            <!-- 탈퇴한 회원 -->
            <div>
              <div>
                <span>회원탈퇴</span>
              </div>
              <div id="admin_user_management_content_statics1"></div>
            </div>
            <!-- //탈퇴한 회원 -->

            <hr>

            <!-- 회원 분포, 성비 -->
            <div>
              
              <div style="display: inline-block;">
                <div>
                  <span>연령대별 사용자</span>
                </div>
                <!-- 연령대별 사용자수 -->
                <div id="admin_user_management_content_statics2"></div>
              </div>

              <div style="display: inline-block;">
                <div>
                  <span>사용자 성비</span>
                </div>
                <!-- 연령대별 사용자수 -->
                <div id="admin_user_management_content_statics3"></div>
              </div>
              
            </div>
            <!-- //회원 분포, 성비 -->

            <hr>

            <!-- 접속시간 -->
            <div>

              <div style="display: inline-block;">
                <div>
                  <span>시간대별 접속자수</span>
                </div>
                <div id="admin_user_management_content_statics4"></div>
              </div>
              
              <div style="display: inline-block;">
                <div>
                  <span>평균 접속시간</span>
                </div>
                <div id="admin_user_management_content_statics5"></div>
              </div>

            </div>
            <!-- //접속시간 -->

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
