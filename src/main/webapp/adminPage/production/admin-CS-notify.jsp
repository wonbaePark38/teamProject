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
                  <span><h1><strong>신고</strong></h1></span>
                  <hr>
                </div>
              </div>
          
            <div style="height: 500px;">
                

                <div style="margin-bottom: 20px;">
                  <span style="font-size: 15px;"><strong>신고된 게시글</strong></span>
                </div>
              
                <div style="width: 1000px;">
                  <table>
                    <tr>
                        <th style="width: 150px; text-align: center;">게시글번호</th>
                        <th style="width: 150px; text-align: center;">작성자</th>
                        <th style="width: 350px; text-align: center;">제목</th>
                        <th style="width: 100px; text-align: center;">작성일</th>
                    </tr>
                    <!-- forEach -->
                    <tr>
                        <td style="width: 150px; text-align: center;"><a>123456789</a></td>
                        <td style="width: 150px; text-align: center;"><a>홍길동임</a></td>
                        <td style="width: 350px; text-align: center;"><a>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ</a></td>
                        <td style="width: 100px; text-align: center;"><a>2020/02/02</a></td>
                    </tr>
                    <!-- //forEach -->
                  </table>
                </div>
              
                <div style="text-align: right;">
                    <form>
                        <select style="display: inline-block; vertical-align: middle; height: 25px;">
                            <option>글번호</option>
                            <option>작성자</option>
                            <option>글제목</option>
                        </select>
                        <input type="text" style="display: inline-block; vertical-align: middle; width: 100px;">
                        <button style="display: inline-block; border-style: none; height: 25px;">검색</button>
                    </form>
                </div>
              
            </div>
              
            
            <div style="height: 500px;">
                

                <div style="margin-bottom: 20px;">
                  <span style="font-size: 15px;"><strong>신고된 프로젝트</strong></span>
                </div>
              
                <div style="width: 1000px;">
                  <table>
                    <tr>
                        <th style="width: 150px; text-align: center;">프로젝트 번호</th>
                        <th style="width: 150px; text-align: center;">프로젝트명</th>
                        <th style="width: 350px; text-align: center;">생성자</th>
                      <th style="width: 100px; text-align: center;">생성일</th>
                    </tr>
                    <!-- forEach -->
                    <tr>
                        <td style="width: 150px; text-align: center;"><a>123456789</a></td>
                        <td style="width: 150px; text-align: center;"><a>테스트용프로젝트</a></td>
                        <td style="width: 350px; text-align: center;"><a>홍길동</a></td>
                        <td style="width: 100px; text-align: center;"><a>2020/02/02</a></td>
                    </tr>
                    <!-- //forEach -->
                  </table>
                </div>
              
                <div style="text-align: right;">
                    <form>
                        <select style="display: inline-block; vertical-align: middle; height: 25px;">
                            <option>프로젝트번호</option>
                            <option>생성자</option>
                            <option>프로젝트명</option>
                        </select>
                        <input type="text" style="display: inline-block; vertical-align: middle; width: 100px;">
                        <button style="display: inline-block; border-style: none; height: 25px;">검색</button>
                    </form>
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
