$(document).ready(function(){
	$('#project-manage-bt').hide();
	
	task_num_check(); // 업무 게시글 카운트
	
	taskTypes(); // 업무 게시글 타입
	
	taskStatusTypeLoad(); // 전체 업무 체크 컨트롤러 받기
	
	taskStatusChecked('total'); // 체크된 항목 표시
});

$(document).on('click','.cbstatus',function(){
	taskStatusChecked('cbstatus');
});
$(document).on('click','.cbtaskrank',function(){
	taskStatusChecked('cbtaskrank');
});
$(document).on('click','.rsdate',function(){
	taskStatusChecked('rsdate');
});
$(document).on('click','.redate',function(){
	taskStatusChecked('redate');
});

// 이번주 날짜
function formatDate(date) {
    var myyear = date.getFullYear();
	var mymonth = date.getMonth()+1;
	var myweekday = date.getDate();
	return (myyear + '-'+('0'+mymonth).slice(-2) + '-' +('0'+ myweekday).slice(-2));
}
function getToWeekType() {
   var now = new Date();
   var nowDayOfWeek = now.getDay();
   var nowDay = now.getDate();
   var nowMonth = now.getMonth();
   var nowYear = now.getFullYear();
   var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
   var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
   return formatDate(weekStartDate) + "-" + formatDate(weekEndDate);
}


// 현재 날짜
function getToDayType(){
	var date = new Date();
	return date.getFullYear()+'-'+('0'+(date.getMonth()+1)).slice(-2)+'-'+('0'+date.getDate()).slice(-2);
}
// 체크 된 항목 표시
function taskStatusChecked(type){
	if (type == 'cbstatus' || type == 'total') {
		$('.cbstatus').each(function(){
			var status = $(this).next().text();
			if (!$(this).is(':checked')) {
				$('.tstatus').each(function(){
					if ($(this).text() == status) {
						$(this).attr('id','task_off')
					}
				});
				
			} else {
				$('.tstatus').each(function(){
					if ($(this).text() == status) {
						$(this).attr('id','task_on')
					}
				});
			}
		}) 
	}
	if (type == 'cbtaskrank' || type == 'total') {
		$('.cbtaskrank').each(function(){
			var status = $(this).next().text();
			if (!$(this).is(':checked')) {
				$('.task_order').each(function(){
					if ('없음' == status) {
						if ($(this).text() == '-') {
							$(this).attr('id','task_off')
						}
					} else if ($(this).text() == status) {
						$(this).attr('id','task_off')
					}
				});
			} else {
				$('.task_order').each(function(){
					if ('없음' == status) {
						if ($(this).text() == '-') {
							$(this).attr('id','task_on')
						}
					} else if ($(this).text() == status) {
						$(this).attr('id','task_on')
					}
				});
			}
		});
	}
	var toDay = getToDayType(); // 현재 날짜
	var toWeek = getToWeekType();
	if (type == 'rsdate' || type == 'total') {
		$('.rsdate').each(function(){
			var status = $(this).next().text();
			if ($(this).is(':checked')) {
				$('.task_sdate').each(function(){
					var weekDate = $(this).text().slice(0,-1) + (parseInt($(this).text().charAt($(this).text().length-1))+1);
					
					$(this).attr('id','task_off');
					
					if (status == '전체') {
						$(this).attr('id','task_on');
					} else if (status == '오늘') {
						if (toDay == $(this).text() && $(this).text() != '-') {
							$(this).attr('id','task_on');
						}
					} else if (status == '이번주') {
						if (toWeek.substring(0,10) < weekDate && toWeek.substring(11,21) > weekDate && $(this).text() != '-') {
							$(this).attr('id','task_on');
						}
					} else if (status == '이번달') {
						if (toDay.substring(0,7) == $(this).text().substring(0,7) && $(this).text() != '-') {
							$(this).attr('id','task_on');
						}
					} else if (status == '날짜미정') {
						if ('-' == $(this).text()) {
							$(this).attr('id','task_on');
						}
					} 
				});
			}
		});
	}
	if (type == 'redate' || type == 'total') {
		$('.redate').each(function(){
			if ($(this).is(':checked')) {
				var status = $(this).next().text();
				$('.task_edate').each(function(){
					var dayDate = $(this).text().slice(0,-1) + (parseInt($(this).text().charAt($(this).text().length-1))+1);
					console.log(toWeek.substring(11,21));
					console.log(dayDate);
					console.log(toWeek.substring(11,21) > dayDate);
					$(this).attr('id','task_off');
					if (status == '전체') {
						console.log('전체 들어옴');
						$(this).attr('id','task_on');
					} else if (status == '지연') {
						if (toDay > dayDate && $(this).text() != '-') {
							console.log('지연 들어옴');
							$(this).attr('id','task_on');
						}
					} else if (status == '오늘까지') {
						if (toDay == $(this).text() && $(this).text() != '-') {
							console.log('오늘까지 들어옴');
							$(this).attr('id','task_on');
						}
					} else if (status == '이번주까지') {
						if (toWeek.substring(11,21) > dayDate && $(this).text() != '-') {
							console.log('이번주까지 들어옴');
							$(this).attr('id','task_on');
						}
					} else if (status == '이번달까지') {
						if (toDay.substring(0,7) == $(this).text().substring(0,7) && $(this).text() != '-') {
							console.log('이번달까지 들어옴');
							$(this).attr('id','task_on');
						}
					} else if (status == '날짜미정') {
						if ('-' == $(this).text()) {
							console.log('날짜미정 들어옴');
							$(this).attr('id','task_on');
						}
					}
				});
			}
		}); 
	}
	$('.table_list').find('tr').each(function(){
		var count = 0;
		$(this).each(function(){
			if ($(this).find('#task_off').length > 0) {
				count++;
			}
			if(count == 0){
				$(this).show();
			} else if (count > 0) {
				$(this).hide();
			} 
		});
	});
}

// 전체 업무 체크 컨트롤러 받기
function taskStatusTypeLoad(){
	var taskStatusSplit = $('#taskStatusLoad').val();
	var taskStatus = taskStatusSplit.split(',');
	for (var i = 0; i < taskStatus.length; i++) {
		$('#'+taskStatus[i]).attr('checked',true);
	}
};

// 전체 업무 체크 컨트롤러 보내기
function taskStatusType(){
	var task_checked = [];
	$('.cbstatus').each(function(){
		if ($(this).is(':checked')) {
			task_checked.push($(this).attr('id'));
		}
	})
	$('.cbtaskrank').each(function(){
		if ($(this).is(':checked')) {
			task_checked.push($(this).attr('id'));
		}
	});
	$('.rsdate').each(function(){
		if ($(this).is(':checked')) {
			task_checked.push($(this).attr('id'));
		}
	});
	$('.redate').each(function(){
		if ($(this).is(':checked')) {
			task_checked.push($(this).attr('id'));
		}
	});
	return task_checked;
}

function taskTypes(){
	if ($('.taskTypes').attr('name') == 'totaltask') {
		$('#rtotalTask').attr('checked',true);
	} else if ($('.taskTypes').attr('name') == 'rmyTask') {
		$('#rmyTask').attr('checked',true);
	} else if ($('.taskTypes').attr('name') == 'rrequireTask') {
		$('#rrequireTask').attr('checked',true);
	}
}
function task_num_check(){
	var task_num = 0;
	$('.taid').each(function(){
		task_num++;
	});
	$('#task_num').text(task_num);
}
// 메뉴 토글버튼
$(document).on('click','.fold',function(){
	$(this).parent().next().toggle();
});
// 전체 업무 닫기
$(document).on('click','#task_close',function(){
	location.href ="projectdir.do";
});

// 업무 목록 요청
$(document).on('click','.rbtask',function(){
	if ($(this).attr('id') == 'rtotalTask') {
		task_form('totaltask');
	} else if ($(this).attr('id') == 'rmyTask') {
		task_form('rmyTask');
	} else if ($(this).attr('id') == 'rrequireTask') {
		task_form('rrequireTask');
	}
});
function task_form(type){
	
	
	var task_list = $('<form></form>');
	var session_name = $('.table_list').attr('name');
	
	// 검색목록 체크 여부 확인
	var taskArr = taskStatusType();
	
	
	// form 설정
	task_list.attr('method','post');
	task_list.attr('action','task.do');
	
	// form 데이터
	task_list.append($('<input/>',{type:'hidden', name:'selectType', value:type}));
	task_list.append($('<input/>',{type:'hidden', name:'task_checked', value:taskArr}));
	if (type == 'rmyTask') {
    	task_list.append($('<input/>',{type:'hidden', name:'writer', value:session_name}));
	} else if (type == 'rrequireTask') {
    	task_list.append($('<input/>',{type:'hidden', name:'writeForm3_workersName', value:session_name}));
	} 
	
	// form 생성하는 곳
	task_list.appendTo('body');
	
	task_list.submit();
}

// task 게시글 선택
$(document).on('click','.task_board',function(e){
	e.stopPropagation();
	// 선택 게시글 정보
	var article_id = $(this).attr('name');
	
	// 선택 게시물 보이기
	$('.post_idx[name='+article_id+']').toggle();
});

$(document).on('click','#spbtn',function(){
	var project_id = $(this).attr('class');
	var project_name = $(this).attr('name');
	var project_move = $('<form></form>');
	
	
	// form 설정
	project_move.attr('method','post');
	project_move.attr('action','projectselect.do');
	
	// form 데이터
	project_move.append($('<input/>',{type:'hidden', name:'project_id', value:project_id}));
	project_move.append($('<input/>',{type:'hidden', name:'project_name', value:project_name}));
	
	// form 생성하는 곳
	project_move.appendTo('body');
	
	project_move.submit();
});