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

    <!-- googleChart -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      
      google.load("visualization", "1", {'packages':["corechart"]});    

      google.setOnLoadCallback(drawChart);	// bar



      function drawChart() {    

        var data = new google.visualization.DataTable();

        data.addColumn('string', '시간');

        data.addColumn('number', '게시글');

        //data.addColumn('number', '취소');

        

              data.addRows([
                ['00', 124],
                ['01', 442],
                ['02', 321],
                ['03', 0],
                ['04', 0],
                ['05', 0],
                ['06', 0],
                ['07', 0],
                ['08', 524],
                ['09', 257],
                ['10', 352],
                ['11', 279],
                ['12', 389]
              ]);

        var options = {     

          title: '게시글수',

          fontSize: '12',

          fontName: '굴림체',

          hAxis: {

            title: '기간', 

            titleTextStyle: {color: 'red', fontName: '명조체'}

          } ,      

          vAxis: {

            title: '게시글수', 

            titleTextStyle: {color: 'blue', fontName: '명조체'}

          } ,

          
        };        

        var chart = new google.visualization.ColumnChart(document.getElementById('statics_mothly_create_article_static'));

        chart.draw(data, options);   

        data = null;

        chart = null;
      }

    </script>

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
        </div>

       

        <!-- page content -->
        <div class="right_col" role="main">
            <div style="width: 100%;">
              <div>
                <span><h1><strong>프로젝트 관리</strong></h1></span>
                <hr>
              </div>
  
              <div id="admin_project_content">
                <div>

                  <div id="admin_project_content_header">
                    <span><strong>프로젝트</strong></span>
                  </div>

                  <div id="admin_project_content_info" >
                    <table>
                      <tr>
                        <th>오늘 생성된 프로젝트 수</th>
                        <th>총 프로젝트 수</th>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>2</td>
                      </tr>
                    </table>
                    <br>
                    <table>
                      <tr>
                        <th>최다 사용자 프로젝트</th>
                        <th>이용자수</th>
                      </tr>
                      <!-- forEach -->
                      <tr>
                        <td>프로젝트1</td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td>프로젝트2</td>
                        <td>110</td>
                      </tr>
                      <tr>
                        <td>프로젝트3</td>
                        <td>100</td>
                      </tr>
                      <!-- //forEach -->
                    </table>
                  </div>
                </div>

                <div id="admin_project_content_statics">
                  <div id="admin_project_content_statics_header">
                    <span><strong>통계</strong></span>
                  </div>

                  <hr>

                  <!-- 프로젝트 통계 관련 div -->
                  <div>
                    <div style="margin-bottom: 20px;">
                      <span>전일 대비 프로젝트 수</span>
                    </div>
                    <div id="statics_compare_yesterday"></div>

                  </div>

                  <hr>
                  
                  
                  <div>

                    <div style="margin-bottom: 20px;">
                      <span>월별 프로젝트 생성 수</span>
                    </div>
                    <!-- 날짜 선택 관련 -->
                    <div id="statics_mothly_create_article_select_date">
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

                      <div id="statics_mothly_create_article_datepicker">
                        <input id="statics_mothly_create_article_datepicker1" type="text">
                        <span>~</span>
                        <input id="statics_mothly_create_article_datepicker2" type="text">
                      </div>
                      
                    </div>
                    <!-- //날짜 선택 관련 -->
                    <div>
                      <!-- 기간별 프로젝트 생성수 -->
                      <div id="statics_mothly_create_article_static"></div>
                      <!-- //기간별 프로젝트 생성수 -->
                    </div>
                  
                    <hr>

                    <div>
                      <div style="margin-bottom: 20px;">
                        <span>전년도 대비 동월 총 프로젝트 수</span>
                      </div>
                      <!-- 전년도 대비 동월 총 프로젝트 수 -->
                      <div id="statics_mothly_create_article_pastyear_static"></div>

                    </div>


















                  </div>
                  <!-- //프로젝트 통계 관련 div -->

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