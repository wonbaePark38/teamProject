/*
 * 프로젝트 구성원 접속자 통계 자바스크립트파일
 */
var presentList = []; //현재 리스트에 뿌려진 데이터를 받는 배열
$( document ).ready(function() {
	google.charts.load('current', {'packages':['line','controls']});
	chartDrowFun.chartDrow(); //chartDrow()
	settingTerm();
    getMonthData(0);
    
    
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
        var monthNode = document.querySelector('.month-select');
        var weekNode = document.querySelector('.week-select');
        $('.month-select').css('display','block');
        $('.week-select').css('display','none');
    });

    $('#week-select-bt').click(function(){
        var monthNode = document.querySelector('.month-select');
        var weekNode = document.querySelector('.week-select');
       
        $('.month-select').css('display','none');
        $('.week-select').css('display','block');
    });
    
    //셀렉트 박스 월 선택 이벤트
    $('#select-month').on("change",function(){
    	removeList(); //기존 내용 삭제
    	var data = $('#select-month').val();
    	getMonthData(data);
    })
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

function settingTerm(){ // 검색 셀렉트 박스 월 동적으로 생성
	var now = new Date();
	var thisMonth = now.getMonth()+1;
	for(var i = 0; i<6; i++){
		var month = thisMonth-i;
		var value = i * -1;
		$('#select-month').append(
				"<option value="+value+">"+month+'월');
	}
}

function getMonthData(selectMonth){
	var sendData = {
			selectMonth : selectMonth
	}
	$.ajax({ //해당 프로젝트 구성원 정보 가져옴
    	type : 'POST',
    	url : 'getConnectionStatistics.do',
    	data : sendData,
    }).done(function(data){
    	removeArray();
    	$.each(data,function(index,element){
    		settingList(element);
    		presentList.push(element);
    	});
    }).fail(function(){
    	alert('리스트 받기 실패');
    })
}

function removeArray(){ //전역에 선언한 화면에 출력해줄 배열 기존 요소 삭제
	presentList.splice(0,presentList.length);
}
