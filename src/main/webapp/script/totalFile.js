$(document).ready(function(){
	$.ajax({
		url: 'fileSearch.do',
		dataType: 'json',
		done:function(){
			console.log('통신완료');
			location.href="totalFile.jsp";  
		},
		fail: function(error){
			alert('통신 실패');
		}
	});
});