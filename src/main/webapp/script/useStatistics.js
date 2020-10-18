/**
 * 프로젝트 관리자 페이지 - 사용 통계페이지 자바스크립트 파일 
 */

$(document).ready(function(){
	
	$.ajax({
		type : "POST",
		url : 'getUseStatistics.do', //이용자 통계 데이터 가져옴
	}).done(function(data){
		console.log(data);
		$.each(data,function(index,element){
			settingList(element);
		});
	}).fail(function(){
		alert('리스트 가져오기 실패');
	});
	
	$(".search-keyword").keyup(function(e){ //검색
		  var searchCondition = $('#select-type').val();
		  var keyword = $(this).val();
		  $('tbody').hide();
		  
		  if(searchCondition == '이름'){
			  var listDiv = $(".name:contains('" + keyword + "')");
		  }else if(searchCondition == '부서'){
			  var listDiv = $(".department:contains('" + keyword + "')");
		  }else if(searchCondition == '직책'){
			  var listDiv = $(".position:contains('" + keyword + "')");
		  }else if(searchCondition == '계정'){
			  var listDiv = $(".email:contains('" + keyword + "')");
		  }
		  $(listDiv).parent().parent().show();
	});	
});

function settingList(element){ //화면 출력
	$('.useStatistics-table').append(
			"<tbody>" +
				"<tr>" +
					"<td class='name'>"+element.name +"</td>" +
					"<td class='email'>"+element.email+"</td>" +
					"<td class='company-name'>"+element.companyName +"</td>" +
					"<td class='department'>"+element.department+"</td>" +
					"<td class='position'>"+element.myPosition+"</td>" +
					"<td class='write-count'>"+element.writeCount+"</td>" +
					"<td class='reply-count'>"+element.replyCount+"</td>" +
				"</tr>" +
			"</tbody>");
}
