
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
function contentset(){
    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
}

// 프로젝트 선택
$(document).on('click','.project_select',function(){
	var project_id = $(this).prev().attr('value');
	
	var project_select_form = $('<form></form>');
	
	// form 설정
	project_select_form.attr('method','post');
	project_select_form.attr('action','projectselect.do');
	
	// form 데이터
	project_select_form.append($('<input/>',{type:'hidden', name:'project_id', value: project_id}));
	
	// form 생성하는 곳
	project_select_form.appendTo('#content_div');
	project_select_form.submit();
});


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


