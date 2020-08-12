// 프로젝트 생성
function newproject(){
	
	var newproject = document.getElementById('newproject');
	newproject.submit();
}

// 프로젝트 세팅 메뉴
function contentset(){
    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
}

$(document).on('click','.projectdir_set',function(){
	alert($(this).attr('id'));
	location.href = projectdir_set;
});

// 프로젝트 즐겨찾기
$(document).on('click','#star_btn',function(){
	var favorites = document.getElementById('favorites_form');
	if ($(this).attr('value') == '0') {
		$(this).attr('value','1');
	} else {
		$(this).attr('value','0');
	}
	
	favorites.submit();
});

