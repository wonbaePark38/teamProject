<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        data.addColumn('number', '프로젝트');
        //data.addColumn('number', '취소');
              data.addRows([
                ${ result }
              ]);
        var options = {     
          title: '프로젝트',
          fontSize: '12',
          fontName: '굴림체',
          hAxis: {
            title: '기간', 
            titleTextStyle: {color: 'red', fontName: '명조체'}
          } ,      
          vAxis: {
            title: '프로젝트', 
            titleTextStyle: {color: 'blue', fontName: '명조체'}
          } ,
        };        
        var chart = new google.visualization.ColumnChart(document.getElementById('statics_mothly_create_article_static'));
        chart.draw(data, options);   
        data = null;
        chart = null;
      }


    </script>
	<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ${ result2 }
      ]);

      var options = {
        title: '프로젝트 수',
        curveType: 'function',
        legend: { position: 'bottom' }
      };

      var chart = new google.visualization.LineChart(document.getElementById('statics_mothly_create_article_pastyear_static'));

      chart.draw(data, options);
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
                        <td>${ vo.getProtodaycount() }</td>
                        <td>${ vo.getProcount() }</td>
                      </tr>
                    </table>
                    <br>
                    <table>
                      <tr>
                        <th>최다 사용자 프로젝트</th>
                        <th>이용자수</th>
                      </tr>
                      <!-- forEach -->
                      <c:forEach var="project" items="${ projectList }" begin="0" end="2">
	                      <tr>
	                        <td>${ project.getProjectname() }</td>
	                        <td>${ project.getProjectusercount() }</td>
	                      </tr>
                      </c:forEach>
                      <!-- //forEach -->
                    </table>
                  </div>
                </div>

                <div id="admin_project_content_statics">
                  <div id="admin_project_content_statics_header">
                    <span><strong>통계</strong></span>
                  </div>

                  <hr>

                  
                  
                  <div>

                    <div style="margin-bottom: 20px;">
                      <span>월별 프로젝트 생성 수</span>
                    </div>
                    <!-- 날짜 선택 관련 -->
                    <div id="statics_mothly_create_article_select_date">
                    <form action="projectInfo.do" method="post">
                      <select name="month">
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                      </select>
                      <input type="submit" value="검색" />
                      </form>
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