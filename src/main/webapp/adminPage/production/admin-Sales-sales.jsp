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
            <a style="display: inline-block; width: 80px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;" onclick="changePass()">비밀번호변경</a>
	                <a style="display: inline-block; width: 60px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;" href="adminLogout.do">로그아웃</a>
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
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
                      <li><a href="qnaBoardList.do">1:1 문의</a></li>
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
          <div id="admin_sale_sales_content">

            <div style="width: 100%;">
              <div>
                <span><h1><strong>매출</strong></h1></span>
                <hr>
              </div>
            </div>

            <div id="admin_sale_sales_content_info">
              <table>
                <tr>
                  <th>오늘 결제 건</th>
                  <th>이번달 결제 건</th>
                  <th>이번달 환불 건</th>
                </tr>
                <tr>
                  <td>1</td>
                  <td>2</td>
                  <td>0</td>
                </tr>
              </table>
            </div>

            <hr>

            <!-- 기간별 매출 조회 -->
            <div>
              <div>
                <span>매출 조회</span>
              </div>

              <div id="admin_sale_sales_content_datepick">
                <select>
                  <option>1월</option>
                  <option>2월</option>
                  <option>3월</option>
                  <option>4월</option>
                  <option>5월</option>
                  <option>6월</option>
                  <option>7월</option>
                  <option>8월</option>
                  <option>9월</option>
                  <option>10월</option>
                  <option>11월</option>
                  <option>12월</option>
                </select>
                <div>
                  <input type="text" placeholder="시작일">
                  <span>~</span>
                  <input type="text" placeholder="종료일">
                  <button>검색</button>
                </div>

                <!-- 기간별 매출 -->
                <div id="admin_sale_sales_content_statics1"></div>
                <!-- //기간별 매출 -->
                
              </div>

              <hr>

              <div>

                <div>
                  <span>전년도 동월 대비 매출</span>
                </div>

                <!-- 전년도 대비 매출 -->
                <div id="admin_sale_sales_content_statics2"></div>
                <!-- //전년도 대비 매출 -->

              </div>

              <hr>

              <div>
                <div>
                  <span>전월 대비 매출</span>
                </div>

                <!-- 전월 대비 매출 -->
                <div id="admin_sale_sales_content_statics3"></div>
                <!-- //전월 대비 매출 -->

              </div>

            </div>
            <!-- //기간별 매출 조회 -->
          </div>
          <!-- //admin_sale_sales_content -->
          
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
