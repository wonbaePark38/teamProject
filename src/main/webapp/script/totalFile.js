var dataObj;
$(document)
		.ready(
				function() {
					var filenameStatus = 1;
					var filesizeStatus = 1;
					var writerStatus = 1;
					var updateStatus = 1;
					initFileList();

					$(".downimg").show();
					$(".upimg").hide();

					$('.checkbox-all').click(function() {
						$('.col1-checkbox').prop('checked', this.checked);
					});

					$('.checkbox-all-baduk').click(function() {

						$('.checkbox-baduk').prop('checked', this.checked);
					});

					$("#namesortbt").click(function() {
						console.log('클릭~~');
						if (filenameStatus == 1) {

							$("#namesortbt .downimg").hide();
							$("#namesortbt .upimg").show();
							filenameStatus = 0;
						} else if (filenameStatus == 0) {

							$("#namesortbt .downimg").show();
							$("#namesortbt .upimg").hide();
							filenameStatus = 1;
						}

					});
					$("#sizesortbt").click(function() {

						if (filesizeStatus == 1) {

							$("#sizesortbt .downimg").hide();
							$("#sizesortbt .upimg").show();
							filesizeStatus = 0;
						} else if (filesizeStatus == 0) {

							$("#sizesortbt .downimg").show();
							$("#sizesortbt .upimg").hide();
							filesizeStatus = 1;
						}

					});
					$("#personsortbt").click(function() {

						if (writerStatus == 1) {
							$("#personsortbt .downimg").hide();
							$("#personsortbt .upimg").show();
							writerStatus = 0;
						} else if (writerStatus == 0) {
							$("#personsortbt .downimg").show();
							$("#personsortbt .upimg").hide();
							writerStatus = 1;
						}

					});

					$("#updatesortbt").click(function() {
						console.log('화살표버튼 클릭');
						if (updateStatus == 1) {
							$("#updatesortbt .downimg").hide();
							$("#updatesortbt .upimg").show();
							updateStatus = 0;
						} else if (updateStatus == 0) {
							$("#updatesortbt .downimg").show();
							$("#updatesortbt .upimg").hide();
							updateStatus = 1;
						}

					});

					$("#updatesortbt-baduk").click(function() {
						console.log('화살표버튼 클릭');
						if (updateStatus == 1) {
							$("#updatesortbt-baduk .downimg").hide();
							$("#updatesortbt-baduk .upimg").show();
							updateStatus = 0;
						} else if (updateStatus == 0) {
							$("#updatesortbt-baduk .downimg").show();
							$("#updatesortbt-baduk .upimg").hide();
							updateStatus = 1;
						}

					});

					$("#namesortbt-baduk").click(function() {
						console.log('화살표버튼 클릭');
						if (updateStatus == 1) {
							$("#namesortbt-baduk .downimg").hide();
							$("#namesortbt-baduk .upimg").show();
							updateStatus = 0;
						} else if (updateStatus == 0) {
							$("#namesortbt-baduk .downimg").show();
							$("#namesortbt-baduk .upimg").hide();
							updateStatus = 1;
						}

					});

					$(document)
							.on(
									'click',
									'.totalTypeBt',
									function() {
										console.log($(
												'#filetypeSelectContainer')
												.css('display'));
										$('#filetypeSelectContainer').css(
												'display') == 'none' ? $(
												'#filetypeSelectContainer')
												.css('display', 'block') : $(
												'#filetypeSelectContainer')
												.css('display', 'none')
									});

					$(document).on(
							'click',
							"#listSortBt",
							function() { // 리스트보기 버튼 클릭했을때 바둑판형 가리기
								$('#listSortBt').css('backgroundColor',
										'#615cba');
								$('#badukSortBt').css('backgroundColor',
										'#e4e7eb');
								$('.baduk-main-article-container').css(
										'display', 'none');
								$('.list-main-article-container').css(
										'display', 'block');
							});

					$(document).on(
							'click',
							"#badukSortBt",
							function() { // 바둑판 보기 클릭했을때 리스트형 가리기
								$('#listSortBt').css('backgroundColor',
										'#e4e7eb');
								$('#badukSortBt').css('backgroundColor',
										'#615cba');

								$('.list-main-article-container').css(
										'display', 'none');
								$('.baduk-main-article-container').css(
										'display', 'block');
							});

					$(document).on('click', ".moreBt", function() { // 리스트형에서
																	// 히든메뉴
																	// 클릭했을대
						console.log('히든 메뉴 클릭');
						var node = $(this).parent().next();

						style = node.css('display');
						if (node.css('display') == 'none') {
							style = 'block';
							node.css('display', 'block');
						} else {
							style = 'none';
							node.css('display', 'none');
						}
					});

					/* 사이드바 메뉴에서 프로젝트 클릭할때 div 추가 삭제 함수 */
					$(document)
							.on(
									'click',
									".projectNameBt",
									function() {
										console.log('버튼클릭' + dataObj);
										var buttonValue = this.value;
										$('#changePathArea').text(buttonValue);

										$('.list-main-article-container')
												.children('.tableRow').remove();
										$('.baduk-sort-div').children(
												'.item-info').remove();

										$
												.each(
														dataObj,
														function(index, element) {// 전체
																					// 프로젝트가
																					// 아닌
																					// 프로젝트
																					// 이름을
																					// 클릭했을때
															if (buttonValue == element.projectName
																	&& buttonValue != '전체 프로젝트') {
																settingList(element); // 클릭한
																						// 프로젝트의
																						// 내용을
																						// 컨텐츠
																						// 화면에
																						// 출력
															}
															if (buttonValue == '전체 프로젝트') { // 전체
																							// 프로젝트
																							// 클릭했다면
																$(
																		'.list-main-article-container')
																		.children(
																				'.tableRow')
																		.remove(); // 그전에
																					// 찍어논것
																					// 제거하고
																$(
																		'.baduk-sort-div')
																		.children(
																				'.item-info')
																		.remove();
																$
																		.each(
																				dataObj,
																				function(
																						index,
																						element) { // db에서
																									// 가저온
																									// 파일들
																									// 컨텐츠
																									// 부분에
																									// 모두
																									// 세팅
																					settingList(element);
																				});
															}
														});
									});
				});

/* 카테고리 설정 */
function initFileList() {
	getFileList().done(function(data) {
		dataObj = data; // db에서 받아온 데이터 전역변수에 넣고
		var projectList = [];
		$.each(data, function(index, element) {
			settingList(element); // 메인 아티클에 프로젝트별 파일 목록 삽입 함수 호출
			projectList.push(element.projectName);
		}); // end each
		settingProjectId(projectList);
		// 사이드바 프로젝트 리스트에 프로젝트 리스트값 삽입 함수 호출
	});
}
function getFileList() { // 페이지가 열리면 ajax로 서버와 통신해서 db에서 로그인한 사람이 들어가있는 파일 관련
							// 목록 json형태로 가저옴
	const deffered = $.Deferred();
	var list = [];
	$.ajax({
		url : 'fileSearch.do',
		method : 'GET',

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

/* db에서 받아온 파일 리스트 div 추가 함수 */
function settingList(element) {
	var date = new Date(element.writeDate);
	date = getFormatDate(date);
	var fileTypeImg = getFileType(element.fileName);

	$('.list-main-article-container')
			.append(
					"<div class='tableRow'>"
							+ "<div class='cell col1'>"
							+ "<input type='checkbox' name='box' class='col1-checkbox'>"
							+ "</div>" + "<div class='cell col2'>"
							+ element.fileName
							+ "</div>"
							+ "<div class='cell col3'>32 b</div>"
							+ "<div class='cell col4'>"
							+ element.writer
							+ "</div>"
							+ "<div class='cell col5'>"
							+ date
							+ "</div>"
							+ "<div class='cell col6'>"
							+ "<button class='moreBt'>"
							+ "<img src='images/more_color_select_on.png'>"
							+ "</button>"
							+ "</div><!--end cell col6-->"
							+ "<div class='moreMenuContainer'>"
							+ "<div class='hiddenMenu'>"
							+ "<button class='moreMenuDownloadBt' type='button' onclick='test()' alt='다운로드'>"
							+ "<span class='moreMenuDownloadSpan'></span> 다운로드"
							+ "</button>"
							+ "<button class='moreMenuOpenBt' type='button' onclick='test()' alt='열기'>"
							+ "<span class='moreMenuOpenSpan'></span>열기"
							+ "</button>"
							+ "<button class='moreMenuDetailViewBt' type='button' onclick='test()' alt='상세보기'>"
							+ "<span class='moreMenuDetailViewSpan'></span>상세보기"
							+ "</button>" + "</div>" + "</div>" + "</div>");

	$('.baduk-sort-div')
			.append(
					"<div class=item-info>"
							+ "<div class='check-box-baduk'>"
							+ "<input type='checkbox' class='checkbox-baduk' style='margin-left: 5px;'>"
							+ "<button class='moreBt'>"
							+ "<img src='images/more_color_select_on.png'>"
							+ "</button>"
							+ "</div>"
							+ "<div class='moreMenuContainer'>"
							+ "<div class='hiddenMenu'>"
							+ "<button class='moreMenuDownloadBt' type='button' onclick='test()' alt='다운로드'>"
							+ "<span class='moreMenuDownloadSpan'></span> 다운로드"
							+ "</button>"
							+ "<button class='moreMenuOpenBt' type='button' onclick='test()' alt='열기'>"
							+ "<span class='moreMenuOpenSpan'></span>열기"
							+ "</button>"
							+ "<button class='moreMenuDetailViewBt' type='button' onclick='test()' alt='상세보기'>"
							+ "<span class='moreMenuDetailViewSpan'></span>상세보기"
							+ "</button>" + "</div>" + "</div>"
							+ "<div class='item-bt'>" + "<img src="
							+ fileTypeImg + ">" + "</div>"
							+ "<div class='file-name'>" + element.fileName
							+ "</div>" + "</div>" + "");
}

/* 사이드바에 가입된 프로젝트 리스트 div추가 */
function settingProjectId(projectList) {
	var uniqueList = [];
	$
			.each(
					projectList,
					function(key, value) {
						if ($.inArray(value, uniqueList) === -1) { // db에서 가저온
																	// 값중에서
																	// projectList가
																	// 같은 값은 제거
																	// 하고 화면에 출력
							uniqueList.push(value);
							$('#totalBtList')
									.after(
											"<li> <div class='totalProjectDiv'> "
													+ "<span class='colorIconUserProject'></span> "
													+ "<input type='button' class='projectNameBt'/></div></li>");
							$('#totalBtList').next().children().children()
									.next().val(value);
						}

					});
}

/* db에서 가저온 파일 확장자에 따라서 아이콘 경로 지정 */
function getFileType(fileName) {
	var strArray = fileName.split('.');
	var fileType = strArray[1];
	var filePath;

	switch (fileType) {
	case "HWP":
		filePath = 'images/filemoa_ico12.png';
		break;
	case "PPT":
		filePath = 'images/filemoa_ico06.png';
		break;
	case "JPG":
		filePath = 'images/filemoa_ico07.png';
		break;
	case "PNG":
		filePath = 'images/filemoa_ico07.png';
		break;
	case "GIF":
		filePath = 'images/filemoa_ico07.png';
		break;
	case "XLS":
		filePath = 'images/filemoa_ico05.png';
		break;
	case "ZIP":
		filePath = 'images/filemoa_ico11.png';
		break;
	case "TXT":
		filePath = "images/filemoa_ico13.jpg";
		break;

	}

	return filePath;
}
function test() {
	alert('클릭');
}
/* 날짜 형식 바꿔주는 함수 */
function getFormatDate(date) {
	var year = date.getFullYear(); // yyyy
	var month = (1 + date.getMonth()); // M
	month = month >= 10 ? month : '0' + month; // month 두자리로 저장
	var day = date.getDate(); // d
	day = day >= 10 ? day : '0' + day; // day 두자리로 저장
	return year + '/' + month + '/' + day; // '-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
/* db에서 데이터 가저오기 */
