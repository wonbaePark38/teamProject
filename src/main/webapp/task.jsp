<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<title>Plug</title>
<link href="css/write_completion.css" rel="stylesheet">
<link href="css/mainPage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="script/totalTask.js"></script>
</head>
<body style="background-color:rgb(242, 242, 242);">
<jsp:include page='privateConfigHeader.jsp'></jsp:include>
	<div class="container">
		<div>
			<!-- 업무 메뉴 -->
			<div id="task_menu">
				<div>
					<div>
						<div name="${taskTypes}" class="taskTypes">업무 구분</div>
						<hr>
						<div class="work_nemu">
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="rtotalTask"class="rbtask"
									name="taskType"/><span>전체 업무</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="2" id="rmyTask" class="rbtask"
									name="taskType"/><span>내 업무</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="rrequireTask"class="rbtask"
									name="taskType" /><span>요청한 업무</span>
								</label>
							</div>
							
						</div>
						
						<div><a class="fold">상태</a></div>
						<div id="more1" class="board">
							<div>
								<label>
									<input type="checkbox" id="cbrequest" class="cbstatus">
									<span>요청</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbdoing" class="cbstatus">
									<span>진행</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbfeedback" class="cbstatus">
									<span>피드백</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbcomplete" class="cbstatus">
									<span>완료</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbhold" class="cbstatus">
									<span>보류</span>
								</label>
							</div>
						</div>

						<div><a class="fold">업무순위</a></div>
						<div id="more2" class="board">
							<div>
								<label>
									<input type="checkbox" id="cbemergency" class="cbtaskrank">
									<span>긴급</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbhigh" class="cbtaskrank">
									<span>높음</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbnomal" class="cbtaskrank">
									<span>보통</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cblow" class="cbtaskrank">
									<span>낮음</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox" id="cbnone" class="cbtaskrank">
									<span>없음</span>
								</label>
							</div>
						</div>
						
						<div><a class="fold">시작일</a></div>
						<div id="more3" class="board">
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="sdtotal"
									name="rsdate" class="rsdate" checked="checked"/><span>전체</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="2" id="sdtoday"
									name="rsdate" class="rsdate"  /><span>오늘</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="sdthisweek"
									name="rsdate" class="rsdate"  /><span>이번주</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="sdthismonth"
									name="rsdate" class="rsdate"  /><span>이번달</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="sdnonedate"
									name="rsdate" class="rsdate"  /><span>날짜미정</span>
								</label>
							</div>
						</div>
						
						<div><a class="fold">마감일</a></div>
						<div id="more4" class="board">
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="edtotal"
									name="redate" class="redate" checked="checked"/><span>전체</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="eddelay"
									name="redate" class="redate"/><span>지연</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="2" id="edtoday"
									name="redate" class="redate"/><span>오늘까지</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="edtoweek"
									name="redate" class="redate"/><span>이번주까지</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="edtomonth"
									name="redate" class="redate"/><span>이번달까지</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="ednone"
									name="redate" class="redate"/><span>날짜미정</span>
								</label>
							</div>
						</div>


					</div>
				</div>
			</div>
			<div style="position: absolute; z-index: 3; top:4%; right:0;">
			<c:forEach var="totalTaskList" items="${totalTaskList}">
				<div id="idx" class="post_idx" name="${totalTaskList.article_id }" style="margin-bottom: 0px; width: 500px; display: none;">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile" style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${totalTaskList.writer }</span><a id="spbtn" class="${totalTaskList.project_id}" name="${totalTaskList.project_name }" style="margin-left: 10px; font-size: 12px; right: 30px; position: absolute; color: darkblue;">바로가기</a><br> 
									<span style="font-size: 10px;">${totalTaskList.regDate }</span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div id="set_icon_list" style="display:none; width: 45px; height: 50px; background-color: rgb(242, 242, 242); z-index: 500; position: absolute;  margin-top: 41px; margin-left: 431px; text-align: center; border-radius: 5px;">
										<ul>
											<li><a id="article_set">수정</a></li>
											<li><a id="article_set">삭제</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 탑 -->

							<!-- 글내용 -->
							<div class="post">
								
								<div class="post_title">
									<strong id='write_t'>${totalTaskList.writeForm3_title }</strong><span class="t_num"><span>업무번호</span>${totalTaskList.writeForm3_tasknum}</span>
								</div>


								<!-- 업무 내용 들어가는 곳 -->
								<div class="div_text_write" style="font-size: 14px;width: 100%;" contenteditable="false">
									<hr>
									<!-- 상태 -->
									<div class="work_form_status">
										<label id="work_status_img" style="display: inline-block; width: 22px; height: 20px; background: url(./images/ico_worktit.png) no-repeat; background-position: 0px 1px; margin-bottom: -4px;"></label>

										<!-- 상태 선택 테이블 -->
										<div id="status_select_div" style="display: inline-block; text-align: center; width: 90%;">

											<input type="hidden" id="work_status">
											<c:choose>
												<c:when test="${totalTaskList.writeForm3_status eq '요청' }">
													<div style="display: inline-block; width: 16%;">
														<span id="request" class="task_type_select" style="background-color: #4aaefb;">요청</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="doing" class="task_type" >진행</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="feedback" class="task_type" >피드백</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="complete" class="task_type">완료</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="postpone" class="task_type">보류</span>
													</div>
												</c:when>

												<c:when test="${totalTaskList.writeForm3_status eq '진행' }">
													<div style="display: inline-block; width: 16%;">
														<span id="request" class="task_type">요청</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="doing" class="task_type_select" style="background-color: #50b766;">진행</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="feedback" class="task_type">피드백</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="complete" class="task_type">완료</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="postpone" class="task_type">보류</span>
													</div>
												</c:when>
												
												<c:when test="${totalTaskList.writeForm3_status eq '피드백' }">
													<div style="display: inline-block; width: 16%;">
														<span id="request" class="task_type" >요청</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="doing" class="task_type">진행</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="feedback" class="task_type_select" style="background-color: #f17a19;">피드백</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="complete" class="task_type">완료</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="postpone" class="task_type">보류</span>
													</div>
												</c:when>
												
												<c:when test="${totalTaskList.writeForm3_status eq '완료' }">
													<div style="display: inline-block; width: 16%;">
														<span id="request" class="task_type" >요청</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="doing" class="task_type" >진행</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="feedback" class="task_type">피드백</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="complete" class="task_type_select" style="background-color: #2e417e;">완료</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="postpone" class="task_type">보류</span>
													</div>
												</c:when>
												
												<c:when test="${totalTaskList.writeForm3_status eq '보류' }">
													<div style="display: inline-block; width: 16%;">
														<span id="request"  class="task_type">요청</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="doing" class="task_type">진행</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="feedback" class="task_type">피드백</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="complete" class="task_type">완료</span>
													</div>
													<div style="display: inline-block; width: 16%;">
														<span id="postpone" class="task_type_select" style="background-color: #aeaeae;">보류</span>
													</div>
												</c:when>
												
											</c:choose>
										</div>
										<!-- //상태 선택 테이블 -->

									</div>
									<!-- //상태 -->

									<c:if test="${totalTaskList.writeForm3_workersName ne null}">
									<hr>	
									<!-- 담당자 -->
									<div class="work_form_manager">
										<div>
											<label id="work_worker_img" style="margin-right: 5px; display: inline-block; width: 22px; height: 20px; background: url(./images/ico_worktit.png) no-repeat; background-position: 1px -45px; margin-bottom: -4px;"></label> 
											<div style="display: inline-flex;">
											<c:set var="taskNum" value="${totalTaskList.writeForm3_tasknum }"/>
											<!-- 담당자 들어갈곳 -->
											<c:forEach var="taskList" items="${taskList }">
												<c:if test="${taskNum eq  taskList.writeForm3_tasknum}">
													<c:set var="workerName" value="${fn:split(taskList.writeForm3_workersName,',')}"/>
													<c:forEach var="names" items="${workerName}">
														<input type="button"  value="${names}" name="" />
													</c:forEach>
												</c:if>
											</c:forEach>
											</div>
											
										</div>
									</div>
									</c:if>
									<!-- //담당자 -->


									<!-- 시작일 -->
									<c:if test="${totalTaskList.writeForm3_start_date ne null}">
									<hr>
									
									<div>
										<div>
											<label id="work_start_img" style="display: inline-block; width: 22px; height: 20px; background: url(./images/ico_worktit.png) no-repeat; background-position: 1px -85px; margin-bottom: -4px;"></label>
											<div style="display: inline;">
												<input type="text" placeholder="시작일" readonly="readonly"
													value="${totalTaskList.writeForm3_start_date }"
													style="border-style: none;">
											</div>

										</div>
									</div>
									</c:if>
									<!-- 시작일 -->


									<!-- 마감일 -->
									<c:if test="${totalTaskList.writeForm3_end_date ne null}">
									<hr>
									<div>
										<div>
											<label id="work_end_img" style="display: inline-block; width: 22px; height: 20px; background: url(./images/ico_worktit.png) no-repeat; background-position: 1px -125px; margin-bottom: -4px;"></label>
											<div style="display: inline;">
												<input type="text" placeholder="마감일" readonly="readonly"
													value="${totalTaskList.writeForm3_end_date }"
													style="border-style: none;">
											</div>

										</div>
									</div>
									</c:if>
									<!-- 마감일 -->


									<!-- 달성도 -->
									<c:if test="${totalTaskList.writeForm3_progress ne null}">
									<hr>
									<div>
										<div>
											<label id="work_progress_img" style="display: inline-block; width: 22px; height: 20px; background: url(./images/ico_worktit.png) no-repeat; background-position: 1px -165px; margin-bottom: -4px;"></label> <input type="hidden"
												id="work_progress" value="0">
											<div style="display: inline;">
												<progress id="progress_a" value="${totalTaskList.writeForm3_progress }"
													max="100"></progress>
											</div>
										</div>
									</div>
									</c:if>
									<!-- 달성도 -->


									<!-- 우선순위 -->
									<c:if test="${totalTaskList.writeForm3_order ne null}">
									<hr>
									<div>
										<div>
											<label id="work_order_img" style="display: inline-block; width: 22px; height: 20px; background: url(./images/ico_worktit.png) no-repeat; background-position: 1px -205px; margin-bottom: -4px;"></label>
											<div style="width: 40%; display: inline-block;">
												<input type="text" placeholder="우선순위 선택" readonly="readonly"
													value="${totalTaskList.writeForm3_order }"
													onclick="orderSelectDiv()" style="border-style: none;">
											</div>
										</div>
									</div>
									</c:if>
									<!-- 우선순위 -->
									<hr>

									<!-- 내용 -->
									<pre id="write_c" class="div_text_write" 
										style="border: none;">${totalTaskList.writeForm3_content }</pre>

									<!-- //내용 -->

								</div>
								<!-- //업무 내용 들어가는 곳 -->

								<!-- 이미지 -->

								<div id="post_images">
									<c:set var="imgList" value="${fn:split(totalTaskList.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${totalTaskList.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->

								<c:if test="${totalTaskList.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${totalTaskList.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${totalTaskList.file_size } byte</dd>
													</dl>
											<div class='down_fil' >
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${totalTaskList.file_path }'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px; display:none;">
									<span style="font-size: 12px; display: none;">좋아요 <span class='reply_count'></span> 개</span>
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->




							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px; display:none;">
								<ul class="bottom_list">
									<li style="display: none;"><a id="like_icon">좋아요</a></li>
									<li><a id="input_btn_icon">댓글작성</a></li>
									<li style="display: none;">
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${totalTaskList.article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${totalTaskList.member_id eq reply.member_id }">
											<div class="remark_setting">
												<span class="remark_btn">수정</span><em>|</em><span class="remark_btn">삭제</span>
											</div>
										</c:if>
										<div class="remark_data">
											<strong id="${reply.reply_id}">${reply.reply_writer }</strong> <span>${reply.reply_regdate }</span>
											<pre id="reply_c">${reply.reply_content }</pre>
										</div>

									</div>
								</c:if>
							</c:forEach>
							<!-- 						댓글 작성 -->

							<!-- 						댓글 -->
							<form method="post" action="articlereply.do">
								<input type="hidden" name="reply_writer"
									value="${sessionScope.user.name }"> <input
									type="hidden" name="project_id" value="${project.project_id }">
								<input type="hidden" name="article_id"
									value="${totalTaskList.article_id }">
								<div style="position: relative; padding-bottom: 10px;">
									<div class="photo" style="float: left; padding-left: 10px;">
										<img id="user_profile"
											style="width: 32px; height: 32px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
									</div>

									<input name="reply_content" type="text"
										placeholder="댓글을 입력하세요(Enter는 입력, shift or ctrl + Enter는 줄바꿈)"
										style="display: inline-block; font-size: 13px; margin-left: 5px; width: 89%; height: 32px;">


								</div>
							</form>
							<!-- 						댓글 -->
							</div>
						</div>
			</c:forEach>
			</div>
			
			<!-- 업무 내용 -->
			<div>
				<div style="float: left;">
					<span>전체 업무 (<span id="task_num"></span>)</span>
				</div>

				<div class="task_head">
					<div class="task_close">
						<a id="task_close">닫기</a>
					</div>
				</div>
				<!-- task_header -->


				<div class="task_contents"style="margin-left:140px;">
					<div id="contents_container">
						<div class="work_table">
							<table class="table_list" name="${user.name}">
								<tr>
									<th class="work_table_th"><a>번호</a></th>
									<th class="work_table_th"><a>상태</a></th>
									<th class="work_table_th"><a>우선순위</a></th>
									<th class="work_table_th"><a>제목</a></th>
									<th class="work_table_th"><a>진척도</a></th>
									<th class="work_table_th"><a>담당자</a></th>
									<th class="work_table_th"><a>작성자</a></th>
									<th class="work_table_th"><a class="tdate">시작일</a></th>
									<th class="work_table_th"><a class="tdate">마감일</a></th>
									<th class="work_table_th"><a class="tdate">등록일</a></th>
									<!-- <th class="work_table_th"><a class="tdate">수정일</a></th> -->
								</tr>
								<c:forEach var="totalTaskList" items="${totalTaskList}">
									<tr id="" class="task_board" name="${totalTaskList.article_id}">
										<td><span>${totalTaskList.writeForm3_tasknum}</span></td>
										<c:choose>
											<c:when test="${totalTaskList.writeForm3_status eq '요청'}">
												<td><a id="task_off" class="tstatus" style="background-color: #4aaefb;">${totalTaskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_status eq '진행'}">
												<td><a id="task_off" class="tstatus" style="background-color: #50b766;">${totalTaskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_status eq '피드백'}">
												<td><a id="task_off" class="tstatus" style="background-color: #f17a19;">${totalTaskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_status eq '완료'}">
												<td><a id="task_off" class="tstatus" style="background-color: #2e417e;">${totalTaskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_status eq '보류'}">
												<td><a id="task_off" class="tstatus" style="background-color: #aeaeae;">${totalTaskList.writeForm3_status}</a></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${totalTaskList.writeForm3_order ne null}">
												<td><span class="task_order">${totalTaskList.writeForm3_order}</span></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_order eq null}">
												<td><span class="task_order">-</span></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${totalTaskList.writeForm3_title ne null}">
												<td><a id="" class="task_board" name="${totalTaskList.article_id}">${totalTaskList.writeForm3_title}</a></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_title eq null}">
												<td><a id="" class="task_board" name="${totalTaskList.article_id}">-</a></td>
											</c:when>
										</c:choose>
										<td><span class="pspan">${totalTaskList.writeForm3_progress}%</span><progress class="taskpbar" value="${totalTaskList.writeForm3_progress}" max="100"></progress></td>
										<td><span class="task_manager">${totalTaskList.writeForm3_workersName}</span></td>
										<td><span class="task_write">${totalTaskList.writer}</span></td>
										<c:choose>
											<c:when test="${totalTaskList.writeForm3_start_date ne null}">
												<td><span class="task_sdate">${totalTaskList.writeForm3_start_date}</span></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_start_date eq null}">
												<td><span class="task_sdate">-</span></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${totalTaskList.writeForm3_end_date ne null}">
												<td><span class="task_edate">${totalTaskList.writeForm3_end_date}</span></td>
											</c:when>
											<c:when test="${totalTaskList.writeForm3_end_date eq null}">
												<td><span class="task_edate">-</span></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${totalTaskList.regDate ne null}">
												<td><span class="task_rdate">${totalTaskList.regDate}</span></td>
											</c:when>
											<c:when test="${totalTaskList.regDate eq null}">
												<td><span class="task_rdate">-</span></td>
											</c:when>
										</c:choose>
										<!-- <td><a class="task_mdate">수정일</a></td> -->
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- task_ feed-->



			</div>


		</div>
		<!-- row -->
	</div>
	<!-- container -->
	<input id="taskStatusLoad" type="hidden" value="${taskStatusLoad}">
</body>
</html>