// projectdir.jsp - script


// 프로젝트 생성
function new_project_form(){
	
	var project_name = $('input[name=project_name]').val();
	var project_content = $('input[name=project_content]').val();
	
	// form 생성
	var new_project = $('<form></form>');
	
	// form 설정
	new_project.attr('method','post');
	new_project.attr('action','newproject.do');
	
	// form 데이터
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
	
	// form 생성하는 곳
	favorites_form.appendTo('#content_div');
	favorites_form.submit();
});


function init(){
	$('#locker_list').text('보관함 설정');
	$('#locker_hide').text('숨기기');
	$('.dir_set_bar').hide();
	$('.headerWrap').show();
	
	// 프로젝트 선택css
	$('.setting_div').attr('id','setting_');
	$('.dir_set_on').attr('class','dir_set');
	$(this).attr('class','dir_set');
	$('.project_div_on').attr('class','project_div');
	$('.div_btn').hide();
	$('.div_btn_on').hide();
}

$(document).on('click', '#main_side', function() {
	init();
	
	var click_menu = $(this).text().trim();
	
	if (click_menu == '전체') {
		$('.content_type').hide();
		$('#project_dir_list1').show();
	} else if (click_menu == '미보관') {
		$('.content_type').hide();
		$('#project_dir_list2').css('display', 'inline-block');
	} else if (click_menu == '읽지않음') {
		$('.content_type').hide();
		$('#project_dir_list3').css('display', 'inline-block');
	} else if (click_menu == '즐겨찾기') {
		$('.content_type').hide();
		$('#project_dir_list4').css('display', 'inline-block');
	} else if (click_menu == '전체 업무') {
		alert('전체 업무');
	} else if (click_menu == '전체 일정') {
		alert('전체 일정');
	} else if (click_menu == '전체 파일') {
		alert('전체 파일');
	} else if (click_menu == '담아둔 글') {
		alert('담아둔 글');
	} else if (click_menu == '나를 지정') {
		alert('나를 지정');
	} else if (click_menu == '내 게시물') {
		alert('내 게시물');
	} else if (click_menu == '숨김') {
		$('.content_type').hide();
		$('.setting_div').attr('id','setting_hide');
		$('#locker_hide').text('숨기기 해제');
		$('#locker_n').text(click_menu);
		$('#hide_load').css('display', 'inline-block');
		
	} else {
		// 보관함 선택
		$('.content_type').hide();
		$('.setting_div').attr('id','setting_locker');
		$('#locker_list').text('보관함 해제');
		$('div[id='+click_menu+']').css('display', 'inline-block');
	}
});

// 보관함 설정
$(document).on('click', '.locker_setbtn', function() {
	// 선택된 프로젝트
	var select_project = "";
	var select_btn = false;
	
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
				var locker_del_name = "";
				// 선택된 보관함 이름 찾음
				$('.content_type').each(function(){ 
					if($(this).css('display') == 'inline-block'){
						locker_del_name = ($(this).attr('id'));
					}
				});
				// 선택한 보관함 안에 프로젝트 리스트 찾음
				var search_name = 'div[id='+locker_del_name+']';
				$(search_name).find('input[class=div_btn_on]').each(function(){
					locker_del_list += ($(this).next().val())+",";
				}); 
				alert(locker_del_list);
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

			// form 생성하는 곳
			hide_locker_set_name.appendTo('.mainWrap');

			hide_locker_set_name.submit();
		}
	}
});

// 보관함 삭제
$(document).on('click', '#locker_del', function() {
	
	var locker_del_list = "";
	var locker_del_name = $(this).next().text();
	var locker_del_id = $(this).prev().val();
	var search_name = 'div[id='+locker_del_name+']';
	$(search_name).children('input[name=project_id]').each(function(){
		locker_del_list += ($(this).val())+",";
	}); 
	if (locker_del_list == null || locker_del_list == '') {
		alert('보관함에 프로젝트가 없습니다.')
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

		// form 생성하는 곳
		locker_del.appendTo('.mainWrap');

		locker_del.submit();
	}
});



// 보관함에 프로젝트 추가
$(document).on('click','#locker_success',function(){
	
	// 선택된 프로젝트
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
	
	alert(select_locker);
	
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
		
		// form 생성하는 곳
		locker_set_name.appendTo('.mainWrap');
	
		locker_set_name.submit();
	}
}); 

// 보관함 생성
$(document).on('click','#locker_add',function(){
	// 특수문자 구분
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
	
	$('.content_type').hide();
	$('#project_dir_list1').show();
	
	$(document).on('click','#dir_setting',function(){
		$('.div_btn_on').attr('class','div_btn');
		// 편집 버튼 누를 때
		if ($('.setting_div').attr('id') != 'setting_hide' &&  $('.setting_div').attr('id') != 'setting_locker') {

			if ($(this).attr('class') == 'dir_set') {
				$('.content_type').hide();
				$('#project_dir_list2').css('display', 'inline-block');
				project_select_num = 0;
				$('.select_num').text(project_select_num);
				// 세팅 바
				$('.headerWrap').hide();
				$('.dir_set_bar').show();
				// 프로젝트 선택 css
				$(this).attr('class','dir_set_on');
				$('.project_div').attr('class','project_div_on');
				$('.div_btn').show();
			// 편집 취소할 때
			} else if ($(this).attr('class') == 'dir_set_on') {
				// 세팅 바
				$('.dir_set_bar').hide();
				$('.headerWrap').show();
				
				// 프로젝트 선택css
				$(this).attr('class','dir_set');
				$('.project_div_on').attr('class','project_div');
				$('.div_btn').hide();
				$('.div_btn_on').hide();
				
			}
		}  else {
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
			// 편집 취소할 때
			} else if ($(this).attr('class') == 'dir_set_on') {
				// 세팅 바
				$('.dir_set_bar').hide();
				$('.headerWrap').show();
				
				// 프로젝트 선택css
				$(this).attr('class','dir_set');
				$('.project_div_on').attr('class','project_div');
				$('.div_btn').hide();
				$('.div_btn_on').hide();
				
			}
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
	
});

