// 프로젝트 생성
function newproject(){
	
	var newproject = document.getElementById('newproject');
	newproject.submit();
}

// 프로젝트 세팅 메뉴
function contentset(){
    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
}

// 프로젝트 정렬
$(document).on('click','.projectdir_set',function(){
	var click_this = $(this).attr('id');
	if(click_this == 'project_total'){
		$('#projectdir_set').attr('action','content.do').submit();
	} else if(click_this == 'project_manager'){
		$('#projectdir_set').attr('action','content_manager.do').submit();
	} 
});

// 프로젝트 즐겨찾기
$(document).on('click','#star_btn',function(){
	if ($(this).attr('class') == 'title_btn') {
		$(this).attr('class','title_btn_check');
	} else {
		$(this).attr('class','title_btn');
	}
});