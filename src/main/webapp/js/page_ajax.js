function projectPage(url) {
	// ajax option
	var ajaxOption = {
		url : url,
		async : true,
		type : "POST",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 삭제
		$('#ajaxpagecontainer').children().remove();
		// Contents 영역 교체
		$('#ajaxpagecontainer').html(data);
	});
}