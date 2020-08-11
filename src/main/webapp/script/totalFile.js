var dataObj;
$(document).ready(function(){
	initFileList();
	
	
	 $(".downimg").show();
     $(".upimg").hide();
    
	 $(document).on('click',"#listSortBt", function(){
	      $('#listSortBt').css('backgroundColor','#615cba');
	      $('#badukSortBt').css('backgroundColor','#e4e7eb');
	      $('.baduk-main-article-container').css('display','none');
	      $('.list-main-article-container').css('display','block');
	  });
	  
	  $(document).on('click',"#badukSortBt", function(){
		  console.log('바둑버튼');
	      $('#listSortBt').css('backgroundColor','#e4e7eb');
	      $('#badukSortBt').css('backgroundColor','#615cba');
	      
	      $('.list-main-article-container').css('display','none');
	      $('.baduk-main-article-container').css('display','block');
	  });
	  
	  
	  $(document).on('click',".moreBt", function(){
	      console.log('히든 메뉴 클릭');
	      var node = $(this).parent().next();
	      
	      style = node.css('display');
	      if( node.css('display') == 'none'){
	        style = 'block';
	        node.css('display','block');
	      }else{
	        style='none';
	        node.css('display','none');
	      }
	});
	  
	  
	  /*사이드바 메뉴에서 프로젝트 클릭할때 div 추가 삭제 함수*/
	  $(document).on('click',".projectNameBt", function(){
		  console.log('버튼클릭'+dataObj);
		  var buttonValue = this.value;
		  $('#changePathArea').text(buttonValue);
		  
		  $('.list-main-article-container').children('.tableRow').remove();
		  $('.baduk-sort-div').children('.item-info').remove();
		  

		  $.each(dataObj,function(index,element) {
			  if(buttonValue == element.projectId && buttonValue != '전체 프로젝트'){
				  settingList(element);
			  }
			  if(buttonValue == '전체 프로젝트'){
				  $('.list-main-article-container').children('.tableRow').remove();
				  $('.baduk-sort-div').children('.item-info').remove();
				  $.each(dataObj,function(index,element){
					  settingList(element);
				  });
			  }
		  });
	  });
});

/* 카테고리 설정 */
function initFileList() {
   getFileList().done(function(data) {
	   dataObj = data;
	  $.each(data,function(index,element) {
		  var filenameStatus = 1;  
    	  settingProjectId(element);
    	  settingList(element);
    	  
      }); //end each
   });
}
/*db에서 받아온 파일 리스트 div 추가 함수*/
function settingList(element){
	 var date = new Date(element.writeDate);
	  date = getFormatDate(date);
	  var fileTypeImg = getFileType(element.fileName);
	$('.list-main-article-container').append(
			"<div class='tableRow'>" +
	  			"<div class='cell col1'>" +
	  				"<input type='checkbox' name='box' class='col1-checkbox'>" +
	  			"</div>" +
	  			"<div class='cell col2'>"+ element.fileName +"</div>" +
	  			"<div class='cell col3'>32 b</div>" +
	  			"<div class='cell col4'>"+element.writer+"</div>" +
	  			"<div class='cell col5'>"+date+"</div>" +
	  			"<div class='cell col6'>" +
	  				"<button class='moreBt'>" +
	  					"<img src='images/more_color_select_on.png'>" +
	  				"</button>" +
	  			"</div><!--end cell col6-->" +
	  			"<div class='moreMenuContainer'>" +
	  				"<div class='hiddenMenu'>" +
	  					"<button class='moreMenuDownloadBt' type='button' onclick='test()' alt='다운로드'>" +
	  						"<span class='moreMenuDownloadSpan'></span> 다운로드" +
	  					"</button>" +
	  					"<button class='moreMenuOpenBt' type='button' onclick='test()' alt='열기'>" +
	  						"<span class='moreMenuOpenSpan'></span>열기" +
	  					"</button>" +
	  					"<button class='moreMenuDetailViewBt' type='button' onclick='test()' alt='상세보기'>" +
	  						"<span class='moreMenuDetailViewSpan'></span>상세보기" +
	  					"</button>" +
	  				"</div>" +
	  			"</div>" +
	  		"</div>"
	  	);
	
	
	  $('.baduk-sort-div').append(
			  "<div class=item-info>" +
			  	"<div class='check-box-baduk'>" +
			  		"<input type='checkbox' class='checkbox-baduk' style='margin-left: 5px;'>" +
			  		"<button class='moreBt'>" +
			  			"<img src='images/more_color_select_on.png'>" +
			  		"</button>" +
			  		"</div>" +
			  		"<div class='moreMenuContainer'>" +
			  			"<div class='hiddenMenu'>" +
			  				"<button class='moreMenuDownloadBt' type='button' onclick='test()' alt='다운로드'>" +
			  					"<span class='moreMenuDownloadSpan'></span> 다운로드" +
			  				"</button>" +
			  				"<button class='moreMenuOpenBt' type='button' onclick='test()' alt='열기'>" +
			  					"<span class='moreMenuOpenSpan'></span>열기" +
			  				"</button>" +
			  				"<button class='moreMenuDetailViewBt' type='button' onclick='test()' alt='상세보기'>" +
			  					"<span class='moreMenuDetailViewSpan'></span>상세보기" +
			  				"</button>" +
			  			"</div>" +
			  		"</div>" +
			  	"<div class='item-bt'>" +
			  		"<img src="+fileTypeImg+">" +
			  	"</div>" +
			  	"<div class='file-name'>"+ element.fileName +"</div>" +
			  "</div>" +
			  "");
}

/*사이드바에 가입된 프로젝트 리스트 div추가*/
function settingProjectId(element){
	 $('#totalBtList').after("<li> <div class='totalProjectDiv'> " +
	  			"<span class='colorIconUserProject'></span> " +
	  		"<input type='button' class='projectNameBt'/></div></li>");
	 $('#totalBtList').next().children().children().next().val(element.projectId);
}
/*db에서 가저온 파일 확장자에 따라서 아이콘 경로 지정*/
function getFileType(fileName){
	 var strArray = fileName.split('.');
	 var fileType = strArray[1];
	 var filePath;
	 switch(fileType){
	 	case "hwp":
	 		filePath = 'images/filemoa_ico12.png';
	 			break;
	 	case "ppt":
	 		filePath = 'images/filemoa_ico06.png';
	 			break;
	 	case "jpg":		
	 		filePath = 'images/filemoa_ico07.png';
	 			break;
	 	case "png":
	 		filePath = 'images/filemoa_ico07.png';
 				break;
	 	case "gif":
	 		filePath = 'images/filemoa_ico07.png';
 				break;
	 	case "xls":
	 		filePath = 'images/filemoa_ico05.png';
	 			break;
	 	case "zip":
	 		filePath = 'images/filemoa_ico11.png';
	 			break;
	 }
	 return filePath;
}

/*날짜 형식 바꿔주는 함수*/
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '/' + month + '/' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
/* db에서 데이터 가저오기 */
function getFileList() {
   const deffered = $.Deferred();
   var list = [];
   $.ajax({
      url: 'fileSearch.do',
      method: 'get',
      dataType: 'json'
   }).done(function(data) {
      $.each(data, function(i, e) {
         list.push(e);
     });
     deffered.resolve(list);
   }).fail(function(err) {
      alert('카테고리를 불러오는데 실패하였습니다.');
      deffered.reject(err);
   });
   return deffered.promise();
}