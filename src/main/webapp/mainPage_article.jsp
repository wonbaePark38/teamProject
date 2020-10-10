<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 게시글 넣는곳 -->
<div>
	<c:forEach var="userList" items="${userList }">
		<input type="hidden" id="project_user" class="project_user" name="${userList.member_name }" value="${userList.member_id }"/>
	</c:forEach>
</div>
<div class="article">
	<div class="article_margin">
		<!-- 타이틀 -->
		<div class="title_margin">
			<input id="p_id" type="hidden" name="project_id" value="${project.project_id }"/>
			<div class="title_border">
				<p id="title">${project.project_name}</p>
			</div>
		</div>
		<!-- 타이틀 -->
		<!-- 업무 리포트 -->
		
		<div class="work_report_border" style="display: none;">
			<div class="work_report">
				<div class="work_report_title">
					<!-- 프로젝트 명 -->
					<p id="project_name" style="display: inline-block;">Article</p>

					<a id="work_report_fold" onclick="fold()"> 접기</a>

				</div>

				<!-- 차트 영역 -->
				<div id="chart" style="float: none;">
					<!-- 파이차트 -->
					<div id="piechart"></div>
					<!-- //파이차트 -->

					<!-- 차트 통계 -->
					<div class="piechart_table">
						<table>
							<tr>
								<td>요청</td>
								<td>진행</td>
								<td>피드백</td>
								<td>완료</td>
								<td>보류</td>
							</tr>
							<tr id='task_status_table'>
							<c:forEach var="task_status" items="${taskStatusList}">
								<c:if test="${task_status.writeForm3_status eq '요청' }"><td id="request_count">${task_status.status_count}</td></c:if>
								<c:if test="${task_status.writeForm3_status eq '진행' }"><td id="doing_count">${task_status.status_count}</td></c:if>
								<c:if test="${task_status.writeForm3_status eq '피드백' }"><td id="feedback_count">${task_status.status_count}</td></c:if>
								<c:if test="${task_status.writeForm3_status eq '완료' }"><td id="complate_count">${task_status.status_count}</td></c:if>
								<c:if test="${task_status.writeForm3_status eq '보류' }"><td id="postpone_count">${task_status.status_count}</td></c:if>
							</c:forEach>
							</tr>
						</table>
					</div>
					<!-- //차트 통계 -->
				</div>
				<!-- //차트 영역 -->

			</div>
		</div>
		<!-- //업무 리포트 -->


		<!-- 글작성 폼 -->
		<div id="write_form_margin">
			<div id="write_form_border">

				<div id="write_form_select_div">
					<div id="write_form_select">

						<!-- 글작성 선택 -->
						<table id="write_form_select_table">
							<tr>
								<td><span onclick="writeForm()">글쓰기</span></td>
								<td><span onclick="write20Form()">글쓰기 2.0</span></td>
								<td><span onclick="workForm()">업무</span></td>
								<td><span onclick="scheduleForm()">일정</span></td>
								<td><span onclick="todoForm()">할일</span></td>
							</tr>
						</table>
						<!-- //글작성 선택 -->

					</div>
					<hr>
					<!-- 글쓰기 양식 -->
					<div id="write_form_content">

						<!-- 글 쓰기 -->
						<form method="post" action="writeform1.do" id="writeForm1_form"
							enctype="multipart/form-data">
							<input type="hidden" name="file_name"> 
							<input type="hidden" name="file_size"> 
							<input type="hidden" name="img_name"> 
							<input type="hidden" name="img_size">
							<input type="hidden" name="form_name" value="nomalWrite">
							<input type="hidden" name="project_id" value="${project.project_id}"> 
							<input type="hidden" name="project_name" value="${project.project_name}"> 
							<input type="hidden" name="writer" value="${sessionScope.user.name}">
							<div id="writeForm_div">

								<textarea name="writeForm1_content" id="writeForm1_content_text"
									class="div_text_write" placeholder="내용을 입력해주세요." oninput=""></textarea>



								<!-- 파일 업로드 -->
								<div id="writeForm1_uploadFile" class="post_file"
									style="display: none;">
									<div
										style="width: 100%; padding: 10px; border: 1px solid black;">
										<img src="images/file_icon2_down.png"
											style="display: inline-block;margin-bottom: 5px;">
										<div
											style="display: inline-block; margin-left: 10px; width: 385px;">
											<p id="writeForm1_uploadFile_name"
												style="display: block; margin-top: 0px; margin-bottom: 0px; font-size: 13px;"></p>
											<p id="writeForm1_uploadFile_size"
												style="margin-top: 0px; margin-bottom: 0px; font-size: 12px;"></p>
										</div>
										<div
											style="display: inline-block; text-align: right; padding-bottom: 7px;">
											<a id="file_del" style="display: inline-block; text-align: center; vertical-align: middle; border: 1px solid black; width: 50px; height: 20px; padding-bottom: 3px; border-radius: 20px;">삭제</a>
										</div>
									</div>
								</div>
								<!-- //파일 업로드 -->
								
								<!-- 이미지 업로드 -->
								<div id="uploadImg" class="post_images" style="display: none; padding: 5px;">
								</div>
								<!-- //이미지 업로드 -->
								
								<!-- 하단 툴바 -->
								<hr>
								<div id="toolbar" style="width: 100%; margin-top: 5px; margin-bottom: 5px;"
									onsubmit="attech_file_check()">

									<input type="file" id="writeForm1_file" name="writeForm_file"
										onchange="fileCheck(this,writeForm1_uploadFile)"
										style="display: none;"> 
										<input type="file"   class="img_input" name="writeForm_img" style="display: none;" multiple/>
										<a id="writeForm1_file_add" class="add_file"></a> 
										<a href="javascript:" id="img_upload" onclick="fildUploadAction()" class="add_pic"></a>
										<a class="add_mention" style="display: none;"></a>
										<div id="mention_select_div" style="display: initial;z-index: 300; display: initial; position: absolute; margin-left: 7px; display: none;">
											<ul
												style="list-style: none; border: 1px solid lightgray; background-color: white; padding-left: 0px;">
												<!-- forEach -->
												<c:forEach var="userList" items="${userList}">
													<li id="mid" value="${userList.member_id }">
														<a class="mention_User" id="mention_off">${userList.member_name}</a>
													</li>
												</c:forEach>
												<!-- //forEach -->
											</ul>
										</div>

									<div style="display: inline-block; float: right;">
										<a class="submit_a" onclick="writeForm_submit1()">올리기</a>
									</div>
									
								</div>
								<!-- //하단 툴바 -->
								<div id="menstionbar"></div>
							</div>

						</form>
						<!-- //글 쓰기 -->

						<!-- 글쓰기 2.0 -->
						<form method="post" action="writeform2.do" id="writeForm2_form"
							enctype="multipart/form-data">
							<input type="hidden" name="file_name">
							<input type="hidden" name="file_size"> 
							<input type="hidden" name="img_name"> <input type="hidden" name="img_size">
							<input type="hidden" name="form_name" value="nomalWrite2.0">
							<input type="hidden" name="project_id" value="${project.project_id }"> 
							<input type="hidden" name="project_name" value="${project.project_name}"> 
							<input type="hidden" name="writer" value="${sessionScope.user.name }">

							<div class="write20_form" id="write20Form_div">
								<!-- 제목입력 -->
								<div class="writeForm2_title">
									<input name="writeForm2_title" id="writeForm2_title" type="text"
										placeholder="제목을 입력해 주세요"
										style="width: 80%; border-style: none;">
								</div>
								<hr>

								<textarea name="writeForm2_content" id="writeForm2_content_text"
									class="div_text_write" placeholder="내용을 입력해주세요."></textarea>
									<!-- 툴바 장소 검색 -->
									<div id="search_location_div">
										<input id="search_location" type="text" placeholder="주소를 입력해주세요." name="location_name">
									</div>
									<!-- //툴바 장소 검색 -->
								<!-- 지도 영역 -->
								<div id="location_div">
									<div id="locationMap"></div>
								</div>
								<!-- //지도 영역 -->

								<!-- 파일 업로드 -->
								<div id="writeForm2_uploadFile" class="post_file"
									style="display: none;">
									<div
										style="width: 100%; padding: 10px; border: 1px solid black;">
										<img src="images/file_icon2_down.png"
											style="display: inline-block;margin-bottom: 5px">
										<div
											style="display: inline-block; margin-left: 10px; width: 385px;">
											<p id="writeForm2_uploadFile_name"
												style="display: block; margin-top: 0px; margin-bottom: 0px; font-size: 13px;"></p>
											<p id="writeForm2_uploadFile_size"
												style="margin-top: 0px; margin-bottom: 0px; font-size: 12px;"></p>
										</div>
										<div
											style="display: inline-block; text-align: right; padding-bottom: 7px;">
											<a id="file_del" style="display: inline-block; text-align: center; vertical-align: middle; border: 1px solid black; width: 50px; height: 20px; padding-bottom: 3px; border-radius: 20px;">삭제</a>
										</div>
									</div>
								</div>
								<!-- //파일 업로드 -->

								<!-- 이미지 업로드 -->
								<div id="uploadImg" class="post_images" style="display: none; padding: 5px;">
								</div>
								<!-- //이미지 업로드 -->


								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

									<input type="file" id="writeForm2_file" name="writeForm_file"
										onchange="fileCheck(this,writeForm2_uploadFile)"
										style="display: none;"> 
										<input type="file"   class="img_input" name="writeForm_img" style="display: none;" multiple/>
										 <a id="writeForm2_file_add" class="add_file"></a> 
										<a href="javascript:" id="img_upload" onclick="fildUploadAction()" class="add_pic"></a>
										<a class="add_loc" onclick="locationPick()"></a>
										<a class="add_mention" style="display: none;"></a>

									<div style="display: inline-block; float: right;">
										<a class="submit_a" onclick="writeForm_submit2()">올리기</a>
									</div>


								

								</div>

								<!-- //하단 툴바 -->

							</div>
						</form>
						<!-- //글쓰기 2.0 -->



						<!-- 업무 글쓰기 -->
						<form method="post" action="writeform3.do" id="writeForm3_form"
							enctype="multipart/form-data">
							<input type="hidden" name="file_name"> 
							<input type="hidden" name="file_size"> 
							<input type="hidden" name="img_name"> 
							<input type="hidden" name="img_size">
							<input type="hidden" name="form_name" value="taskWrite">
							<input type="hidden" name="project_name" value="${project.project_name}"> 
							<input type="hidden" name="project_id" value="${project.project_id }">
							<input type="hidden" name="writer" value="${sessionScope.user.name }">
							<div class="work_form" id="workForm_div">

								<!-- 업무명 -->
								<div id="work_form_title">
									<input type="text" id="Form3_title" name="writeForm3_title"
										placeholder="업무명을 입력해주세요"
										style="width: 80%; border-style: none;">
								</div>
								<!-- //업무명 -->
								<hr>
								<!-- 상태 -->
								<div class="work_form_status">
									<label id="work_status_img"></label>
									<!-- 상태 선택 테이블 -->
									<div id="status_select_div">

										<input type="hidden" name="writeForm3_status" id="work_status"
											value="요청">

										<div style="display: inline-block; width: 16%;">
											<span id="request" onclick="request(this)"
												style="background-color: #4aaefb;">요청</span>
										</div>
										<div style="display: inline-block; width: 16%;">
											<span id="doing" onclick="doing()">진행</span>
										</div>
										<div style="display: inline-block; width: 16%;">
											<span id="feedback" onclick="feedback()">피드백</span>
										</div>
										<div style="display: inline-block; width: 16%;">
											<span id="complete" onclick="complete()">완료</span>
										</div>
										<div style="display: inline-block; width: 16%;">
											<span id="postpone" onclick="postpone()">보류</span>
										</div>
									</div>
									<!-- //상태 선택 테이블 -->

								</div>
								<!-- //상태 -->
								<hr>
								<!-- 담당자 -->
								<div class="work_form_manager">
									<div>
										<label id="work_worker_img"></label>
										<div style="display: inline-block;">
											<input type="text" id="work_worker_select"
												onclick="work_workerSelect()" placeholder="담당자 추가">
										</div>

										<div id="worker_select_div">
											<ul
												style="list-style: none; border: 1px solid lightgray; background-color: white; padding-left: 0px;">
												<!-- forEach -->
												<c:forEach var="userList" items="${userList}">
													<li id="${userList.member_id }">
														<input type="hidden" name="member_id" value="${userList.member_id }"/>
														<a class="task_User">${userList.member_name}</a>
													</li>
												</c:forEach>
												<!-- //forEach -->
											</ul>
										</div>

										<input type="hidden" id="work_workers" name="writeForm3_workersName">
										<input type="hidden" id="work_workers_id" name="writeForm3_workersID">

										<div id="worker_append_div" style="margin-left: 26px; margin-top: 5px">

										</div>
											
									</div>
								</div>
								<!-- //담당자 -->

								<hr>


								<!-- 추가항목 -->
								<div id="external">
									<a id="external_button" onclick="external_button()">추가항목</a>
								</div>


								<div id="work_form_external_div">
									<!-- 시작일 -->
									<div>
										<div>
											<label id="work_start_img"></label>
											<div style="display: inline;">
												<input type="text" name="writeForm3_start_date"
													id="start_date" placeholder="시작일"
													style="border-style: none;">
											</div>

										</div>
									</div>
									<!-- 시작일 -->

									<hr>

									<!-- 마감일 -->
									<div>
										<div>
											<label id="work_end_img"></label>
											<div style="display: inline;">
												<input type="text" name="writeForm3_end_date" id="end_date"
													placeholder="마감일" style="border-style: none;">
											</div>

										</div>
									</div>
									<!-- 마감일 -->

									<hr>

									<!-- 달성도 -->
									<div>
										<div>
											<label id="work_progress_img"></label> <input type="hidden"
												name="writeForm3_progress" id="work_progress" value="0">
											<div style="display: inline;">
												<progress id="progress" value="0" max="100"
													onclick="progressBar()"></progress>
											</div>
										</div>
									</div>
									<!-- 달성도 -->

									<hr>

									<!-- 우선순위 -->
									<div>
										<div>
											<label id="work_order_img"></label>
											<div style="width: 40%; display: inline-block;">
												<input type="text" name="writeForm3_order" id="work_order"
													placeholder="우선순위 선택" onclick="orderSelectDiv()"
													style="border-style: none;">
											</div>
										</div>
									</div>
									<!-- 우선순위 -->
									<div id="order_div">
										<div>
											<ul>
												<li><a onclick="orderSelect(this)">낮음</a></li>
												<li><a onclick="orderSelect(this)">보통</a></li>
												<li><a onclick="orderSelect(this)">높음</a></li>
												<li><a onclick="orderSelect(this)">긴급</a></li>
											</ul>
										</div>
									</div>
									<hr>

								</div>
								<!-- //추가항목 -->


								<!-- 내용 -->
								<textarea class="div_text_write" name="writeForm3_content"></textarea>

								<!-- //내용 -->


								<!-- 파일 업로드 -->
								<div id="writeForm3_uploadFile" class="post_file"
									style="display: none;">
									<div
										style="width: 100%; padding: 10px; border: 1px solid black;">
										<img src="images/file_icon2_down.png"
											style="display: inline-block; margin-bottom: 5px">
										<div
											style="display: inline-block; margin-left: 10px; width: 385px;">
											<p id="writeForm3_uploadFile_name"
												style="display: block; margin-top: 0px; margin-bottom: 0px; font-size: 13px;"></p>
											<p id="writeForm3_uploadFile_size"
												style="margin-top: 0px; margin-bottom: 0px; font-size: 12px;"></p>
										</div>
										<div
											style="display: inline-block; text-align: right; padding-bottom: 7px;">
											<a id="file_del" style="display: inline-block; text-align: center; vertical-align: middle; border: 1px solid black; width: 50px; height: 20px; padding-bottom: 3px; border-radius: 20px;">삭제</a>
										</div>
									</div>
								</div>
								<!-- //파일 업로드 -->

								<!-- 이미지 업로드 -->
								<div id="uploadImg" class="post_images" style="display: none; padding: 5px;">
								</div>
								<!-- //이미지 업로드 -->


								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">
									<input type="file" id="writeForm3_file" name="writeForm_file"
										onchange="fileCheck(this,writeForm3_uploadFile)"
										style="display: none;"> 
										<input type="file"   class="img_input" name="writeForm_img" style="display: none;" multiple/>
										<a id="writeForm3_file_add" class="add_file"></a> 
										<a href="javascript:" id="img_upload" onclick="fildUploadAction()" class="add_pic"></a> 
										<a class="add_mention" style="display: none;"></a>
									<div style="display: inline-block; float: right;">
										<a class="submit_a" onclick="writeForm_submit3()">올리기</a>
									</div>
								</div>

								<!-- //하단 툴바 -->


							</div>
						</form>
						<!-- //업무 글쓰기 -->




						<!-- 일정 -->
						<form method="post" action="writeform4.do" id="writeForm4_form">
							<input type="hidden" name="form_name" value="scheWrite">
							<input type="hidden" name="project_name" value="${project.project_name}"> 
							<input type="hidden" name="project_id" value="${project.project_id }"> 
							<input type="hidden" name="writer" value="${sessionScope.user.name }">
							<div class="schedule_form" id="scheduleForm_div">
								<div>
									<!-- 일정 제목 -->
									<div>
										<input type="text" id="writeForm4_title" name="writeForm4_title" style="width: 100%; border-style: none;" placeholder="일정 제목을 입력해주세요">
									</div>
									<!-- //일정 제목 -->
									<div>
										<hr>
									</div>


									<!-- 일정 내용 -->
									<div class="schedule_content">

										<ul
											style="list-style: none; padding-left: 5px; margin-bottom: 0px;">
											<!-- 데이트 피커 -->
											<li><span id="sche_time_img"></span> <!-- 날짜 선택 -->
												<div style="display: inline-block; width: 80%;">
													<input type="text" name="writeForm4_start_date"
														id="sche_start_date" placeholder="오늘날자"
														readonly="readonly" style="width: 22%;">&nbsp; 
														<select
														name="writeForm4_start_time" id="start_time_select">
														<option value="00">00:00</option>
														<option value="01">01:00</option>
														<option value="02">02:00</option>
														<option value="03">03:00</option>
														<option value="04">04:00</option>
														<option value="05">05:00</option>
														<option value="06">06:00</option>
														<option value="07">07:00</option>
														<option value="08">08:00</option>
														<option value="09">09:00</option>
														<option value="10">10:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18">18:00</option>
														<option value="19">19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
													</select> &nbsp;~&nbsp; 
													<input type="text"
														name="writeForm4_end_date" id="sche_end_date"
														readonly="readonly" placeholder="종료날자" style="width: 22%;">&nbsp;
													<select name="writeForm4_end_time" id="end_time_select">
														<option value="00">00:00</option>
														<option value="01">01:00</option>
														<option value="02">02:00</option>
														<option value="03">03:00</option>
														<option value="04">04:00</option>
														<option value="05">05:00</option>
														<option value="06">06:00</option>
														<option value="07">07:00</option>
														<option value="08">08:00</option>
														<option value="09">09:00</option>
														<option value="10">10:00</option>
														<option value="11">11:00</option>
														<option value="12">12:00</option>
														<option value="13">13:00</option>
														<option value="14">14:00</option>
														<option value="15">15:00</option>
														<option value="16">16:00</option>
														<option value="17">17:00</option>
														<option value="18">18:00</option>
														<option value="19">19:00</option>
														<option value="20">20:00</option>
														<option value="21">21:00</option>
														<option value="22">22:00</option>
														<option value="23">23:00</option>
													</select> <label> <input type="checkbox" id="alldayCheck"
														onclick="alldayBtn()"> <span>종일</span>
													</label>
												</div> <!-- //날짜 선택 --></li>
											<!-- //데이트 피커 -->

											<hr>


											<!-- 장소검색 -->
											<li><span id="sche_loc_img"
												style="display: inline-block;"></span> <!-- 장소 검색 -->
												<div class="schedule_place" id="sche_place"
													style="display: inline-block;">
													<input id="address" type="text" placeholder="주소입력 후 Enter" />
												</div> <!-- //장소 검색 --> <!-- google Map -->
												<div id="googleMap_div">
													<div id="googleMap" style="width: 100%; height: 200px;"></div>
												</div> <!-- //google Map --></li>

											

											<!-- 몇분전에 알람줄지 -->
											
											<!-- <li>
												<hr>
												알람
												<div class="schedule_alarm">

													<span id="sche_alarm_img"></span> <select
														name="writeForm4_alarm_time">
														<option value="10">10분전</option>
														<option value="30">30분전</option>
														<option value="60">1시간전</option>
														<option value="120">2시간전</option>
														<option value="720">12시간전</option>
													</select>
												</div>
											</li>  -->
											<!-- //몇분전에 알람줄지 -->


											<!-- 일정 메모 -->
											<li>
												<hr>
												<textarea name="writeForm4_content"
													id="sche_text_write"></textarea>
											<li>
												<!-- 하단 툴바 -->
												<hr>
												<div
													style="width: 100%; text-align: right; margin-top: 5px; margin-bottom: 5px;">
													<div style="display: inline-block;">
														 <a class="submit_a" onclick="writeForm_submit4()">올리기</a>
													</div>
												</div> <!-- //하단 툴바 -->
											</li>

											<!-- //일정 메모 -->
										</ul>

									</div>
									<!-- //일정 내용 -->

								</div>
							</div>
						</form>
						<!-- //일정 -->


						<!-- 할일 -->
						<form method="post" action="writeform5.do" id="writeForm5_form">
						
							<input type="hidden" name="form_name" value="todoWrite">
							<input type="hidden" name="writeForm5_content" > 
							<input type="hidden" name="writeForm5_date"> 
							<input type="hidden" name="writeForm5_worker">
							<input type="hidden" name="project_id" value="${project.project_id }"> 
							<input type="hidden" name="project_name" value="${project.project_name}"> 
							<input type="hidden" name="writer" value="${sessionScope.user.name }">

							<div class="todo_form" id="todoForm_div">
								<!-- 할일 제목 -->
								<div>
									<input id="todo_title" placeholder="제목을 입력해 주세요"
										name="writeForm5_title"
										style="width: 80%; border-style: none;">
								</div>
								<!-- //할일 제목 -->


								<div id="todoContent_external"></div>
								<!-- //할일내용 -->


								<!-- 할일 추가 -->
								<div>
									<span id="todo_append_img"></span> <a id="todo_append"
										onclick="todoAppend()"> 할일 추가 </a>

								</div>
								<!-- //할일 추가 -->
								
								
								<!-- 하단 툴바 -->
								<hr>
								<div
									style="width: 100%; text-align: right; margin-top: 5px; margin-bottom: 5px;">
									<div style="display: inline-block;">
										<a id="writeForm5_submit" class="submit_a">올리기</a>

									</div>
								</div>

								<!-- //하단 툴바 -->
							</div>
						</form>
						<!-- //할일 -->



					</div>
					<!-- //write_form -->

				</div>
				<!-- write_form_border -->






			</div>
		</div>
		<!-- //글작성 폼 -->

		<!-- 미확인 알람 -->
		
		<div id="unread_alarm_div" style="width: 100%; display: none;">
			<div style="width: 100%; height: 50px; background-color: white;">
				<span id="unread_alarm_img"
					style="display: inline-block; vertical-align: middle; margin-left: 8px; margin-right: 11px; width: 20px; height: 22px; background: url(images/sp_sectiontitle_ico1.gif) no-repeat 0 -44px;"></span>
				<h5
					style="display: inline-block; vertical-align: middle; margin-top: 10px; font-size: 15px;">
					<strong>미확인 알람</strong>
				</h5>
				<!-- 알림이 있을때 -->
				<span
					style="display: inline-block; vertical-align: middle; text-align: center; width: 30px; height: 14px; border-radius: 8px; background-color: red; font-size: 12px;">12</span>
				
				<!-- 알림 다읽기 -->
				<span
					style="display: inline-block; vertical-align: middle; margin-left: 300px; font-size: 13px;"><strong>모두읽음</strong></span>
			</div>
			<!-- 알람글 최초 3개 -->
			<!-- forEach -->
			<div style="background-color: lightgray; width: 100%;">
				<div style="width: 100%; padding: 5px 5px 5px 5px;">
					<div style="display: inline-block;">
						<img src="images/empty_photo_s.png">
					</div>
					<div
						style="display: inline-block; width: 400px; vertical-align: middle;">
						<span style="font-size: 12px;"><strong>글쓴놈</strong></span> <span
							style="font-size: 10px;">현재일자 |</span> <span
							style="font-size: 10px;">현재시간</span> <br> <span
							style="font-size: 10px;">글내용입니다</span>
					</div>
					<span
						style="display: inline-block; vertical-align: middle; text-align: center; font-size: 12px; border-radius: 10px; border: 3px solid #676869; background-color: lightgray; width: 45px; height: 25px; margin-left: 20px;">
						보기 </span>
				</div>
			</div>
			<div style="text-align: center; vertical-align: middle; background-color: white;">
				<span style="font-size: 9px;">더보기</span>
			</div>
		</div>
		<!-- //forEach -->
		<!-- //미확인 알람 -->

		<!-- 상단 고정글 -->
		
		<div id="upper_fixed_article" style="margin-top: 10px; display: none;">
			<div style="width: 100%; height: 35px; background-color: white; padding: 5px 5px 5px 5px;">
				<span id="upper_fixed_img"
					style="display: inline-block; vertical-align: middle; width: 20px; height: 22px; background: url(images/sp_sectiontitle_ico1.gif) no-repeat 0 -66px;"></span>
				<span style="display: inline-block;">상단 고정글</span> <span
					style="margin-left: 5px;"><strong id="apx_count"></strong></span>

			</div>
			<c:forEach var="list" items="${articleList}">
				<!-- forEach -->
				<c:if test="${list.article_pix eq '1'}">
				<div id="ps" class="pix_div" style="background-color: white; padding: 5px;">
					<div style="display: inline-block; width: 100%;">
						<c:choose>
							<c:when test="${list.form_name eq 'nomalWrite'}">
								<input type="hidden" name="article_id" value="${list.article_id}"/>
								<span style="display: inline-block; font-size: 20px;">[<span style="font-size: 14px;">일반</span>]</span> 
								<span style="display: inline-block;">${list.writeForm1_content}</span>
							</c:when>
							<c:when test="${list.form_name eq 'nomalWrite2.0'}">
								<input type="hidden" name="article_id" value="${list.article_id}"/>
								<span style="display: inline-block; font-size: 20px;">[<span style="font-size: 14px;">일반</span>]</span> 
								<span style="display: inline-block;">${list.writeForm2_title}</span>
							</c:when>
							<c:when test="${list.form_name eq 'taskWrite'}">
								<input type="hidden" name="article_id" value="${list.article_id}"/>
								<span style="display: inline-block; font-size: 20px;">[<span style="font-size: 14px;">업무</span>]</span>
								<span style="display: inline-block;">${list.writeForm3_title}</span>
								<span style="margin-top: 8px; float: right; display: inline-block; vertical-align: middle; text-align: center; width: 60px; height: 20px; font-size: 12px; border-radius: 5px; background-color: lightblue; margin-right: 10px;">${list.writeForm3_status }</span>
							</c:when>
							<c:when test="${list.form_name eq 'scheWrite'}">
								<input type="hidden" name="article_id" value="${list.article_id}"/>
								<span style="display: inline-block; font-size: 20px;">[<span style="font-size: 14px;">일정</span>]</span>
								<span style="display: inline-block;">${list.writeForm4_title}</span>
							</c:when>
							<c:when test="${list.form_name eq 'todoWrite'}">
								<input type="hidden" name="article_id" value="${list.article_id}"/>
								<span style="display: inline-block; font-size: 20px;">[<span style="font-size: 14px;">할일</span>]</span>
								<span style="display: inline-block;">${list.writeForm5_title}</span>
							</c:when>
						</c:choose>
					</div>
					
				</div>
				<!-- 누르면 나올 게시물 -->
				<!-- //누르면 나올 게시물 -->
				<!-- //forEach -->
			<div style="display: none;">
				<!-- !@# -->
				<c:choose>
					<c:when test="${list.form_name eq 'nomalWrite'}">
						<div class="post_idx" id="${list.article_id }" name="${list.form_name }" style="margin-bottom: 0px;">
							<!-- 탑 -->
							
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile"
										style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 12px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
								<!-- 일반글 -->
								<!-- 택스트박스 -->
								<div class="div_text_write" contenteditable="false">
									<pre id="write_c" style="font-size: 15px;">${list.writeForm1_content }</pre>
								</div>
								<!-- 이미지 -->
								<div id="post_images">
									<c:set var="imgList" value="${fn:split(list.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${list.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->
								<c:if test="${list.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${list.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${list.file_size }</dd>
													</dl>
											<div class='down_fil' >
											<c:set var="file_path" value="${list.file_path}"></c:set>
											<c:set var="file_path_length" value="${fn:length(file_path) }"></c:set>
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${fn:substring(file_path,25,file_path_length)}'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='like_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->
							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px;">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon" class="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${list.article_id eq containList.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${list.article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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
						
					</c:when>

					<c:when test="${list.form_name eq 'nomalWrite2.0'}">
						<div class="post_idx"id="${list.article_id }" name="${list.form_name }" style="margin-bottom: 0px;">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile"
										style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 10px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>
									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
								<!-- 일반글 -->
								<div class="post_title">
									<strong id="write_t">${list.writeForm2_title }</strong>
								</div>
								<!-- 택스트박스 -->
								<div class="div_text_write" contenteditable="false">
									<pre id="write_c" style="font-size: 15px;">${list.writeForm2_content }</pre>
								</div>

								<!-- 지도 찍는곳 -->
								<c:if test="${list.writeForm2_latlng ne null}">
									<div id="writeForm2_map">
										<img src="https://maps.googleapis.com/maps/api/staticmap?
									center=${list.writeForm2_latlng }
									&zoom=18
									&size=480x300
									&maptype=roadmap
									&markers=color:red%7Clabel:C%7C${list.writeForm2_latlng }
									&key=AIzaSyA2ufsIg_pi0agHyW6dFEgXMCPIH8Aiw10">
									</div>
								</c:if>

								<!-- 이미지 -->

								<div id="post_images">
									<c:set var="imgList" value="${fn:split(list.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${list.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->

								<!-- 파일 -->
								<c:if test="${list.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${list.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${list.file_size }</dd>
													</dl>
											<div class='down_fil' >
											<c:set var="file_path" value="${list.file_path}"></c:set>
											<c:set var="file_path_length" value="${fn:length(file_path) }"></c:set>
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${fn:substring(file_path,25,file_path_length)}'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->




							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px;">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" name="article_id" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->
							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${list.article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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

					</c:when>


					<c:when test="${list.form_name eq 'taskWrite'}">
						<div class="post_idx"id="${list.article_id }" name="${list.form_name }" style="margin-bottom: 0px;">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile" style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> 
									<span style="font-size: 10px;">${list.regDate }</span>
									<span id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
									<strong id='write_t'>${list.writeForm3_title }</strong><span class="t_num"><span>업무번호</span>${list.writeForm3_tasknum}</span>
								</div>


								<!-- 업무 내용 들어가는 곳 -->
								<div class="div_text_write" contenteditable="false">
									<hr>
									<!-- 상태 -->
									<div class="work_form_status">
										<label id="work_status_img"></label>

										<!-- 상태 선택 테이블 -->
										<div id="status_select_div">

											<input type="hidden" id="work_status">
											<c:choose>
												<c:when test="${list.writeForm3_status eq '요청' }">
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

												<c:when test="${list.writeForm3_status eq '진행' }">
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
												
												<c:when test="${list.writeForm3_status eq '피드백' }">
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
												
												<c:when test="${list.writeForm3_status eq '완료' }">
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
												
												<c:when test="${list.writeForm3_status eq '보류' }">
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

									<c:if test="${list.writeForm3_workersName ne null}">
									<hr>	
									<!-- 담당자 -->
									<div class="work_form_manager">
										<div>
											<label id="work_worker_img" style="margin-right: 5px;"></label> 
											<div style="display: inline-flex;">
											<c:set var="taskNum" value="${list.writeForm3_tasknum }"/>
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
											
											<div style="display: inline-block;">
											
											<input type="text" class="modified_worker" placeholder="담당자 추가" style="display: none;"/>
											<div class="modified_worker_select_div">
												<ul style="list-style: none; border: 1px solid lightgray; background-color: white; padding-left: 0px;">
													<!-- forEach -->
													<c:forEach var="userList" items="${userList}">
														<li>
															<input type="hidden" name="member_id" value="${userList.member_id }"/>
															<a id="modified_task_User">${userList.member_name}</a>
														</li>
													</c:forEach>
													<!-- //forEach -->
												</ul>
											</div>
											
											</div>
											
											<div id="worker_append_div" style="margin-left: 26px; margin-top: 5px">
												
											
											</div>
										</div>
									</div>
									</c:if>
									<!-- //담당자 -->


									<!-- 시작일 -->
									<c:if test="${list.writeForm3_start_date ne null}">
									<hr>
									
									<div>
										<div>
											<label id="work_start_img"></label>
											<div style="display: inline;">
												<input type="text" placeholder="시작일" readonly="readonly"
													value="${list.writeForm3_start_date }"
													style="border-style: none;">
											</div>

										</div>
									</div>
									</c:if>
									<!-- 시작일 -->


									<!-- 마감일 -->
									<c:if test="${list.writeForm3_end_date ne null}">
									<hr>
									<div>
										<div>
											<label id="work_end_img"></label>
											<div style="display: inline;">
												<input type="text" placeholder="마감일" readonly="readonly"
													value="${list.writeForm3_end_date }"
													style="border-style: none;">
											</div>

										</div>
									</div>
									</c:if>
									<!-- 마감일 -->


									<!-- 달성도 -->
									<c:if test="${list.writeForm3_progress ne null}">
									<hr>
									<div>
										<div>
											<label id="work_progress_img"></label> <input type="hidden"
												id="work_progress" value="0">
											<div style="display: inline;">
												<progress id="progress_a" value="${list.writeForm3_progress }"
													max="100"></progress>
											</div>
										</div>
									</div>
									</c:if>
									<!-- 달성도 -->


									<!-- 우선순위 -->
									<c:if test="${list.writeForm3_order ne null}">
									<hr>
									<div>
										<div>
											<label id="work_order_img"></label>
											<div style="width: 40%; display: inline-block;">
												<input type="text" placeholder="우선순위 선택" readonly="readonly"
													value="${list.writeForm3_order }"
													onclick="orderSelectDiv()" style="border-style: none;">
											</div>
										</div>
									</div>
									</c:if>
									<!-- 우선순위 -->
									<hr>

									<!-- 내용 -->
									<pre id="write_c" class="div_text_write" 
										style="border: none;">${list.writeForm3_content }</pre>

									<!-- //내용 -->

								</div>
								<!-- //업무 내용 들어가는 곳 -->

								<!-- 이미지 -->

								<div id="post_images">
									<c:set var="imgList" value="${fn:split(list.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${list.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->

								<c:if test="${list.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${list.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${list.file_size }</dd>
													</dl>
											<div class='down_fil' >
											<c:set var="file_path" value="${list.file_path}"></c:set>
											<c:set var="file_path_length" value="${fn:length(file_path) }"></c:set>
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${fn:substring(file_path,25,file_path_length)}'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->




							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px;">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${list.article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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

					</c:when>

					<c:when test="${list.form_name eq 'scheWrite'}">
						<div class="post_idx"id="${list.article_id }" name="${list.form_name }" style="margin-bottom: 0px;">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 10px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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

								<!-- 일정 -->
								<div class="works" style="border: 1px solid #eaeaea;">
									<!-- 글제목 -->
									<dl class="work_calendar">
										<dt class="work_calendar_header">
											<c:set var="start_date" value="${list.writeForm4_start_date}" />
											<span class="work_month">${fn:substring(start_date,5,7)} 월</span><br> <strong
												class="work_day">${fn:substring(start_date,9,11)}일</strong>
										</dt>
										<dd id="write_t" class="wc_title">${list.writeForm4_title }</dd>
										<c:choose>
											<c:when test="${list .writeForm4_start_time eq null and list.writeForm4_end_time eq null} ">
												<dd class="wc_date">${list.writeForm4_start_date}  ~  ${list.writeForm4_end_date}</dd>
											</c:when>
											<c:when test="${list .writeForm4_start_date eq list.writeForm4_end_date} ">
												<dd class="wc_date">${list.writeForm4_start_date}, ${list.writeForm4_start_time}:00  ~  ${list.writeForm4_end_time}:00</dd>
											</c:when>
											<c:otherwise>
												<dd class="wc_date">${list.writeForm4_start_date} ${list.writeForm4_start_time}:00  ~  ${list.writeForm4_end_date} ${list.writeForm4_end_time}:00</dd>
											</c:otherwise>
										</c:choose>
									</dl>
									<!-- 글제목 -->

									<!-- 지도 -->
									<c:if test="${list.writeForm4_latlng ne null}">
										<div class="work_map">
											<span class="map_icon"></span> <span
												style="margin-left: 25px;">검색 위치</span> 
												<div id="writeForm2_map">
													<img src="https://maps.googleapis.com/maps/api/staticmap?
												center=${list.writeForm4_latlng }
												&zoom=18
												&size=480x300
												&maptype=roadmap
												&markers=color:red%7Clabel:C%7C${list.writeForm4_latlng }
												&key=AIzaSyA2ufsIg_pi0agHyW6dFEgXMCPIH8Aiw10">
												</div>
										</div>
									</c:if>
									<div class="work_memo">
										<span class="memo_icon"></span> <pre id="write_c" style="margin-left: 25px;">${list.writeForm4_content }</pre>
									</div>
									<!-- 알람 -->
									<!-- <div class="work_alarm">
										<span class="alarm_icon"></span> 
										<span style="margin-left: 25px;">알림</span>

									</div> -->
									<!-- 알람 -->
									
									<!-- 지도 -->
								</div>

								<!-- 일정 -->

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
							</div>



							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${list.article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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

					</c:when>

					<c:when test="${list.form_name eq 'todoWrite'}">
						<div class="post_idx" id="${list.article_id }" name="${list.form_name }" style="margin-bottom: 0px;">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 10px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
								
								<div class="todo_datas"
									style="width: 100%; padding: 10px 10px 10px 10px; border: 1px solid lightgray;">

									<div style="width: 100%; height: 50px;">
										<div>
											<strong id="write_t" >${list.writeForm5_title }</strong>
											<span
												style="display: inline-block; width: 80px; font-size: 11px;"><span id="set_bar"></span>%</span>
											<span class="totalpg" style="display: inline-block; font-size: 12px;">완료
												<span id="todo_success"></span>건 / 전체 <span id="todo_total"></span>건</span>
										</div>
										<div>
											<progress id="pgval" value="0" max="100" style="width: 100%;"></progress>
										</div>
									</div>

									<!--  forEach  -->
									<c:forEach var="todoList" items="${todoList}">
										<c:if test="${list.article_id eq todoList.article_id }">
											
										<hr style="margin-bottom: 0.6rem;">
											
										<div id="todoList" class="tdlist" name="${todoList.todo_id}" style="height: 50px;">
											<div
												style="display: inline-block; vertical-align: middle; width: 5%;">
												<c:choose>
													<c:when test="${todoList.todo_success eq '0' }">
														<a id="todo_check" class="tcheck"></a>
													</c:when>
													<c:when test="${todoList.todo_success eq '1' }">
														<a id="todo_check_on"class="tcheck"></a>
													</c:when>
												</c:choose>
											</div>
											<div
												style="display: inline-block; vertical-align: middle; width: 94%; height: 40px;">
												<span class="todo_c" style="vertical-align: middle; width: 276px; display: inline-block;">${todoList.worker_content}</span> 
												<span class="todo_d" style="vertical-align: middle; margin-right:10px;">${todoList.worker_date }</span> 
													<img src="images/empty_photo_s.png" id="${todoList.member_id}" name="${todoList.worker_name }" style="display: inline-block; vertical-align: middle;">
											</div>
										</div>
										</c:if>
									</c:forEach>

									<!--  //forEach  -->

								</div>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
							</div>



							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->
							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${list.article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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
					</c:when>



				</c:choose>


				<!-- !@# -->
			</div>
			</c:if>
			</c:forEach>
		</div>
		<!-- //상단 고정글 -->

		<!-- 게시글 출력하는 곳  -->
		<div id="article_show" style="width: 100%; margin-top: 10px;">

			<c:forEach var="list" items="${articleList }">
				
				<c:set var="form_name" value="${ list.form_name}" />
				<c:set var="article_id" value="${list.article_id }" />
				<c:choose>

					<c:when test="${form_name eq 'nomalWrite'}">
						<div class="post_idx" id="${list.article_id }" name="${list.form_name }">
							<!-- 탑 -->
							
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile"
										style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 12px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
								<!-- 일반글 -->
								<!-- 택스트박스 -->
								<div class="div_text_write" contenteditable="false">
									<pre id="write_c" style="font-size: 15px;">${list.writeForm1_content }</pre>
								</div>
								<!-- 이미지 -->
								<div id="post_images">
									<c:set var="imgList" value="${fn:split(list.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${list.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->
								<c:if test="${list.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${list.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${list.file_size }</dd>
													</dl>
											<div class='down_fil'>
											<c:set var="file_path" value="${list.file_path}"></c:set>
											<c:set var="file_path_length" value="${fn:length(file_path) }"></c:set>
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${fn:substring(file_path,25,file_path_length)}'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='like_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->
							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px;">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon" class="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${list.article_id eq containList.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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
						
					</c:when>

					<c:when test="${form_name eq 'nomalWrite2.0'}">
						<div class="post_idx"id="${list.article_id }" name="${list.form_name }">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile"
										style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 10px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>
									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
								<!-- 일반글 -->
								<div class="post_title">
									<strong id="write_t">${list.writeForm2_title }</strong>
								</div>
								<!-- 택스트박스 -->
								<div class="div_text_write" contenteditable="false">
									<pre id="write_c" style="font-size: 15px;">${list.writeForm2_content }</pre>
								</div>

								<!-- 지도 찍는곳 -->
								<c:if test="${list.writeForm2_latlng ne null}">
									<div id="writeForm2_map">
										<img src="https://maps.googleapis.com/maps/api/staticmap?
									center=${list.writeForm2_latlng }
									&zoom=18
									&size=480x300
									&maptype=roadmap
									&markers=color:red%7Clabel:C%7C${list.writeForm2_latlng }
									&key=AIzaSyA2ufsIg_pi0agHyW6dFEgXMCPIH8Aiw10">
									</div>
								</c:if>

								<!-- 이미지 -->
								<div id="post_images">
									<c:set var="imgList" value="${fn:split(list.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${list.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->

								<!-- 파일 -->
								<c:if test="${list.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${list.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${list.file_size }</dd>
													</dl>
											<div class='down_fil' >
											<c:set var="file_path" value="${list.file_path}"></c:set>
											<c:set var="file_path_length" value="${fn:length(file_path) }"></c:set>
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${fn:substring(file_path,25,file_path_length)}'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> --> 
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->




							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px;">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" name="article_id" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->
							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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

					</c:when>


					<c:when test="${form_name eq 'taskWrite'}">
						<div class="post_idx"id="${list.article_id }" name="${list.form_name }">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile" style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> 
									<span style="font-size: 10px;">${list.regDate }</span>
									<span id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
									<strong id='write_t'>${list.writeForm3_title }</strong><span class="t_num"><span>업무번호</span>${list.writeForm3_tasknum}</span>
								</div>


								<!-- 업무 내용 들어가는 곳 -->
								<div class="div_text_write" contenteditable="false">
									<hr>
									<!-- 상태 -->
									<div class="work_form_status">
										<label id="work_status_img"></label>

										<!-- 상태 선택 테이블 -->
										<div id="status_select_div">

											<input type="hidden" id="work_status">
											<c:choose>
												<c:when test="${list.writeForm3_status eq '요청' }">
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

												<c:when test="${list.writeForm3_status eq '진행' }">
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
												
												<c:when test="${list.writeForm3_status eq '피드백' }">
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
												
												<c:when test="${list.writeForm3_status eq '완료' }">
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
												
												<c:when test="${list.writeForm3_status eq '보류' }">
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

									<c:if test="${list.writeForm3_workersName ne null}">
									<hr>	
									<!-- 담당자 -->
									<div class="work_form_manager">
										<div>
											<label id="work_worker_img" style="margin-right: 5px;"></label> 
											<div style="display: inline-flex;">
											<c:set var="taskNum" value="${list.writeForm3_tasknum }"/>
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
											
											<div style="display: inline-block;">
											
											<input type="text" class="modified_worker" placeholder="담당자 추가" style="display: none;"/>
											<div class="modified_worker_select_div">
												<ul style="list-style: none; border: 1px solid lightgray; background-color: white; padding-left: 0px;">
													<!-- forEach -->
													<c:forEach var="userList" items="${userList}">
														<li>
															<input type="hidden" name="member_id" value="${userList.member_id }"/>
															<a id="modified_task_User">${userList.member_name}</a>
														</li>
													</c:forEach>
													<!-- //forEach -->
												</ul>
											</div>
											
											</div>
											
											<div id="worker_append_div" style="margin-left: 26px; margin-top: 5px">
												
											
											</div>
										</div>
									</div>
									</c:if>
									<!-- //담당자 -->


									<!-- 시작일 -->
									<c:if test="${list.writeForm3_start_date ne null}">
									<hr>
									
									<div>
										<div>
											<label id="work_start_img"></label>
											<div style="display: inline;">
												<input type="text" placeholder="시작일" readonly="readonly"
													value="${list.writeForm3_start_date }"
													style="border-style: none;">
											</div>

										</div>
									</div>
									</c:if>
									<!-- 시작일 -->


									<!-- 마감일 -->
									<c:if test="${list.writeForm3_end_date ne null}">
									<hr>
									<div>
										<div>
											<label id="work_end_img"></label>
											<div style="display: inline;">
												<input type="text" placeholder="마감일" readonly="readonly"
													value="${list.writeForm3_end_date }"
													style="border-style: none;">
											</div>

										</div>
									</div>
									</c:if>
									<!-- 마감일 -->


									<!-- 달성도 -->
									<c:if test="${list.writeForm3_progress ne null}">
									<hr>
									<div>
										<div>
											<label id="work_progress_img"></label> <input type="hidden"
												id="work_progress" value="0">
											<div style="display: inline;">
												<progress id="progress_a" value="${list.writeForm3_progress }"
													max="100"></progress>
											</div>
										</div>
									</div>
									</c:if>
									<!-- 달성도 -->


									<!-- 우선순위 -->
									<c:if test="${list.writeForm3_order ne null}">
									<hr>
									<div>
										<div>
											<label id="work_order_img"></label>
											<div style="width: 40%; display: inline-block;">
												<input type="text" placeholder="우선순위 선택" readonly="readonly"
													value="${list.writeForm3_order }"
													onclick="orderSelectDiv()" style="border-style: none;">
											</div>
										</div>
									</div>
									</c:if>
									<!-- 우선순위 -->
									<hr>

									<!-- 내용 -->
									<pre id="write_c" class="div_text_write" 
										style="border: none;">${list.writeForm3_content }</pre>

									<!-- //내용 -->

								</div>
								<!-- //업무 내용 들어가는 곳 -->

								<!-- 이미지 -->
								<div id="post_images">
									<c:set var="imgList" value="${fn:split(list.img_name,',')}"/>
									<c:forEach var="img" items="${imgList}">
										<img src="${list.img_path }${img}">
										
									</c:forEach>
								</div>
								<!-- 파일 -->

								<c:if test="${list.file_name ne null}">
									<div id="post_files">
										<div class='post_file' >
											<div style='height: 80px; width: 100%; border: 1px solid #eaeaea; position: relative;'>
												<img id='download_icon'>
													<dl class='file_div'>
														<dt>
															<a>${list.file_name}</a>	
														</dt>
														<dd style='margin: 0px;'>${list.file_size }</dd>
													</dl>
											<div class='down_fil' >
											<c:set var="file_path" value="${list.file_path}"></c:set>
											<c:set var="file_path_length" value="${fn:length(file_path) }"></c:set>
											<a id='down_logo' style='display: inline-block;color: #555;' target="_blank" href='${fn:substring(file_path,25,file_path_length)}'download>&nbsp;&nbsp;&nbsp;다운로드</a>	
											</div>
										</div>
									</div>
	
									</div>
								</c:if>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
								<!-- 일반글 -->




							</div>
							<!-- 글내용 -->

							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay" style="height: 40px;">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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

					</c:when>

					<c:when test="${form_name eq 'scheWrite'}">
						<div class="post_idx"id="${list.article_id }" name="${list.form_name }">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 10px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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

								<!-- 일정 -->
								<div class="works" style="border: 1px solid #eaeaea;">
									<!-- 글제목 -->
									<dl class="work_calendar">
										<dt class="work_calendar_header">
											<c:set var="start_date" value="${list.writeForm4_start_date}" />
											<span class="work_month">${fn:substring(start_date,5,7)} 월</span><br> <strong
												class="work_day">${fn:substring(start_date,9,11)}일</strong>
										</dt>
										<dd id="write_t" class="wc_title">${list.writeForm4_title }</dd>
										<c:choose>
											<c:when test="${list .writeForm4_start_time eq null and list.writeForm4_end_time eq null} ">
												<dd class="wc_date">${list.writeForm4_start_date}  ~  ${list.writeForm4_end_date}</dd>
											</c:when>
											<c:when test="${list .writeForm4_start_date eq list.writeForm4_end_date} ">
												<dd class="wc_date">${list.writeForm4_start_date}, ${list.writeForm4_start_time}:00  ~  ${list.writeForm4_end_time}:00</dd>
											</c:when>
											<c:otherwise>
												<dd class="wc_date">${list.writeForm4_start_date} ${list.writeForm4_start_time}:00  ~  ${list.writeForm4_end_date} ${list.writeForm4_end_time}:00</dd>
											</c:otherwise>
										</c:choose>
									</dl>
									<!-- 글제목 -->

									<!-- 지도 -->
									<c:if test="${list.writeForm4_latlng ne null}">
										<div class="work_map">
											<span class="map_icon"></span> <span
												style="margin-left: 25px;">검색 위치</span> 
												<div id="writeForm2_map">
													<img src="https://maps.googleapis.com/maps/api/staticmap?
												center=${list.writeForm4_latlng }
												&zoom=18
												&size=480x300
												&maptype=roadmap
												&markers=color:red%7Clabel:C%7C${list.writeForm4_latlng }
												&key=AIzaSyA2ufsIg_pi0agHyW6dFEgXMCPIH8Aiw10">
												</div>
										</div>
									</c:if>
									<div class="work_memo">
										<span class="memo_icon"></span> <pre id="write_c" style="margin-left: 25px;">${list.writeForm4_content }</pre>
									</div>
									<!-- 알람 -->
									<!-- <div class="work_alarm">
										<span class="alarm_icon"></span> 
										<span style="margin-left: 25px;">알림</span>

									</div> -->
									<!-- 알람 -->
									
									<!-- 지도 -->
								</div>

								<!-- 일정 -->

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
							</div>



							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->

							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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

					</c:when>

					<c:when test="${form_name eq 'todoWrite'}">
						<div class="post_idx" id="${list.article_id }" name="${list.form_name }">
							<!-- 탑 -->
							<div class="top_writer">
								<div class="photo" style="float: left;">
									<!-- 스크립트로 실행 -->
									<img id="user_profile">
								</div>
								<div style="padding-left: 30px; float: left;">
									<span>${list.writer }</span><br> <span
										style="font-size: 10px;">${list.regDate }</span><span
										id="공개범위설정"> <img></span>
								</div>
								<div style="margin: -10px 0px 0px 10px;">
									<c:if test="${user.seq eq list.member_id}">
										<div style="float: right; padding-left: 10px;">
											<a id="set_icon" class="article_setting"></a>
										</div>
									</c:if>

									<div style="float: right;">
										<c:choose>
											<c:when test="${list.article_pix eq '0'}">
												<input id="pin_icon" class="pin" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
											<c:when test="${list.article_pix eq '1'}">
												<input id="pin_icon" class="pin_pixed" type="button" name="article_pix" value="${list.article_pix}"/>
											</c:when>
										</c:choose>
										<input type="hidden" name="project_id" value="${project.project_id}"> 
									</div>
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
								
								<div class="todo_datas"
									style="width: 100%; padding: 10px 10px 10px 10px; border: 1px solid lightgray;">

									<div style="width: 100%; height: 50px;">
										<div>
											<strong id="write_t" >${list.writeForm5_title }</strong>
											<span
												style="display: inline-block; width: 80px; font-size: 11px;"><span id="set_bar"></span>%</span>
											<span class="totalpg" style="display: inline-block; font-size: 12px;">완료
												<span id="todo_success"></span>건 / 전체 <span id="todo_total"></span>건</span>
										</div>
										<div>
											<progress id="pgval" value="0" max="100" style="width: 100%;"></progress>
										</div>
									</div>

									<!--  forEach  -->
									<c:forEach var="todoList" items="${todoList}">
										<c:if test="${list.article_id eq todoList.article_id }">
											
										<hr style="margin-bottom: 0.6rem;">
											
										<div id="todoList" class="tdlist" name="${todoList.todo_id}" style="height: 50px;">
											<div
												style="display: inline-block; vertical-align: middle; width: 5%;">
												<c:choose>
													<c:when test="${todoList.todo_success eq '0' }">
														<a id="todo_check" class="tcheck"></a>
													</c:when>
													<c:when test="${todoList.todo_success eq '1' }">
														<a id="todo_check_on"class="tcheck"></a>
													</c:when>
												</c:choose>
											</div>
											<div
												style="display: inline-block; vertical-align: middle; width: 94%; height: 40px;">
												<span class="todo_c" style="vertical-align: middle; width: 276px; display: inline-block;">${todoList.worker_content}</span> 
												<span class="todo_d" style="vertical-align: middle; margin-right:10px;">${todoList.worker_date }</span> 
													<img src="images/empty_photo_s.png" id="${todoList.member_id}" name="${todoList.worker_name }" style="display: inline-block; vertical-align: middle;">
											</div>
										</div>
										</c:if>
									</c:forEach>

									<!--  //forEach  -->

								</div>

								<div class="article_status" style="text-align: right; padding-right: 10px;">
									<!-- <span style="font-size: 12px;">좋아요 <span class='reply_count'></span> 개</span> -->
									<span style="font-size: 12px;">댓글 <span class='reply_count'></span> 개</span>
								</div>
							</div>



							<!-- 좋아요 담아두기 -->

							<div class="bottom_lay">
								<ul class="bottom_list">
									<!-- span class='reply_count'></span> 개</span> -->
									<li><a id="input_btn_icon">댓글작성</a></li>
									<%-- <li>
										<c:forEach var="containList" items="${containList }">
											<c:if test="${containList.article_id eq list.article_id }">
												<input type="hidden" value="${containList.article_contain}"/>
											</c:if>
										</c:forEach>
										<a id="bringIcon" class="bringIcon">담아두기</a>
									</li> --%>
								</ul>
							</div>
							<!-- 글내용 -->
							<div class="reply_div"  style="display: none;">
							
							<!-- 						댓글 작성 -->
							<c:forEach var="reply" items="${replyList }">

								<c:set var="reply_article_id" value="${reply.article_id }" />

								<c:if test="${article_id eq reply_article_id }">
									<div class="remark_div">

										<div class="photo" style="float: left; padding-left: 10px;">
											<img id="user_profile_remark">
										</div>
										<c:if test="${list.member_id eq reply.member_id }">
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
									value="${list.article_id }">
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
					</c:when>



				</c:choose>
			</c:forEach>

		</div>
		<!-- 게시글 출력하는 곳 -->
	</div>
</div>


<!-- //게시글 넣는곳 -->
<c:if test="${list.writeForm3_tasknum ne null}">
	<script>
		$('.work_report_border').show();
	</script>		
</c:if>
<c:forEach var="pixedList" items="${pixedList }">
	<c:if test="${pixedList.article_pix == '1' }">
		<script>
			$('#upper_fixed_article').show();
		</script>		
	</c:if>
</c:forEach>