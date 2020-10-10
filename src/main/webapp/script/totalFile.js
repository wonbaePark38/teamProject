var dataObj; //ajax로 받아온 데이터 다른 함수에서 가공하기 쉽게 전역에 복사본 설정
var presentList = []; // 현재 화면에 뿌려져 있는 데이터만 저장하는 배열

$(document).ready(function(){
	  var filenameStatus = 1;  
	  var filesizeStatus = 1;
	  var writerStatus = 1;
	  var updateStatus = 1;
	  initFileList();
	  var idx;
	  /* 받아온 데이터 설정  */
	  function initFileList() {
		  getFileList().done(function(data) {
			  dataObj = data; //db에서 받아온 데이터 전역변수에 넣고
			  var projectList = [];
			  $.each(data,function(index,element) {
				  
				  settingList(index,element); // 메인 아티클에 프로젝트별 파일 목록 삽입 함수 호출
				  projectList.push(element.projectName); //임시 배열에 프로젝트 이름만 푸쉬
				  presentList.push(element);//복사본 배열 생성
			  }); //end each
			  settingProjectId(projectList);
			  $('#changePathArea').text('전체 프로젝트');
			  //사이드바 프로젝트 리스트에 프로젝트 리스트값 삽입 함수 호출 
		  });
	  }

	  function getFileList() { //페이지가 열리면 ajax로 서버와 통신해서 db에서 로그인한 사람이 들어가있는 파일 관련 목록 json형태로 가저옴  
		  const deffered = $.Deferred();
		  var list = [];
		  $.ajax({
			  url: 'fileSearch.do',
			  method: 'POST',

		  }).done(function(data) {
			  $.each(data, function(i, e) {
				  list.push(e);
			  });
			  deffered.resolve(list);
		  }).fail(function(err) {
			  alert('파일 목록을 불러오는데 실패하였습니다.');
			  deffered.reject(err);
		  });
		  return deffered.promise();
	  }

	  $(".downimg").show();
	  $(".upimg").hide();

	  $('.checkbox-all').change(function(){
		  if($('.checkbox-all').is(":checked")){
			  $('.col1-checkbox').prop('checked',true);
			  $('#downloadAllBt').css('opacity','1');
		  }else{
			  $('.col1-checkbox').prop('checked',false);
			  $('#downloadAllBt').css('opacity','0.3');
		  }
		 
		  
	  });

	  $('.checkbox-all-baduk').change(function(){
		  if($('.checkbox-all-baduk').is(":checked")){
			 
			  $('.checkbox-baduk').prop('checked',true);
			  $('#downloadAllBt').css('opacity','1');
		  }else{
			  $('.checkbox-baduk').prop('checked',false);
			  $('#downloadAllBt').css('opacity','0.3');
		  }
		  
	  });
	  
	  
	  $(document).on('change','.col1-checkbox',function(){
		  if($('.col1-checkbox').is(":checked")){
			  $('#downloadAllBt').css('opacity','1');
		  }else{
			  $('#downloadAllBt').css('opacity','0.3');
		  }
	  });
	  
	  $(document).on('change','.checkbox-baduk',function(){
		  if($('.checkbox-baduk').is(":checked")){
			  $('#downloadAllBt').css('opacity','1');
		  }else{
			  $('#downloadAllBt').css('opacity','0.3');
		  }
	  });
	  
	  
	  //검색기능 이벤트
	  $("#inputkeyword").keyup(function(e){
		  var keyword = $(this).val();
		  $(".tableRow").hide();
		  $(".item-info").hide();
		  var listDiv = $(".cell:contains('" + keyword + "')");
		  var badukDiv = $(".file-name:contains('" + keyword + "')");
		  $(listDiv).parent().show();
		  $(badukDiv).parent().show();
	  });


	  //컨테츠 메뉴 td에서 클릭했을때 이벤트
	  $("#namesortbt").click(function(){
		  removeFileList();//화면에 뿌려진 내용 삭제
		  var sortList = presentList;//배열 복사본 생성

		  if(filenameStatus==1){ // 오름차순 정렬
			  $("#namesortbt .downimg").hide(); //체인지
			  $("#namesortbt .upimg").show();
			  filenameStatus=0;
			  sortList.sort(function(a,b){
				  return(a.fileName > b.fileName)? -1 : (a.fileName < b.fileName) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });


		  }else if(filenameStatus==0){ //내림차순 정렬

			  $("#namesortbt .downimg").show();
			  $("#namesortbt .upimg").hide();
			  filenameStatus=1;

			  sortList.sort(function(a,b){
				  return(a.fileName < b.fileName)? -1 : (a.fileName > b.fileName) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }
	  });
	  
	  $("#sizesortbt").click(function(){
		  removeFileList();//화면에 뿌려진 내용 삭제
		  var sortList = presentList;//배열 복사본 생성
		  if(filesizeStatus==1){

			  $("#sizesortbt .downimg").hide();
			  $("#sizesortbt .upimg").show();
			  filesizeStatus=0;
			  sortList.sort(function(a,b){
				  return(a.fileSize > b.fileSize)? -1 : (a.fileSize < b.fileSize) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }else if(filesizeStatus==0){

			  $("#sizesortbt .downimg").show();
			  $("#sizesortbt .upimg").hide();
			  filesizeStatus=1;

			  sortList.sort(function(a,b){
				  return(a.fileSize < b.fileSize)? -1 : (a.fileSize > b.fileSize) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }
	  });
	  
	  $("#personsortbt").click(function(){
		  removeFileList();//화면에 뿌려진 내용 삭제
		  var sortList = presentList;//배열 복사본 생성
		  if(writerStatus==1){
			  $("#personsortbt .downimg").hide();
			  $("#personsortbt .upimg").show();
			  writerStatus=0;
			  sortList.sort(function(a,b){
				  return(a.writer > b.writer)? -1 : (a.writer < b.writer) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }else if(writerStatus==0){
			  $("#personsortbt .downimg").show();
			  $("#personsortbt .upimg").hide();
			  writerStatus=1;

			  sortList.sort(function(a,b){
				  return(a.writer < b.writer)? -1 : (a.writer > b.writer) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });
		  }

	  });

	  $("#updatesortbt").click(function(){
		  removeFileList();//화면에 뿌려진 내용 삭제
		  var sortList = presentList;//배열 복사본 생성  
		  if(updateStatus==1){
			  $("#updatesortbt .downimg").hide();
			  $("#updatesortbt .upimg").show();
			  updateStatus=0;

			  sortList.sort(function(a,b){
				  return(a.writeDate > b.writeDate)? -1 : (a.writeDate < b.writeDate) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });


		  }else if(updateStatus==0){
			  $("#updatesortbt .downimg").show();
			  $("#updatesortbt .upimg").hide();
			  updateStatus=1;


			  sortList.sort(function(a,b){
				  return(a.writeDate < b.writeDate)? -1 : (a.writeDate > b.writeDate) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }

	  });

	  $("#updatesortbt-baduk").click(function(){
		  removeFileList();//화면에 뿌려진 내용 삭제
		  var sortList = presentList;//배열 복사본 생성
		  if(updateStatus==1){
			  $("#updatesortbt-baduk .downimg").hide();
			  $("#updatesortbt-baduk .upimg").show();
			  updateStatus=0;

			  sortList.sort(function(a,b){
				  return(a.writeDate > b.writeDate)? -1 : (a.writeDate < b.writeDate) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }else if(updateStatus==0){
			  $("#updatesortbt-baduk .downimg").show();
			  $("#updatesortbt-baduk .upimg").hide();
			  updateStatus=1;

			  sortList.sort(function(a,b){
				  return(a.writeDate < b.writeDate)? -1 : (a.writeDate > b.writeDate) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }

	  });

	  $("#namesortbt-baduk").click(function(){
		  removeFileList();//화면에 뿌려진 내용 삭제
		  var sortList = presentList;//배열 복사본 생성
		  if(updateStatus==1){
			  $("#namesortbt-baduk .downimg").hide();
			  $("#namesortbt-baduk .upimg").show();
			  updateStatus=0;
			  sortList.sort(function(a,b){
				  return(a.fileName > b.fileName)? -1 : (a.fileName < b.fileName) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });
		  }else if(updateStatus==0){
			  $("#namesortbt-baduk .downimg").show();
			  $("#namesortbt-baduk .upimg").hide();
			  updateStatus=1;

			  sortList.sort(function(a,b){
				  return(a.fileName < b.fileName)? -1 : (a.fileName > b.fileName) ? 1:0;
			  });
			  $.each(sortList, function(index,element){
				  settingList(index,element);
			  });

		  }

	  });



	  $(document).on('click',"#listSortBt", function(){ //리스트보기 버튼 클릭했을때 바둑판형 가리기
		  $('#listSortBt').css('backgroundColor','#615cba');
		  $('#badukSortBt').css('backgroundColor','#e4e7eb');
		  $('.baduk-main-article-container').css('display','none');
		  $('.list-main-article-container').css('display','block');
	  });

	  $(document).on('click',"#badukSortBt", function(){ //바둑판 보기 클릭했을때 리스트형 가리기
		  $('#listSortBt').css('backgroundColor','#e4e7eb');
		  $('#badukSortBt').css('backgroundColor','#615cba');

		  $('.list-main-article-container').css('display','none');
		  $('.baduk-main-article-container').css('display','block');
	  });


	  $(document).on('click',".moreBt", function(){ //리스트형에서 히든메뉴 클릭했을대
		  var node = $(this).parent().next();

		  node.toggle(
				  function(){node.addClass('show')},
				  function(){node.addClass('hide')}
		  );

	  });
	  
	  $('body').on('click',function(e){ //히든 메뉴 열려있을때 바디 클릭하면 닫히는 이벤트

		  var targetPoint = $(e.target);
		  var popArea = targetPoint.hasClass('moreMenuContainer');
		  var modal = targetPoint.hasClass('modal');
		  var fileModal = targetPoint.hasClass('file-modal');
			  if(!popArea){
				  $('.moreMenuContainer').hide();
			  }  
			  if(modal){
				  $('.modal').hide();
			  }
		  	  if(fileModal){
		  		$('.file-modal').hide();
		  	  }
	  });
	  
	  $(document).on('click','#downloadAllBt',function(){ //헤더의 다운로드 버튼 눌렀을때 이벤트

		  var obj = document.getElementsByName('box');
		  var objBaduk = document.getElementsByName('box-baduk');
		  
		  if($(".baduk-main-article-container").css('display') == 'block'){ //바둑판 형태일때
			 
			  $.each(presentList,function(index,element){
				 
				  if(obj[index + presentList.length].checked == true){//체크박스 체크된 파일중에서
					  if(element.downProhibition == 'y'){//다운로드 금지 상태인 파일
						  alert('다운로드 금지된 파일이 있습니다.'+ element.fileName);
						  return false;
					  }
					  location.href = 'fileDownload.do?articleId='+element.articleId;
					  fnSleep(100);
				  }
			  });
		  }else{//리스트 형태일때
			 
			  $.each(presentList,function(index,element){ 
				 
				  if(obj[index].checked == true){ //체크박스 체크된 파일중에서
					  if(element.downProhibition == 'y'){  //다운로드 금지 상태인 파일
						  alert('다운로드 금지된 파일이 있습니다.'+ element.fileName);
						  return false;
					  }
					  location.href = 'fileDownload.do?articleId='+element.articleId;
					  fnSleep(1000);
				  }
			  });
		  }
		  
		  
	  });

	  
	 
	//히든메뉴 다운로드 클릭 이벤트
	  $(document).on('click','.moreMenuDownloadBt',function(e){
		  var idx = $('.moreMenuDownloadBt').index(this); //리스트형 게시글의 인덱스
		  var selectedElement;
		  if($(".baduk-main-article-container").css('display') == 'block'){ //바둑판형 게시글 인덱스 구하기
			  tempIdx = $('.moreMenuDownloadBt').index(this);
			  idx = tempIdx - presentList.length;
		  }
		  $.each(presentList,function(index,element){
				 if(idx == index){
					 selectedElement = element;
					 return true;
				 }
			 });
		  if(selectedElement.downProhibition == 'y'){ //download 컨트롤러에 가기전에 다운 금지 파일인지 체크
			  alert('해당 파일은 다운이 금지되어 있습니다 ' + selectedElement.fileName);
			  return false;
		  }
		  window.location = 'fileDownload.do?articleId='+selectedElement.articleId;
	  });
	  
	  $(document).on('click', '.modalDownloadBt',function(e){
		  var selectedModalElement;
		  $.each(presentList,function(index,element){
				 if(idx == index){
					 selectedModalElement = element;
					 return false;
				 }
		  });
		  if(selectedModalElement.downProhibition == 'y'){ //download 컨트롤러에 가기전에 다운 금지 파일인지 체크
			  alert('해당 파일은 다운이 금지되어 있습니다 ' + selectedModalElement.fileName);
			  return false;
		  }
		  location.href = 'fileDownload.do?articleId='+selectedModalElement.articleId;
		  
	  });
	  
	  
	  $(document).on('click','.moreMenuDetailViewBt',function(e){
		  idx = $('.moreMenuDetailViewBt').index(this); //리스트형 게시글의 인덱스
		  if($(".baduk-main-article-container").css('display') == 'block'){ //바둑판형 게시글 인덱스 구하기
			  tempIdx = $('.moreMenuDetailViewBt').index(this);
			  idx = tempIdx - presentList.length;
		  }
		  
		  $.each(presentList,function(index,element){
			 if(idx == index){
				 makeDetailView(element);
				 return false;
			 }
		 });
	  });
	  
	  /*사이드바 메뉴에서 프로젝트 클릭할때 div 추가 삭제 함수*/
	  $(document).on('click',".projectNameBt", function(){

		  var buttonValue = this.value;
		  $('#changePathArea').text(buttonValue); //선택 프로젝트 이름 헤더에 출력

		  $('.list-main-article-container').children('.tableRow').remove(); //그전에 띄워논거 지움
		  $('.baduk-sort-div').children('.item-info').remove();
		  removeArray();

		  $.each(dataObj,function(index,element) {//전체 프로젝트가 아닌 프로젝트 이름을 클릭했을때
			  if(buttonValue == element.projectName){
				  settingList(index,element); //클릭한 프로젝트의 내용을 컨텐츠 화면에 출력
				  presentList.push(element);
			  }
			  if(buttonValue == '전체 프로젝트'){ //전체 프로젝트 클릭했다면
				  settingList(index,element);
				  presentList.push(element);
			  }
		  });

	  });


	  $(document).on('click','.totalTypeBt',function(){ //사이드바 모든 포맷 버튼 클릭했을때 이벤트
		  //파일 타입 버튼 div 출력하거나 닫음
		  $('#filetypeSelectContainer').css('display') == 'none' ? $('#filetypeSelectContainer').css('display','block') : $('#filetypeSelectContainer').css('display','none');
		  var buttonValue = this.value; //현재 선택한 파일 포맷 buttonValue에 저장		 

		  var selectedProjectName = $('#changePathArea').text(); 
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();

		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){
				  settingList(index,element);
				  presentList.push(element);
			  });
		  }else if(selectedProjectName != '전체 프로젝트'){
			  $.each(dataObj,function(index,element){
				  if(element.projectName == selectedProjectName)
					  settingList(index,element);
				  presentList.push(element);
			  });
		  }

	  });

	  $(document).on('click', '#pptBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');//파일이름 . 구분자로 자름
				  var dataFileType = strArray[1]; //확장자 저장
				  if(dataFileType == 'ppt' || dataFileType == 'pptx'){ //확장자가 ppt인 파일만
					  settingList(index,element);   //화면에 출력
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && (dataFileType == 'ppt' || dataFileType == 'pptx')){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#pdfBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'pdf'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && dataFileType == 'pdf'){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#hangeulBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'hwp'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && dataFileType == 'hwp'){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#wordBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'doc' || dataFileType == 'docx'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && (dataFileType == 'doc' || dataFileType == 'docx')){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#excelBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'xls'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && dataFileType == 'xls'){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#imgBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'png' || dataFileType == 'jpg' || dataFileType == 'gif'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && (dataFileType == 'png' || dataFileType == 'jpg' || dataFileType == 'gif')){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });
	
	  $(document).on('click', '#htmlBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'html'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && dataFileType == 'html'){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#archiveBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'zip'){
					  settingList(index,element);
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && dataFileType == 'zip'){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });
		  }

	  });

	  $(document).on('click', '#cadBt',function(){
		  removeFileList();//리스트 기존 내용 제거 해주는 함수
		  removeArray();
		  $('#filetypeSelectContainer').css('display','none');
		  var selectedProjectName = $('#changePathArea').text();
		  if(selectedProjectName == '전체 프로젝트'){
			  $.each(dataObj,function(index,element){

				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(dataFileType == 'dwg'){
					  settingList(index,element); 
					  presentList.push(element);
				  }
			  });
		  }else{
			  $.each(dataObj,function(index,element){
				  var strArray = element.fileName.split('.');
				  var dataFileType = strArray[1];
				  if(element.projectName == selectedProjectName && dataFileType == 'dwg'){
					  settingList(index,element);
					  presentList.push(element);
				  } 
			  });//end each
		  }//end else

	  });//end event
	  
	  $('#closeBt').click(function(){
		  location.href='projectdir.do';
	  })
	  
	  $(document).on('click','.moreMenuOpenBt',function(){
		  $('.file-modal *').remove();
		  var articleId = $(this).children('.articleId').val();
		  var sendData ={
				  articleId : articleId
		  }	
		  var filePath ="";
		  $.ajax({
			  type :'POST',
			  url :'getRealPath.do',
			  data : sendData
		  }).done(function(data){
			  var fileName = data.fileName;
			  var filePath = data.filePath;
			  var fileArr = filePath.split('/');
			  var realFileName = fileArr[fileArr.length-1];
			  var src = "http://ec2-13-124-251-3.ap-northeast-2.compute.amazonaws.com/plugProject/upload/"+data.projectId+"/"+ realFileName;

			  var fileTypeArr = fileName.split('.');
			  var fileType = fileTypeArr[1];
			  if(fileType == 'png' || fileType == 'gif' || fileType == 'jpg'){
				  $('.file-modal').css('display','block');
				  $('.file-modal').append(
						  "<div class='file-modal-content'>" +
						  "<img src="+ src + ">"+
						  "</div>"
				  );
			  }else if(fileType == 'ppt' || fileType == 'doc' || fileType == 'docx' || fileType == 'pdf' || fileType == 'pptx'  || fileType == 'xls' || fileType == 'xlsx' || fileType == 'txt'){
				  $('.file-modal').css('display','block');
				   $('.file-modal').append(
				"<iframe src='https://docs.google.com/gview?url=http://ec2-13-124-251-3.ap-northeast-2.compute.amazonaws.com/plugProject/upload/"+data.projectId+'/'+realFileName+"&embedded=true' class=file-view>"+
				"</iframe>"
				  );
			  }else{
				  alert('지원 되지 않는 확장자입니다.');
			  }
		  }).fail(function(){
			  alert('경로 받아오기 실패');
		  });
		  
		   
		 
		
	  });

});
fnSleep = function (delay){
    
    var start = new Date().getTime();
    while (start + delay > new Date().getTime());

};

function removeArray(){ //전역에 선언한 화면에 출력할 배열 기존 요소 삭제
	presentList.splice(0,presentList.length);
}

function removeFileList(){ //버튼 클릭했을때 그전에 있던 리스트 지워주는 함수
	 $('.list-main-article-container').children('.tableRow').remove(); //그전에 띄워논거 지움
	 $('.baduk-sort-div').children('.item-info').remove();
}


/*db에서 받아온 파일 리스트 div 추가 함수*/
function settingList(index,element){
	 var date = new Date(element.writeDate);
	  date = getFormatDate(date);
	  var fileTypeImg = getFileType(element.fileName);
	  var fileName = element.filaName;
	$('.list-main-article-container').append(
			"<div class='tableRow'>" +
				"<input type='hidden' class='download-status' value=" + element.downProhibition + ">" +
	  			"<div class='cell col1'>"+
	  				"<input type='checkbox' name='box' class='col1-checkbox'>" +
	  			"</div>" +
	  			
	  			"<div class='cell col2'>" +
	  				"<div>&nbsp; &nbsp;<img src="+fileTypeImg +"></div>" +
	  				"<div class='file-name-div' style='padding-left:40px;'>"+element.fileName+"</div>"+
	  			"</div>" +
	  			
	  			"<div class='cell col3'>"+element.fileSize +"</div>" +
	  			"<div class='cell col4'>"+element.writer+"</div>" +
	  			"<div class='cell col5'>"+date+"</div>" +
	  			"<div class='cell col6'>" +
	  				"<button class='moreBt'>" +
	  					"<img src='images/more_color_select_on.png'>" +
	  				"</button>" +
	  			"</div><!--end cell col6-->" +
	  			"<div class='moreMenuContainer'>" +
	  				"<div class='hiddenMenu'>" +
	  					"<button class='moreMenuDownloadBt' type='button'  alt='다운로드'>" +
	  						"<span class='moreMenuDownloadSpan'></span> 다운로드" +
	  					"</button>" +
	  					"<button class='moreMenuOpenBt' type='button'  alt='열기'>" +
	  						"<input type='hidden'class='articleId' value="+element.articleId+">"+
	  						"<span class='moreMenuOpenSpan'></span>열기" +
	  						""+
	  						"<div class='iframe-wrap'>"+
	  						
	  						"</div>" +
	  					"</button>" +
	  					"<button class='moreMenuDetailViewBt' type='button'  alt='상세보기'>" +
	  						"<span class='moreMenuDetailViewSpan'>" +
	  						"</span>상세보기" +
	  					"</button>" +
	  				"</div>" +
	  			"</div>" +
	  		"</div>"
	  	);
	
	
	  $('.baduk-sort-div').append(
			  "<div class=item-info>" +
			  	"<div class='check-box-baduk'>" +
			  		"<input type='hidden' class='download-status' value=" + element.downProhibition + ">" +
			  		"<input type='checkbox' name='box' class='checkbox-baduk' style='margin-left: 5px;'>" +
			  		"<button class='moreBt'>" +
			  			"<img src='images/more_color_select_on.png'>" +
			  		"</button>" +
			  	"</div>" +
			  	"<div class='moreMenuContainer'>" +
			  		"<div class='hiddenMenu'>" +
			  			"<button class='moreMenuDownloadBt' type='button' alt='다운로드'>" +
			  				"<span class='moreMenuDownloadSpan'></span> 다운로드" +
			  			"</button>" +
			  			"<button class='moreMenuOpenBt' type='button' alt='열기'>" +
			  			"<input type='hidden' class='articleId' value="+element.articleId+">"+
			  				"<span class='moreMenuOpenSpan'>" +
			  				"</span>열기" +
			  			"</button>" +
			  			"<button class='moreMenuDetailViewBt' type='button' alt='상세보기'>" +
			  				"<span class='moreMenuDetailViewSpan'></span>상세보기" +
			  			"</button>" +
			  		"</div>" +
			  	"</div>" +
			  "<div class='item-bt'>" +
			  	"<img src="+fileTypeImg+">" +
			  "</div>" +
			  "<div class='file-name'>"+ element.fileName +"</div>" +
			 "</div>" 
	  );
	
}
//파일 열기 모달창 생성
function makeOpenFileView(articleId){
	var winObject = null;
	$('file-modal').css('display','block');
}



//디테일 뷰 모달창 생성
function makeDetailView(element){
	$('.modal *').remove();
	var date = new Date(element.writeDate);
	  date = getFormatDate(date);
	  var fileTypeImg = getFileType(element.fileName);
	 $('.modal').append(
			  "<div class='modal-content'>" +
			  	"<div class='modal-header'>" +
			  		"<span>상세보기</span>" +
			  	"</div>" +
			  	"<div class='modal-file-info-div'>" +
			  		"<img src="+fileTypeImg +">" +
			  		"<div class='modal-file-name-div'>" +
			  		"<div class='modal-file-name'>" + element.fileName+
			  		"</div>" +
			  		"<div class='modal-file-size'>"+ element.fileSize+
			  		"</div>" +
			  	"</div>" +
			  	"<div class='modal-icon-div'>" +
			  		"<button type='button' class='modalDownloadBt'>"  +
			  			"<i class='fas fa-download' style='color:#615cba; font-size: 25px;'></i>" +
			  			"<span>다운로드</span>" +
			  		"</button>" +
			  	"</div>" +
			  "</div>" +
			  "<div class='modal-update-info-div'>" +
			  	"<div class='modal-writer-info'>" +
			  		"<span>등록자 &nbsp;:&nbsp;"+element.writer+"</span>" +
			  	"</div>" +
			  	"<div class='modal-write-date'>" +
			  		"<span>등록일자&nbsp;:&nbsp;"+date+"</span>" +
			  	"</div>" +
			  "</div>" +
			 "<div class='modal-project-info-div'>" +
			 	"<div class='madal-project-info-title'>" +
			 	"첨부된 프로젝트" +
			 "</div>" +
			 "<div class='modal-project-info-content'>" +
			 	"<div>" + element.projectName+
			 	"</div>" +
			 	"<div>" +
			 	"<a href=mainpage.do?project_id="+element.projectId+'#'+element.articleId +">> 글 바로가기 >></a>" +
			 	"</div>" +
			 "</div>" +
			"</div>" +
		"</div>"
	  );
	 $('.modal').css('display','block');
}

/*사이드바에 가입된 프로젝트 리스트 div추가*/
function settingProjectId(projectList){
	var uniqueList=[];
	$.each(projectList, function(key, value){
		if($.inArray(value, uniqueList) === -1){ //db에서 가저온 값중에서 projectList가 같은 값은 제거 하고 화면에 출력
			uniqueList.push(value); 
			$('#totalBtList').after("<li> <div class='totalProjectDiv'> " +
		  			"<span class='colorIconUserProject'></span> " +
		  		"<input type='button' class='projectNameBt'/></div></li>");
			$('#totalBtList').next().children().children().next().val(value);
		}
		
	});
}



/*db에서 가저온 파일 확장자에 따라서 아이콘 경로 지정*/
function getFileType(fileName){
	 var strArray = fileName.split('.');
	 var fileType = strArray[1];
	 var filePath;
	
	 switch(fileType){
	 	case "pdf":
	 		filePath = 'images/filemoa_ico03.png';
	 			break;
	 	case "doc" || "docx":
	 		filePath = 'images/filemoa_ico04.png';
	 			break;
	 	case "hwp":
	 		filePath = 'images/filemoa_ico12.png';
	 			break;
	 	case "ppt" || "pptx":
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
	 	case "txt":
	 		filePath = "images/filemoa_ico13.jpg";
	 			break;
	 	default:
	 		filePath = "images/filemoa_default.png";
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
