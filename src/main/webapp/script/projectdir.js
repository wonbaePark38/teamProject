// projectdir.jsp - script



// 프로젝트 생성
function new_project_form(){
	
	var project_name = $('input[name=project_name]').val();
	var project_content = $('input[name=project_content]').val();
	var viewType = $('#vt').val();
	
	// form 생성
	var new_project = $('<form></form>');
	
	// form 설정
	new_project.attr('method','post');
	new_project.attr('action','newproject.do');
	
	// form 데이터
	if (viewType != '보관함' && viewType != '숨김') {
		new_project.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));
	}
	new_project.append($('<input/>',{type:'hidden', name:'project_name', value:project_name}));
	new_project.append($('<input/>',{type:'hidden', name:'project_content', value:project_content}));
	new_project.append($('<input/>',{type:'hidden', name:'project_manager', value:'0'}));
	new_project.append($('<input/>',{type:'hidden', name:'project_type', value:'0'}));
	
	// form 생성하는 곳
	new_project.appendTo('#new_project_div');
	
	new_project.submit();
}

// 프로젝트 세팅 메뉴
function lockerset(){
    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
}


// 프로젝트 즐겨찾기
$(document).on('click','#star_btn',function(){
	if ($(this).attr('value') == '0') {
		$(this).attr('value','1');
	} else {
		$(this).attr('value','0');
	}
	
	var viewType = $('#vt').val();
	var project_id = $(this).prev().prev().attr('value');
	var project_favorites = $(this).attr('value');
	
	// form 생성
	var favorites_form = $('<form></form>');
	
	// form 설정
	favorites_form.attr('method','post');
	favorites_form.attr('action','projectfavorites.do');
	// form 데이터
	favorites_form.append($('<input/>',{type:'hidden', name:'project_id', value: project_id}));
	favorites_form.append($('<input/>',{type:'hidden', name:'project_favorites', value:project_favorites}));
	favorites_form.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));
	
	// form 생성하는 곳
	favorites_form.appendTo('#content_div');
	favorites_form.submit();
});


function viewType(type,url){
	// form 생성
	var view = $('<form></form>');
	
	// form 설정
	view.attr('method','post');
	view.attr('action',url);
	
	// form 데이터
	view.append($('<input/>',{type:'hidden', name:'viewType', value:type}));
	if (url == 'task.do') {
		var task_checked = ['cbrequest','cbdoing','cbfeedback','cbcomplete','cbhold','cbemergency','cbhigh','cbnomal','cblow','cbnone','sdtotal','edtotal'];
		view.append($('<input/>',{type:'hidden', name:'selectType', value:'totaltask'}));
		view.append($('<input/>',{type:'hidden', name:'task_checked', value:task_checked}));
	}
	// form 생성하는 곳
	view.appendTo('body');
	
	view.submit();
}
function viewLocker(type){
	// form 생성
	var view = $('<form></form>');
	
	// form 설정
	view.attr('method','post');
	view.attr('action','projectdir.do');
	
	// form 데이터
	view.append($('<input/>',{type:'hidden', name:'viewType', value:'보관함'}));
	view.append($('<input/>',{type:'hidden', name:'project_locker', value:type}));
	
	// form 생성하는 곳
	view.appendTo('body');
	
	view.submit();
}
$(document).on('click', '#main_side', function() {
	
	var click_menu = $(this).text().trim();
	
	if (click_menu == '전체') {
		viewType(null,'projectdir.do');
	} else if (click_menu == '미보관') {
		viewType('미보관','projectdir.do');
	} else if (click_menu == '읽지않음') {
		viewType('읽지않음','projectdir.do');
	} else if (click_menu == '즐겨찾기') {
		viewType('즐겨찾기','projectdir.do');
	} else if (click_menu == '전체 업무') {
		viewType('전체 업무','task.do');
	} else if (click_menu == '담아둔 글') {
		alert('담아둔 글');
	} else if (click_menu == '나를 지정') {
		alert('나를 지정');
	} else if (click_menu == '내 게시물') {
		alert('내 게시물');
	} else if (click_menu == '숨김') {
		viewType('숨김','projectdir.do');
	} else {
		
		viewLocker(click_menu);
	}
});


// 보관함 설정
$(document).on('click', '.locker_setbtn', function() {
	// 선택된 프로젝트
	var select_project = "";
	var select_btn = false;
	var viewType = $('#vt').val();
	// 프로젝트 선택 여부
	$("input:button[class=div_btn_on]").each(function(){
		select_project += ($(this).next().val())+",";
	});
	
	// 보관함 추가
	if ($(this).attr('id') == 'locker_list') {
		
		if ($('#locker_list').text() == '보관함 설정') {
			if (select_project == null || select_project == '') {
				alert('프로젝트를 선택해 주세요.')
			} else {
				$('.locker_list_set').toggle();	
			} 
		} else if ($('#locker_list').text() == '보관함 해제') {
			if (select_project == null || select_project == '') {
				alert('프로젝트를 선택해 주세요.')
			} else {
				var locker_del_list = "";
				var locker_del_name = $('.content_type').attr('id');
				// 선택한 보관함 안에 프로젝트 리스트 찾음
				var search_name = $('.content_type');
				search_name.find('input[class=div_btn_on]').each(function(){
					locker_del_list += ($(this).next().val())+",";
				}); 
				if (locker_del_list == null || locker_del_list == '') {
					alert('보관함에 프로젝트가 없습니다.');
				} else {
					
					// form 생성
					var locker_del = $('<form></form>');
			
					// form 설정
					locker_del.attr('method', 'post');
					locker_del.attr('action', 'deletelockername.do');
			
					// form 데이터
					locker_del.append($('<input/>', {type : 'hidden', name :'project_id_list', value :locker_del_list}));
					locker_del.append($('<input/>', {type : 'hidden', name :'project_locker', value :locker_del_name}));
					locker_del.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));
			
					// form 생성하는 곳
					locker_del.appendTo('.mainWrap');
			
					locker_del.submit();
				}
			} 
		}
		
	// 프로젝트 숨기기
	} else if ($(this).attr('id') == 'locker_hide') {

		var hide_locker = null;

		// 숨김 여부
		if ($('#locker_hide').text() == '숨기기') {
			hide_locker = 1;
		} else if($('#locker_hide').text() == '숨기기 해제') {
			hide_locker = 0;
		} 
		
		// 프로젝트 선택 여부
		if (select_project == null || select_project == '') {
			alert('프로젝트를 선택해 주세요.')
		} else {
			select_project = select_project.substr(0, select_project.length-1);
			
			
			// form 생성
			var hide_locker_set_name = $('<form></form>');

			// form 설정
			hide_locker_set_name.attr('method', 'post');
			hide_locker_set_name.attr('action', 'hidelocker.do');

			// form 데이터
			hide_locker_set_name.append($('<input/>', {type : 'hidden', name :'project_id_list', value :select_project}));
			hide_locker_set_name.append($('<input/>', {type : 'hidden', name :'hide_locker', value :hide_locker}));
			hide_locker_set_name.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));

			// form 생성하는 곳
			hide_locker_set_name.appendTo('.mainWrap');

			hide_locker_set_name.submit();
		}
	}
});

// 보관함 삭제
$(document).on('click', '#locker_del', function(e) {
	e.stopPropagation();
	var viewType = $('#vt').val();
	if (confirm('게시글을 정말로 삭제하시겠습니까?')) {
	
		var locker_del_list = "";
		var locker_del_name = $(this).parent().text().trim();
		var locker_del_id = $(this).parent().prev().val();
		var search_name = 'div[id='+locker_del_name+']';
		$(search_name).children('input[name=project_id]').each(function(){
			locker_del_list += ($(this).val())+",";
		}); 
		if (locker_del_list) {
			alert('보관함에 프로젝트가 있습니다.')
		} else {
			// form 생성
			var locker_del = $('<form></form>');
	
			// form 설정
			locker_del.attr('method', 'post');
			locker_del.attr('action', 'deletelocker.do');
	
			// form 데이터
			locker_del.append($('<input/>', {type : 'hidden', name :'project_id_list', value :locker_del_list}));
			locker_del.append($('<input/>', {type : 'hidden', name :'project_locker', value :locker_del_name}));
			locker_del.append($('<input/>', {type : 'hidden', name :'locker_list_id', value :locker_del_id}));
			locker_del.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));
	
			// form 생성하는 곳
			locker_del.appendTo('.mainWrap');
	
			locker_del.submit();
		} 
	} else {
		alert('취소되었습니다.');
	}
});

// 보관함 수정

$(document).on('click', '#locker_update', function(e) {
	e.stopPropagation();
	$('#locker_change').show();
	var viewType = $('#vt').val();
	var locker_change_list = "";
	var locker_change_name = $(this).parent().text().trim();
	var locker_change_id = $(this).parent().prev().val();
	var search_name = 'div[id='+locker_change_name+']';
	$(search_name).children('input[name=project_id]').each(function(){
		locker_change_list += ($(this).val())+",";
	}); 
	
	var locker_change = $('<form></form>');
	locker_change.attr('id','locker_cf');
	// form 설정
	locker_change.attr('method', 'post');
	locker_change.attr('action', 'updatelockername.do');

	// form 데이터
	locker_change.append($('<input/>', {type : 'hidden', name :'project_id_list', value :locker_change_list}));
	locker_change.append($('<input/>', {id:'lc_name',type : 'hidden', name :'locker_name'}));
	locker_change.append($('<input/>', {type : 'hidden', name :'locker_list_id', value :locker_change_id}));
	locker_change.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));

	// form 생성하는 곳
	locker_change.appendTo('.mainWrap');


});

$(document).on('click','#lc_close',function(){
	$('#locker_change').hide();
});

$(document).on('click','#lc_locker',function(){
	var change_name = $('#change_locker_name').val()
	$('#locker_cf').find('#lc_name').attr('value',change_name);
	$('#locker_cf').submit();
});



// 보관함에 프로젝트 추가
$(document).on('click','#locker_success',function(){
	
	// 선택된 프로젝트
	var viewType = $('#vt').val();
	var select_project = "";
	$("input:button[class=div_btn_on]").each(function(){
		select_project += ($(this).next().val())+",";
	});
	select_project = select_project.substr(0, select_project.length-1);

	// 선택된 보관함
	var select_locker = "";
	
	if ($('#locker_list').text() == '보관함 설정') {
		select_locker = $('input[name="locker_cbox"]:checked').val();
	} else if ($('#locker_list').text() == '보관함 해제') {
		select_locker = null;
	}
	
	
	if (select_project == null || select_project == '') {
		alert('프로젝트를 선택해 주세요.')
	} else{
		
		
		// form 생성
		var locker_set_name = $('<form></form>');
			// form 설정
		locker_set_name.attr('method', 'post');
		locker_set_name.attr('action', 'updatelocker.do');
			// form 데이터
		locker_set_name.append($('<input/>', {type : 'hidden', name :'project_id_list', value :select_project}));
		locker_set_name.append($('<input/>', {type : 'hidden', name :'project_locker', value :select_locker}));
		locker_set_name.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));
		// form 생성하는 곳
		locker_set_name.appendTo('.mainWrap');
	
		locker_set_name.submit();
	}
}); 

$(document).on('click','.locker_cancel',function(){
	$('.locker_list_set').hide();
});

// 보관함 생성
$(document).on('click','#locker_add',function(){
	// 특수문자 구분
	var viewType = $('#vt').val();
	var blank_pattern = /[\s]/g;
	var locker_name = $('#locker_name').val();
	var locker_name_check = null;
	$('a[id=main_side]').each(function(){
		if ($(this).text().trim() == locker_name) {
			locker_name_check = true;
		}
	});
	
	if (locker_name_check == true) {
		alert("중복된 보관함이 있습니다."); 
	} else if(locker_name == '' || locker_name == null) {
		alert("보관함 이름을 입력해주세요."); 
	} else if(blank_pattern.test(locker_name) != true ) { 
		// form 생성
		var locker_form = $('<form></form>');
		
		// form 설정
		locker_form.attr('method','post');
		locker_form.attr('action','insertlocker.do');
		// form 데이터
		locker_form.append($('<input/>',{type:'hidden', name:'locker_name', value:locker_name}));
		if (viewType == '보관함') {
			locker_form.append($('<input/>',{type:'hidden', name:'viewType', value:""}));
		} else {
			locker_form.append($('<input/>',{type:'hidden', name:'viewType', value:viewType}));
		}
		// form 생성하는 곳
		locker_form.appendTo('.mainWrap');
		locker_form.submit();
	} else {
		alert("공백이나 특수문자는 사용할 수 없습니다."); 
		
	}
	
});



// content.jsp - script


$(document).ready(function(){
	
	
	var project_select_num;
	
	if ($('#vt').val() == '숨김') {
		$('#locker_list').hide();
		$('#locker_hide').text('숨기기 해제');
	} else if ($('#vt').val() == '보관함') {
		$('#locker_hide').hide();
		$('#locker_list').text('보관함 해제');
	}
	$(document).on('click','#dir_setting',function(){
		// 편집 버튼 누를 때
		
		if ($(this).attr('class') == 'dir_set') {
			project_select_num = 0;
			$('.select_num').text(project_select_num);
			// 세팅 바
			$('.headerWrap').hide();
			$('.dir_set_bar').show();
			// 프로젝트 선택 css
			$(this).attr('class','dir_set_on');
			$('.project_div').attr('class','project_div_on');
			$('.div_btn').show();
			
		} else if ($(this).attr('class') == 'dir_set_on') {
			// 세팅 바
			$('.dir_set_bar').hide();
			$('.headerWrap').show();
			
			// 프로젝트 선택css
			$(this).attr('class','dir_set');
			$('.project_div_on').attr('class','project_div');
			$('.div_btn_on').each(function(){
				$(this).attr('class','div_btn');
			});
			$('.div_btn').hide();
		}
		
	});
	
	$(document).on('click','#div_button',function(){
		if ($(this).attr('class') == 'div_btn') {
			project_select_num += 1;
			$('.select_num').text(project_select_num);
			$(this).attr('class','div_btn_on');
		} else if($(this).attr('class') == 'div_btn_on'){
			project_select_num -= 1;
			$('.select_num').text(project_select_num);
			$(this).attr('class','div_btn');
		}
	});
	
	$(document).on('click','.project_select',function(){
		if ($('#dir_setting').attr('class') == 'dir_set') {
			var project_id = $(this).prev().attr('value');
			var project_name = $(this).find('.title_box').find('span').text();
			var project_select_form = $('<form></form>');
			
			// form 설정
			project_select_form.attr('method','post');
			project_select_form.attr('action','projectselect.do');
			
			// form 데이터
			
			project_select_form.append($('<input/>',{type:'hidden', name:'project_name' ,value: project_name}));
			project_select_form.append($('<input/>',{type:'hidden', name:'project_id' ,value: project_id}));
			
			// form 생성하는 곳
			project_select_form.appendTo('#content_div');
			project_select_form.submit();
		} else if($('#dir_setting').attr('class') == 'dir_set_on'){
			var select_div = $(this).parent().find('input[id=div_button]');
			
			if ($(select_div).attr('class') == 'div_btn') {
				project_select_num += 1;
				$('.select_num').text(project_select_num);
				$(select_div).attr('class','div_btn_on');
			} else if($(select_div).attr('class') == 'div_btn_on'){
				project_select_num -= 1;
				$('.select_num').text(project_select_num);
				$(select_div).attr('class','div_btn');
			}
		}
	});
	
	$('.locker_a').mouseenter(function(){
		$(this).find('#locker_update').show();
		$(this).find('#locker_del').show();
	});
	$('.locker_a').mouseleave(function(){
		$(this).find('#locker_update').hide();
		$(this).find('#locker_del').hide();
	});
	if ($('.project_div').find()) {
		$('#none_project').hide();
	}
	
});


