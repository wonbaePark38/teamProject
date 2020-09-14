/*
 * 프로젝트 구성원 접속자 통계 자바스크립트파일
 */
var chartList = []; //구글 차트에 들어갈 데이터를 받는 배열
$( document ).ready(function() {
	 var presentList = []; //현재 리스트에 뿌려진 데이터를 받는 배열
	 
	 google.charts.load('current', {'packages':['line','controls']});
	 chartDrowFun.chartDrow();

     
    $.ajax({
    	type :'POST',
    	url : 'getRecentData.do' //최근 6개월 데이터 가져옴
    }).done(function(data){
    	console.log(data);
    	$.each(data,function(index,element){
    		chartList.push(element);
    	});
    }).fail(function(){
    	alert('정보 가져오기 실패')
    })
    
    $.ajax({ //해당 프로젝트 구성원 정보 가져옴
    	type : 'POST',
    	url : 'getConnectionStatistics.do',
    	
    }).done(function(data){
    	$.each(data,function(index,element){
    		settingList(element);
    		presentList.push(element);
    	});
    }).fail(function(){
    	alert('리스트 받기 실패');
    })
    
    $(".search-keyword").keyup(function(e){ //검색
		  var searchCondition = $('#search-type').val();
		  var keyword = $(this).val();
		  $('tbody').hide();
		  
		  if(searchCondition == '이름'){
			  var listDiv = $(".name:contains('" + keyword + "')");
		  }else if(searchCondition == '부서'){
			  var listDiv = $(".department:contains('" + keyword + "')");
		  }else if(searchCondition == '직책'){
			  var listDiv = $(".position:contains('" + keyword + "')");
		  }
		  $(listDiv).parent().parent().show();
	});
    
    $("input:radio[name=login-or-not]").click(function(){
    	removeList(); //기존 내용 삭제
    	if($("input[name=login-or-not]:checked").val()=="all"){
    		$.each(presentList,function(index,element){
    			settingList(element);
    		});
    	}else if($("input[name=login-or-not]:checked").val()=="connect"){
    		$.each(presentList,function(index,element){
    			if(element.connectionCount == 0){
    				return true;
    			}
    			settingList(element);
    		});
    	}else if($("input[name=login-or-not]:checked").val()=="disconnect"){
    		$.each(presentList,function(index,element){
    			if(element.connectionCount > 0){
    				return true;
    			}
    			settingList(element);
    		});
    	}
    });
    
    $('#month-select-bt').click(function(){
        console.log('월 버튼 클릭');
        var monthNode = document.querySelector('.month-select');
        var weekNode = document.querySelector('.week-select');
        console.log(monthNode);
        $('.month-select').css('display','block');
        $('.week-select').css('display','none');
    });

    $('#week-select-bt').click(function(){

        console.log('주 버튼 클릭');
        var monthNode = document.querySelector('.month-select');
        var weekNode = document.querySelector('.week-select');
        console.log(weekNode);
       
        $('.month-select').css('display','none');
        $('.week-select').css('display','block');
    });
});

function settingList(element){ //화면에 출력
	$('.statistics').append(
			"<tbody>" +
				"<tr class='statistics-data-row'>" +
					"<td class='name'>"+element.name+"</td>" +
					"<td class='department'>"+element.department+"</td>" +
					"<td class='position'>"+element.myPosition+"</td>" +
					"<td class='email'>"+element.email+"</td>" +
					"<td class='connection-count'>"+element.connectionCount+"</td>" +
				"</tr>" +
			"</tbody>");
}
	
function removeList(){ //버튼 클릭했을때 그전에 있던 리스트 지워주는 함수
	 $('.statistics').children('tbody').remove(); //그전에 띄워논거 지움
}

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
	         
	          $.each(chartList,function(index,element){
	        	  var dateTemp = element.connectionDate.split('-');
	        	  
	        	  dataRow = [new Date(dateTemp[0],dateTemp[1]-1), element.connectionCount];
		            data.addRow(dataRow);
	          });
	          
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


