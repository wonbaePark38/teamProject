function projectPage(url) {
	// ajax option
	var ajaxOption = {
		url : url,
		async : true,
		type : "GET",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 삭제
		$('#ajaxpagecontainer').children().remove();
		// Contents 영역 교체
		$('#ajaxpagecontainer').html(data);
	});
};

function officePop(url) {
	// ajax option
	var ajaxOption = {
		url : url,
		async : true,
		type : "GET",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 교체
		$('.wrap').append(data);
	});
};

function newprojectPop(url) {
	// ajax option
	var ajaxOption = {
		url : url,
		async : true,
		type : "GET",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 교체
		$('.mainWrap').parent().prepend(data);
	});
	
};
function projectPopdel(){
	$('#new_project_div').remove();
}

function clientQnA() {
	// ajax option
	var ajaxOption = {
			url : "clientQnA.jsp",
			async : true,
			type : "GET",
			dataType : "html",
			cache : false
	};
	
	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 교체
		$('.mainWrap').parent().prepend(data);
	});
};



function invitePop(url) {
	// ajax option
	var ajaxOption = {
		url : url,
		async : true,
		type : "GET",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 교체
		$('.mainWrap').append(data);
	});
};

function pro1(url) {
	
	var papa = document.getElementById('pform');
	
	
	//페이지 전환
	var ajaxOption = {
		url : url,
		async : true,
		type : "GET",
		dataType : "html",
		cache : false
	};

	$.ajax(ajaxOption).done(function(data) {
		// Contents 영역 삭제
		$('#ch2').children().remove();
		// Contents 영역 교체
		$('#ch2').html(data);
	});
	// 페이지 전환
	papa.submit();
};


