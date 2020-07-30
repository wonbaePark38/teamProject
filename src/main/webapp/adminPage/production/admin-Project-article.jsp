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

	  <!-- jQuery -->
	  <script src="../vendors/jquery/dist/jquery.min.js"></script>
	  <!-- Bootstrap -->
	  <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	  <!-- DateJS -->
	  <script src="../vendors/DateJS/build/date.js"></script>
	  <!-- Custom Theme Scripts -->
	  <script src="../build/js/custom.min.js"></script>

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
            <div style="min-width: 1600px;">
                <div>
                    <span><strong><h1>게시글</h1></strong></span>
                    <hr>
                </div>


                <div>
                    <table>
                    <tr style="width: 500px;">
                        <th style="width: 200px;">오늘 작성된 게시글 수</th>
                        <th style="width: 200px;">총 게시글 수</th>
                    </tr>
                    <tr style="width: 500px;">
                        <td style="width: 200px;">1</td>
                        <td style="width: 200px;">2</td>
                    </tr>
                    </table>
                </div>


                <div style="margin-top: 30px;">

                  <div style="margin-bottom: 20px;">
                    <span style="font-size: 15px;"><strong>통계</strong></span>
                  </div>
                </div>
                <!-- 게시글 통계 관련 div -->
				<div>
				
				    <hr>
				
				    <div>
				
				      <div style="margin-bottom: 20px;">
				        <span>전일 대비 게시글 작성수</span>
				      </div>
				
				      <div style=" display: inline-block; width: 800px; height: 400px; background-color: bisque;"></div>
				      
				
				    </div>
				
				    <hr>
				      
				    <!-- 날짜 선택 관련 -->
				    <div style="margin-bottom: 20px;">
				      <span>기간별 게시글 작성수</span>
				    </div>
				
				    <div style="margin-bottom: 10px;">
				      <select style="display: inline-block; vertical-align: middle; height: 25px;">
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
				    </div>
				    
				    <div style="display: inline-block; vertical-align: middle; margin-left: 10px;">
				      <input id="articleDatepicker1" type="text" style="width: 100px;">
				      <span>~</span>
				      <input id="articleDatepicker2" type="text" style="width: 100px;">
				    </div>
				    <!-- //날짜 선택 관련 -->
				          
				  </div>
				  
				
				      
				  <div>
				    <!-- 기간별 게시글 작성수 -->
				    <div id="chart_div" style=" display: inline-block; width: 800px; height: 400px;"></div>
				    <!-- //기간별 게시글 작성수 -->
				
				  </div>
				
				  <hr>
				
				  <div>
				    <div style="margin-bottom: 20px;">
				    <span>전년도대비 월별 게시글 작성수</span>
				    </div>
				    <div style=" display: inline-block; width: 800px; height: 400px; background-color: bisque;"></div>
				  </div>
				      
				  <hr>
				
				  <div>
				
				    <div style="margin-bottom: 20px;">
				      <span>신고된 게시글</span>
				    </div>
				
				    <div style="width: 1000px;">
				      <table>
				        <tr>
				            <th style="width: 150px; text-align: center;">번호</th>
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
				        <select style="display: inline-block; vertical-align: middle; height: 25px;">
				            <option>글번호</option>
				            <option>작성자</option>
				            <option>글제목</option>
				        </select>
				        <input type="text" style="display: inline-block; vertical-align: middle; width: 100px;">
				        <button style="display: inline-block; border-style: none; height: 25px;">검색</button>
				    </div>
				
				  </div>
				</div>
				<!-- //게시글 통계 관련 div -->
                
            </div>
          </div>
          <!-- //page content -->

      </div>





	
  </body>

</html>