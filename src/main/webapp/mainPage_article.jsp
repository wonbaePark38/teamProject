<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 게시글 넣는곳 -->
<div class="article">
	<div class="article_margin">

		<!-- 타이틀 -->
		<div class="title_margin">
			<div class="title_border">
				<p id="title">Article</p>
			</div>
		</div>
		<!-- 타이틀 -->

		<!-- 업무 리포트 -->
		<div class="work_report_border">
			<div class="work_report">
				<div class="work_report_title">
					<!-- 프로젝트 명 -->
					<p style="display: inline-block;">프로젝트명</p>

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
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
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
						<form method="post" action="writeform1.do" id="writeForm_1"
							enctype="multipart/form-data">

							<input type="hidden" name="form_name" value="nomalWrite">
							<div id="writeForm_div">

								<textarea name="writeform1_content" id="writeForm1_content_text"
									class="div_text_write" contenteditable="true"></textarea>


								<!-- 파일 업로드 -->
								<div id="writeForm1_uploadFile" class="post_file"></div>
								<!-- //파일 업로드 -->

								<!-- 이미지 업로드 -->
								<div>
									<div id="writeForm1_uploadImg" class="post_images"></div>
								</div>
								<!-- //이미지 업로드 -->

								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;"
									onsubmit="attech_file_check()">
									<input type="file" id="writeForm1_file" name="writeForm1_file"
										onchange="fileCheck(this)" style="display: none;"> <a
										id="writeForm1_file_add" class="add_file"></a> <input
										type="file" id="writeForm1_img" name="writeForm1_img"
										onchange="imgCheck(this)"
										accept="image/gif, image/jpg, image/png"
										style="display: none;"> <a id="writeForm1_img_add"
										class="add_pic"></a>
									<div style="display: inline-block; float: right;">
										<select style="vertical-align: middle; height: 27px;">
											<option></option>
											<option></option>
										</select> <a class="submit_a" onclick="writeForm_submit1()">올리기</a>
									</div>
								</div>
								<!-- //하단 툴바 -->

							</div>

						</form>
						<!-- //글 쓰기 -->

						<!-- 글쓰기 2.0 -->
						<form>
							<div class="write20_form" id="write20Form_div">

								<!-- 제목입력 -->
								<div class="writeForm2_title">
									<input name="writeForm2_title" type="text"
										placeholder="제목을 입력해 주세요"
										style="width: 80%; border-style: none;">
								</div>
								<hr>
								<!-- 내용입력 -->
								<div class="writeForm2_content">
									<div class="div_text_write" contenteditable="true"></div>
								</div>
								<!-- //내용입력 -->

								<!-- 지도 영역 -->
								<div id="location_div">
									<div id="locationMap"></div>
								</div>
								<!-- //지도 영역 -->



								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

									<a class="add_file"></a> <a class="add_pic"></a> <a
										class="add_loc" onclick="locationPick()"></a>
									<div style="display: inline-block; float: right;">
										<select style="vertical-align: middle; height: 27px;">
											<option></option>
											<option></option>
										</select> <a class="submit_a">올리기</a>
									</div>


									<!-- 툴바 장소 검색 -->
									<div id="search_location_div">
										<input id="search_location" type="text" name="location_name">
									</div>
									<!-- //툴바 장소 검색 -->

								</div>

								<!-- //하단 툴바 -->

							</div>
						</form>
						<!-- //글쓰기 2.0 -->



						<!-- 업무 글쓰기 -->
						<form>
							<div class="work_form" id="workForm_div">

								<!-- 업무명 -->
								<div id="work_form_title">
									<input type="text" name="workForm_title"
										placeholder="업무명을 입력해 주세요"
										style="width: 80%; border-style: none;">
								</div>
								<!-- //업무명 -->
								<hr>
								<!-- 상태 -->
								<div class="work_form_status">
									<label id="work_status_img"></label>
									<!-- 상태 선택 테이블 -->
									<div id="status_select_div">
										<div style="display: inline-block; width: 16%;">
											<span id="request" onclick="request()"
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
										<label id="work_worker_img"></label> <input type="text"
											id="work_worker_select" onclick="work_workerSelect()"
											placeholder="담당자 추가">
										<div id="worker_select_div">
											<ul
												style="list-style: none; background-color: white; padding-left: 0px;">
												<li>테스트1</li>
												<li>테스트2</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>
												<li>테스트3</li>

											</ul>
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
												<input type="text" id="start_date" placeholder="시작일"
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
												<input type="text" id="end_date" placeholder="마감일"
													style="border-style: none;">
											</div>

										</div>
									</div>
									<!-- 마감일 -->

									<hr>

									<!-- 달성도 -->
									<div>
										<div>
											<label id="work_progress_img"></label>
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
												<input type="text" placeholder="우선순위 선택"
													style="border-style: none;">
											</div>
										</div>
									</div>
									<!-- 우선순위 -->
									<div id="order_div">
										<div>
											<ul>
												<li>낮음</li>
												<li>보통</li>
												<li>높음</li>
												<li>긴급</li>
											</ul>
										</div>
									</div>
									<hr>

								</div>
								<!-- //추가항목 -->


								<!-- 내용 -->
								<div class="work_form_content">
									<div class="div_text_write" contenteditable="true"
										style="width: 100%;"></div>
								</div>
								<!-- //내용 -->




								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

									<a class="add_file"></a> <a class="add_pic"></a>
									<div style="display: inline-block; float: right;">
										<select style="vertical-align: middle; height: 27px;">
											<option></option>
											<option></option>
										</select> <a class="submit_a">올리기</a>
									</div>
								</div>

								<!-- //하단 툴바 -->


							</div>
						</form>
						<!-- //업무 글쓰기 -->




						<!-- 일정 -->
						<form>
							<div class="schedule_form" id="scheduleForm_div">
								<div>
									<!-- 일정 제목 -->
									<div>
										<input type="text" style="width: 100%; border-style: none;"
											placeholder="일정 제목을 입력해주세요">
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
													<input type="text" id="sche_start_date" placeholder="오늘날자"
														style="width: 20%;">&nbsp; <select
														name="start_time" id="start_time_select">
														<option>00:00</option>
														<option>00:30</option>
														<option>01:00</option>
														<option>01:30</option>
														<option>02:00</option>
														<option>02:30</option>
													</select> &nbsp;~&nbsp; <input type="text" id="sche_end_date"
														placeholder="종료날자" style="width: 20%;">&nbsp; <select
														name="end_time" id="end_time_select">
														<option>00:00</option>
														<option>00:30</option>
														<option>01:00</option>
														<option>01:30</option>
														<option>02:00</option>
														<option>02:30</option>
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
													<input id="address" type="text" placeholder="주소입력" />
												</div> <!-- //장소 검색 --> <!-- google Map -->
												<div id="googleMap_div">
													<div id="googleMap" style="width: 100%; height: 200px;"></div>
												</div> <!-- //google Map --></li>

											<hr>

											<!-- 몇분전에 알람줄지 -->
											<li>
												<!-- 알람 -->
												<div class="schedule_alarm">

													<span id="sche_alarm_img"></span> <select>
														<option>10분전</option>
														<option>30분전</option>
														<option>1시간전</option>
														<option>2시간전</option>
														<option>12시간전</option>
													</select>
												</div>
											</li>
											<!-- //몇분전에 알람줄지 -->

											<hr>

											<!-- 일정 메모 -->
											<li>
												<div>
													<div class="div_text_write" contenteditable="true"></div>
												</div>
											</li>

											<li>
												<!-- 하단 툴바 -->
												<hr>
												<div
													style="width: 100%; text-align: right; margin-top: 5px; margin-bottom: 5px;">
													<div style="display: inline-block;">
														<select style="vertical-align: middle; height: 27px;">
															<option></option>
															<option></option>
														</select> <a class="submit_a">올리기</a>
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
						<form>
							<div class="todo_form" id="todoForm_div">
								<!-- 할일 제목 -->
								<div>
									<input placeholder="할일제목을 입력해 주세요"
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
										<select style="vertical-align: middle; height: 27px;">
											<option></option>
											<option></option>
										</select> <a class="submit_a">올리기</a>
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
				
				
				
				
				<div style="background-color: black; width: 100%; height: 300px;"></div>
				
			</div>
		</div>
		<!-- //글작성 폼 -->

	</div>
</div>
<!-- //게시글 넣는곳 -->
