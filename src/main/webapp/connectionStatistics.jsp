<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plug</title>
    
    <script src="script/jquery-3.5.1-min.js"></script>
    
    <link href="css/connectionStatistics.css" rel="stylesheet">
    <script src="script/jquery-3.5.1-min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="script/connectionStatistics.js"></script>
</head>
<script>

</script>
<body>
<jsp:include page="privateConfigHeader.jsp" flush="true" />
	<script>
		$('.headerWrap').css('width', '100%');
		$('.headerWrap').css('border', '0');
		$('#inputkeyword').css('display','none');
	</script>
	<div class="mainWrap">
    <jsp:include page="projectManagerPageSidebar.jsp" flush="true" />
    <div id="main-contents">
        <div class="header">
            접속 통계
        </div>
        <div class="contents">
            <div class="select-type-text-div">
                <div class="month-select">
                    <Strong>월별 통계 차트</Strong>
                    <label>| 최근 6개월</label>
                </div>
            </div> <!-- end select-type-text-div-->
				<div id="Line_Controls_Chart">
					<!-- 라인 차트 생성할 영역 -->
					<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
					<!-- 컨트롤바를 생성할 영역 -->
					<div id="controlsArea" style="display: none" style="padding:0px 20px 0px 0px;"></div>
				</div>


				<div class="data-input-div">
               
                    <select id="search-type">
                        <option value="이름">이름</option>
                        <option value="부서">부서</option>
                        <option value="직책">직책</option>
                    </select>

                    <input type="text" placeholder="검색어를 입력해주세요" name="keyword" class="search-keyword">
                    <select id="select-month">
                    	<!-- 동적 value 생성 -->
                    </select>
					<input type="radio" name="login-or-not" value="all" checked='checked'>&nbsp;&nbsp;전체&nbsp;&nbsp;
                    <input type="radio" name="login-or-not" value="connect">&nbsp;&nbsp;접속자&nbsp;&nbsp;
                    <input type="radio" name="login-or-not" value="disconnect">&nbsp;&nbsp;비접속자
                    
            </div>

            <div class="table-view-div">
                <table class="statistics">
                    <thead class="title-head">
                        <tr class="con-statistics-tr">
                            <th scope="col">
                                이름
                            </th>
    
                            <th scope="col">
                                부서
                            </th>
    
                            <th scope="col">
                                직책
                            </th>
    
                            <th scope="col">
                                계정
                            </th>
    
                            <th scope="col">
                                이번달 접속수
                            </th>
                        </tr>
                    </thead>
                    <!--for문 들어갈 자리-->
                  
                     
                </table>
            </div>
        </div> <!--end contents-->
		</div>
    </div>
</body>



<script>


var chartDrowFun = {
		 
	    chartDrow : function(){
	        var chartData = '';
	 
	        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
	        var chartDateformat     = 'yyyy-MM';
	        //라인차트의 라인 수
	        var chartLineCount    = 10;
	        //컨트롤러 바 차트의 라인 수
	        var controlLineCount    = 10;
	 
	 
	        function drawDashboard() {
	 
	          var data = new google.visualization.DataTable();
	          //그래프에 표시할 컬럼 추가
	          data.addColumn('datetime' , '날짜');
	          data.addColumn('number'   , '접속자');
	          
	 
	          //그래프에 표시할 데이터
	         var dataRow = [];
	       	  var temp = '${chartList}';
	          var array = temp.split(",");
	          for(var i = 0; i <= 5; i++){ //컨트롤러에서 받은 문자열 데이터 배열로 변환
	              var dataArray = array[i].split('-');	
	   			  var count = parseInt(dataArray[2]);	
	              dataRow = [new Date(dataArray[0],dataArray[1]-1), count];
	              data.addRow(dataRow);
	            }


	          
	            var chart = new google.visualization.ChartWrapper({
	              chartType   : 'LineChart',
	              containerId : 'lineChartArea', //라인 차트 생성할 영역
	              options     : {
	                              isStacked   : 'percent',
	                              focusTarget : 'category',
	                              height          : '300',
	                              width              : '100%',
	                              legend          : { position: "top", textStyle: {fontSize: 13}},
	                              pointSize        : 5,
	                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
	                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
	                                                                  years : {format: ['yyyy']},
	                                                                  months: {format: ['MM']},
	                                                                 }
	                                                                },textStyle: {fontSize:12}},
	                vAxis              : {minValue: 50,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
	                animation        : {startup: true,duration: 1000,easing: 'in' },
	                annotations    : {pattern: chartDateformat,
	                                textStyle: {
	                                fontSize: 15,
	                                bold: true,
	                                italic: true,
	                                color: '#871b47',
	                                auraColor: '#d799ae',
	                                opacity: 0.8,
	                                pattern: chartDateformat
	                              }
	                            }
	              }
	            });
	 
	            var control = new google.visualization.ControlWrapper({
	              controlType: 'ChartRangeFilter',
	              containerId: 'controlsArea',  //control bar를 생성할 영역
	              options: {
	                  ui:{
	                        chartType: 'LineChart',
	                        chartOptions: {
	                        chartArea: {'width': '60%','height' : 80},
	                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
	                            gridlines:{count:controlLineCount,units: {
	                                  years : {format: ['yyyy']},
	                                  months: {format: ['MM']},
	                                 }
	                            }}
	                        }
	                  },
	                    filterColumnIndex: 0
	                }
	            });
	 
	            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
	            date_formatter.format(data, 0);
	 
	            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
	            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
	            dashboard.bind([control], [chart]);
	            dashboard.draw(data);
	 
	        }
	          google.charts.setOnLoadCallback(drawDashboard);
	 
	      }
	    }
	    
	    $(document).ready(function(){
	    	google.charts.load('current', {'packages':['line','controls']});
	    	chartDrowFun.chartDrow(); //chartDrow()
	    });
</script>
  
 
</html>
