// 새 프로젝트
function new_project() {
	document.getElementById('new_project_div').style.display = (document.getElementById('new_project_div').style.display == 'block') ? 'none'	: 'block';
}

// 보관함 버튼 
function new_plus() {
	document.getElementById('new_plus').style.display = (document.getElementById('new_plus').style.display == 'block') ? 'none'	: 'block';
}


// 이미지 업로드
function img_load(){
	$("#post_images").append("<div class='post_image'><div class='post_box'><img class='post_load_img'><input type='button' id='img_close'></div></div>");
}

// 파일 업로드
function file_load(){
	$("#post_files").append("<div class='post_file' ><div style='height: 70px; width: 100%; border: 1px solid #eaeaea; position: relative;'><img id='download_icon'><dl class='file_div'><dt><a href='#'>파일 이름</a>	</dt><dd style='margin: 0px;'>파일 크기</dd></dl><div class='down_fil' ><a id='down_logo' style='display: inline-block;color: #555;' href='#'>&nbsp;&nbsp;&nbsp;다운로드</a>	</div></div></div>");
}




