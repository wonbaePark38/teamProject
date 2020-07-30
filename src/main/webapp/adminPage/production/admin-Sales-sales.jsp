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
                <h3>General</h3>
                <ul class="nav side-menu">
                  
                  <li><a><i class="fa fa-edit"></i> 회원<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a>회원 관리</a></li>
                      <li><a>회원 검색</a></li>
                    </ul>
                  </li>


                  <li><a><i class="fa fa-desktop"></i> 프로젝트<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a>게시글</a></li>
                      <li><a>프로젝트</a></li>
                    </ul>
                  </li>

                  <li><a><i class="fa fa-bar-chart-o"></i> 매출 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      
                    </ul>
                  </li>

                  

                  <li><a><i class="fa fa-sitemap"></i> CS <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a>FAQ 관리</a></li>
                      <li><a>1:1 문의</a></li>
                      <li><a>신고접수</a></li>
                    </ul>
                  </li>                  

                  <li><a><i class="fa fa-table"></i> ??? <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  
                  
                </ul>
              </div>

              

            </div>
            <!-- /sidebar menu -->
          </div>
        </div>

       

        <!-- page content -->
        <div class="right_col" role="main">
          <div style="width: 100%;">
            <div>
              <span><h1><strong>매출</strong></h1></span>
              <hr>
            </div>
          </div>

          <div>
            <table>
              <tr style="width: 620px;">
                <th style="width: 200px;">오늘 결제 건</th>
                <th style="width: 200px;">이번달 결제 건</th>
                <th style="width: 200px;">이번달 환불 건</th>
              </tr>
              <tr style="width: 620px;">
                <td style="width: 200px;">1</td>
                <td style="width: 200px;">2</td>
                <td style="width: 200px;">0</td>
              </tr>
            </table>
          </div>,

          <hr>

          <!-- 기간별 매출 조회 -->
          <div>
            <div>
              <span>매출 조회</span>
            </div>

            <div>
              <select name="" id="" style="display: inline-block; vertical-align: middle; height: 25px;">
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
              <div style="display: inline-block; vertical-align: middle;">
                <input type="text" placeholder="시작일">
                <span>~</span>
                <input type="text" placeholder="종료일">
              </div>

              <!-- 기간별 매출 -->
              <div style=" display: inline-block; width: 800px; height: 400px; margin-top: 20px; background-color: bisque;"></div>
              <!-- //기간별 매출 -->
              
            </div>

            <hr>

            <div>

              <div>
                <span>전년도 동월 대비 매출</span>
              </div>

              <!-- 전년도 대비 매출 -->
              <div style=" display: inline-block; width: 800px; height: 400px; margin-top: 20px; background-color: bisque;"></div>
              <!-- //전년도 대비 매출 -->

            </div>

            <hr>

            <div>
              <div>
                <span>전월 대비 매출</span>
              </div>

              <!-- 전월 대비 매출 -->
              <div style=" display: inline-block; width: 800px; height: 400px; margin-top: 20px; background-color: bisque;"></div>
              <!-- //전월 대비 매출 -->

            </div>

          </div>
          <!-- //기간별 매출 조회 -->

          <hr>

          
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
