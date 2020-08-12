// 프로젝트 생성
function newproject(){
	
	var newproject = document.getElementById('newproject');
	newproject.submit();
}

// 프로젝트 세팅 메뉴
function contentset(){
    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
}


// 프로젝트 즐겨찾기
$(document).on('click','#star_btn',function(){
	if ($(this).attr('value') == '0') {
		$(this).attr('value','1');
	} else {
		$(this).attr('value','0');
	}
	var set = $(this).attr('class');
	alert(set);
	var favorites = document.favorites_form;
	
	favorites.submit();
});
