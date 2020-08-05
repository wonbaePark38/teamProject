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
						<form method="post" action="writeform1.do" id="writeForm1_form" enctype="multipart/form-data">

							<input type="hidden" name="form_name" value="nomalWrite">
							<div id="writeForm_div">

								<textarea name="writeform1_content" id="writeForm1_content_text" class="div_text_write"></textarea>

								<!-- 파일 업로드 -->
								<div id="writeForm1_uploadFile" class="post_file"></div>
								<!-- //파일 업로드 -->

								<!-- 이미지 업로드 -->
								<div id="writeForm1_uploadImg" class="post_images"></div>
								<!-- //이미지 업로드 -->

								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;" onsubmit="attech_file_check()">
								
									<input type="file" id="writeForm1_file" name="writeForm_file" onchange="fileCheck(this)" style="display: none;">
									<input type="file" id="writeForm1_img" name="writeForm_img" onchange="imgCheck(this)" accept="image/gif, image/jpg, image/png" style="display: none;"> 
									
									<a id="writeForm1_file_add" class="add_file"></a> 
									<a id="writeForm1_img_add" class="add_pic"></a>
									
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
						<form method="post" action="writeform2.do" id="writeForm2_form" enctype="multipart/form-data">
							<input type="hidden" name="form_name" value="nomalWrite2.0">
							<div class="write20_form" id="write20Form_div">
								<!-- 제목입력 -->
								<div class="writeForm2_title">
									<input name="writeForm2_title" type="text" placeholder="제목을 입력해 주세요" style="width: 80%; border-style: none;">
								</div>
								<hr>
								
								<textarea name="writeForm2_content" id="writeForm2_content_text" class="div_text_write"></textarea>							
								
								<!-- 파일 업로드 -->
								<div id="writeForm2_uploadFile" class="post_file"></div>
								<!-- //파일 업로드 -->

								<!-- 이미지 업로드 -->
								<div id="writeForm2_uploadImg" class="post_images"></div>
								<!-- //이미지 업로드 -->
								
								
								<!-- 지도 영역 -->
								<div id="location_div">
									<div id="locationMap"></div>
								</div>
								<!-- //지도 영역 -->

								

								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">
								
									<input type="file" id="writeForm2_file" name="writeForm_file" onchange="fileCheck(this)" style="display: none;">
									<input type="file" id="writeForm2_img" name="writeForm_img" onchange="imgCheck(this)" accept="image/gif, image/jpg, image/png" style="display: none;"> 
									
									<a id="writeForm2_file_add" class="add_file"></a> 
									<a id="writeForm2_img_add" class="add_pic"></a> 
									<a class="add_loc" onclick="locationPick()"></a>
									
									<div style="display: inline-block; float: right;">
										<select style="vertical-align: middle; height: 27px;">
											<option></option>
											<option></option>
										</select> 
										<a class="submit_a" onclick="writeForm_submit2()">올리기</a>
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
						<form method="post" action="writeform3.do" id="writeForm3_form">
							<div class="work_form" id="workForm_div">

								<input type="hidden" name="form_name" value="workWrite">
								
								<!-- 업무명 -->
								<div id="work_form_title">
									<input type="text" name="workForm3_title" placeholder="업무명을 입력해 주세요" style="width: 80%; border-style: none;">
								</div>
								<!-- //업무명 -->
								<hr>
								<!-- 상태 -->
								<div class="work_form_status">
									<label id="work_status_img"></label>
									<!-- 상태 선택 테이블 -->
									<div id="status_select_div">
									
										<input type="hidden" name="writeForm3_status" id="work_status">
									
										<div style="display: inline-block; width: 16%;">
											<span id="request" onclick="request()" style="background-color: #4aaefb;">요청</span>
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
											<input type="text" id="work_worker_select" onclick="work_workerSelect()" placeholder="담당자 추가">
										</div>
										
										<div id="worker_select_div">
											<ul style="list-style: none; border:1px solid black; background-color: white; padding-left: 0px;">
												<!-- forEach -->
												<li><a onclick="add_worker(this)">테스트1</a></li>
												<li><a>테스트2</a></li>
												<li><a>테스트3</a></li>
												<!-- //forEach -->
											</ul>
										</div>
										
										<input type="hidden" id="work_workers" name="writeForm3_workersName">
										
										<div id="worker_append_div" style="margin-left: 26px; margin-top: 5px"></div>
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
												<input type="text" name="writeForm3_start_date" id="start_date" placeholder="시작일" style="border-style: none;">
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
												<input type="text" name="writeForm3_end_date" id="end_date" placeholder="마감일" style="border-style: none;">
											</div>

										</div>
									</div>
									<!-- 마감일 -->

									<hr>

									<!-- 달성도 -->
									<div>
										<div>
											<label id="work_progress_img"></label>
											<input type="hidden" name="writeForm3_progress" id="work_progress" value="0">
											<div style="display: inline;">
												<progress id="progress" value="0" max="100" onclick="progressBar()"></progress>
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
												<input type="text" name="writeForm3_order" id="work_order" placeholder="우선순위 선택" onclick="orderSelectDiv()" style="border-style: none;">
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
								<div id="writeForm3_uploadFile" class="post_file"></div>
								<!-- //파일 업로드 -->

								<!-- 이미지 업로드 -->
								<div id="writeForm3_uploadImg" class="post_images"></div>
								<!-- //이미지 업로드 -->


								<!-- 하단 툴바 -->
								<hr>
								<div style="width: 100%; margin-top: 5px; margin-bottom: 5px;">

									<a class="add_file"></a> <a class="add_pic"></a>
									<div style="display: inline-block; float: right;">
										<select style="vertical-align: middle; height: 27px;">
											<option></option>
											<option></option>
										</select> <a class="submit_a" onclick="writeForm_submit3()">올리기</a>
									</div>
								</div>

								<!-- //하단 툴바 -->


							</div>
						</form>
						<!-- //업무 글쓰기 -->




						<!-- 일정 -->
						<form method="post" action="writeform4.do" id="writeForm4_form">
							<div class="schedule_form" id="scheduleForm_div">
								<div>
									<!-- 일정 제목 -->
									<div>
										<input type="text" name="writeForm4_title" style="width: 100%; border-style: none;" placeholder="일정 제목을 입력해주세요">
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
													<input type="text" name="writeForm4_start_date" id="sche_start_date" placeholder="오늘날자" style="width: 20%;">&nbsp; 
													<select name="start_time" id="start_time_select">
														<option>00:00</option>
														<option>01:00</option>
														<option>02:00</option>
														<option>03:00</option>
														<option>04:00</option>
														<option>05:00</option>
														<option>06:00</option>
														<option>07:00</option>
														<option>08:00</option>
														<option>09:00</option>
														<option>10:00</option>
														<option>11:00</option>
													</select> 
													
													&nbsp;~&nbsp; 
													
													<input type="text" name="writeForm4_end_date" id="sche_end_date" placeholder="종료날자" style="width: 20%;">&nbsp; 
													<select name="end_time" id="end_time_select">
														<option>00:00</option>
														<option>01:00</option>
														<option>02:00</option>
														<option>03:00</option>
														<option>04:00</option>
														<option>05:00</option>
														<option>06:00</option>
														<option>07:00</option>
														<option>08:00</option>
														<option>09:00</option>
														<option>10:00</option>
														<option>11:00</option>
													</select> 
													<label> 
														<input type="checkbox" id="alldayCheck" onclick="alldayBtn()"> <span>종일</span>
													</label>
												</div> <!-- //날짜 선택 --></li>
											<!-- //데이트 피커 -->

											<hr>


											<!-- 장소검색 -->
											<li>
												<span id="sche_loc_img" style="display: inline-block;"></span> 
												
												<!-- 장소 검색 -->
												<div class="schedule_place" id="sche_place" style="display: inline-block;">
													<input id="address" type="text" placeholder="주소입력" />
												</div> 
												<!-- //장소 검색 --> 
												
												<!-- google Map -->
												<div id="googleMap_div">
													<div id="googleMap" style="width: 100%; height: 200px;"></div>
												</div> 
												<!-- //google Map -->
											</li>

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
						<form method="post" action="writeform5.do" id="writeForm5_form">
							<div class="todo_form" id="todoForm_div">
								<!-- 할일 제목 -->
								<div>
									<input name="writeForm5_title" placeholder="할일제목을 입력해 주세요" style="width: 80%; border-style: none;">
								</div>
								<!-- //할일 제목 -->


								<textarea id="todoContent_external"></textarea>
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






			</div>
		</div>
		<!-- //글작성 폼 -->

		<!-- 미확인 알람 -->
		<div id="unread_alarm_div" style="width: 100%;">
			<div style="width: 100%; height: 50px; background-color: white;">
				<span id="unread_alarm_img"
					style="display: inline-block; vertical-align: middle; margin-left: 8px; margin-right: 11px; width: 20px; height: 22px; background: url(images/sp_sectiontitle_ico1.gif) no-repeat 0 -44px;"></span>
				<h5
					style="display: inline-block; vertical-align: middle; margin-top: 10px; font-size: 15px;">
					<strong>미확인 알람</strong>
				</h5>
				<span
					style="display: inline-block; vertical-align: middle; text-align: center; width: 30px; height: 14px; border-radius: 8px; background-color: red; font-size: 12px;">12</span>
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
		</div>
		<!-- //forEach -->
		<div
			style="text-align: center; vertical-align: middle; background-color: white;">
			<span style="font-size: 9px;">더보기</span>
		</div>
		<!-- //미확인 알람 -->

		<!-- 상단 고정글 -->
		<div id="upper_fixed_article" style="margin-top: 10px;">
			<div
				style="width: 100%; height: 35px; background-color: white; padding: 5px 5px 5px 5px;">
				<span id="upper_fixed_img"
					style="display: inline-block; vertical-align: middle; width: 20px; height: 22px; background: url(images/sp_sectiontitle_ico1.gif) no-repeat 0 -66px;"></span>
				<span style="display: inline-block;">상단 고정글</span> <span
					style="margin-left: 5px;"><strong>2</strong></span>

			</div>
			<!-- forEach -->
			<div style="background-color: white; padding: 5px;">
				<div style="display: inline-block; width: 270px;">
					<span style="display: inline-block;">[피드백]</span> <span
						style="display: inline-block;">글 제목</span>
				</div>
				<span
					style="display: inline-block; vertical-align: middle; text-align: center; width: 60px; height: 13px; font-size: 10px; border-radius: 5px; background-color: lightblue; margin-left: 170px;">요청</span>
			</div>
			<!-- 누르면 나올 게시물 -->
			<div style="display: none;"></div>
			<!-- //누르면 나올 게시물 -->
			<!-- //forEach -->
		</div>
		<!-- //상단 고정글 -->

		<div id="article_show" style=" width: 100%; margin-top: 10px"></div>

	</div>
</div>
<!-- //게시글 넣는곳 -->
