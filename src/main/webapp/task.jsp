<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
<link href="css/write_completion.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	.pspan {
		font-weight:bold;
		position: absolute;
	    margin-top: 8.5px;
	    margin-left: 46px;
	}
	.taskpbar{
	    height: 40px;
    	width: 110px;
	}
	.tdate {
		 padding: 0px 17px;
	 }
	 .table_list a{
		 font-weight: normal;
	 }
	 .tstatus{
	 	padding: 1px 10px;
	    border-radius: 5px;
	    color: #fff;
	    font-weight: 800;
	 }
</style>
<script type="text/javascript">
    function fold1(){
      document.getElementById('more1').style.display=(document.getElementById('more1').style.display=='block') ? 'none' : 'block';
    }
    function fold2(){
        document.getElementById('more2').style.display=(document.getElementById('more2').style.display=='block') ? 'none' : 'block';
    }
    function fold3(){
        document.getElementById('more3').style.display=(document.getElementById('more3').style.display=='block') ? 'none' : 'block';
    }
    function fold4(){
        document.getElementById('more4').style.display=(document.getElementById('more4').style.display=='block') ? 'none' : 'block';
    }
</script>
</head>
<body style="background-color:rgb(242, 242, 242);">
<jsp:include page='privateConfigHeader.jsp'></jsp:include>
	<div class="container" style="top: 60px;position: relative;">
		<div class="">
			<!-- 업무 메뉴 -->
			<div class="" id="task_menu" style="float:left;">
				<div>
					<div>
						<div>업무 구분</div>
						<div class="work_nemu">
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="myTask"
									name="task" /> &nbsp;<span>내 업무</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="2" id="requireTask"
									name="task" /> &nbsp;<span>요청한 업무</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>전체 업무</span>
								</label>
							</div>
						</div>
						
						<div><a onclick="fold1()">상태</a></div>
						<div id="more1" class="board" style="display: none;">
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>요청</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>진행</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>피드백</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>완료</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>보류</span>
								</label>
							</div>
						</div>

						<div><a onclick="fold2()">업무순위</a></div>
						<div id="more2" class="board" style="display: none;">
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>긴급</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>높음</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>보통</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>낮음</span>
								</label>
							</div>
							<div>
								<label>
									<input type="checkbox"> &nbsp;
									<span>없음</span>
								</label>
							</div>
						</div>
						
						<div><a onclick="fold3()">시작일</a></div>
						<div id="more3" class="board" style="display: none;">
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="myTask"
									name="task" /> &nbsp;<span>전체</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="2" id="requireTask"
									name="task" /> &nbsp;<span>오늘</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>이번주</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>이번달</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>날짜미정</span>
								</label>
							</div>
						</div>
						
						<div><a onclick="fold4()">마감일</a></div>
						<div id="more4" class="board"   style="display: none;">
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="myTask"
									name="task" /> &nbsp;<span>전체</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="1" id="myTask"
									name="task" /> &nbsp;<span>지연</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="2" id="requireTask"
									name="task" /> &nbsp;<span>오늘까지</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>이번주까지</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>이번달까지</span>
								</label>
							</div>
							<div class="rdo_btn">
								<label> <input type="radio" value="3" id="totalTask"
									name="task" /> &nbsp;<span>날짜미정</span>
								</label>
							</div>
						</div>


					</div>
				</div>
			</div>


			<!-- 업무 내용 -->
			<div class="" >
				<div style="float: left; margin-left: 45px;">
					<span>전체 업무 (1)</span>
				</div>

				<div class="task_head">
					<div class="excel_load">
						<a class="excel_btn"><span>엑셀내려받기</span></a>
					</div>
					<div class="view_btn">
						<a class="view_group"> <span>묶어보기</span>
						</a>
						<div style="display: none;">
							<ul>
								<li id="none" value="0"><a>없음</a></li>
								<li id="status" value="1"><a>상태 기준</a></li>
								<li id="duedate" value="2"><a>마감일 기준</a></li>
								<li id="prj" value="3"><a>프로젝트 기준</a></li>
							</ul>
						</div>
					</div>
					<div class="task_set">
						<a id="setColumn">보기설정</a>
					</div>
					<div class="task_close">
						<a id="task_close">닫기</a>
					</div>
				</div>
				<!-- task_header -->


				<div class="task_contents"style="margin-left:140px;">
					<div id="contents_container">
						<div class="work_table">
							<table class="table_list">
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
									<th class="work_table_th"><a class="tdate">수정일</a></th>
								</tr>
								<c:forEach var="taskList" items="${taskList}">
									<tr>
										<td><a>${taskList.writeForm3_tasknum}</a></td>
										<c:choose>
											<c:when test="${taskList.writeForm3_status eq '요청'}">
												<td><a class="tstatus" style="background-color: #4aaefb;">${taskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${taskList.writeForm3_status eq '진행'}">
												<td><a class="tstatus" style="background-color: #50b766;">${taskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${taskList.writeForm3_status eq '피드백'}">
												<td><a class="tstatus" style="background-color: #f17a19;">${taskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${taskList.writeForm3_status eq '완료'}">
												<td><a class="tstatus" style="background-color: #2e417e;">${taskList.writeForm3_status}</a></td>
											</c:when>
											<c:when test="${taskList.writeForm3_status eq '보류'}">
												<td><a class="tstatus" style="background-color: #aeaeae;">${taskList.writeForm3_status}</a></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${taskList.writeForm3_order ne null}">
												<td><a>${taskList.writeForm3_order}</a></td>
											</c:when>
											<c:when test="${taskList.writeForm3_order eq null}">
												<td><a>-</a></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${taskList.writeForm3_title ne null}">
												<td><a>${taskList.writeForm3_title}</a></td>
											</c:when>
											<c:when test="${taskList.writeForm3_title eq null}">
												<td><a>-</a></td>
											</c:when>
										</c:choose>
										<td><span class="pspan">${taskList.writeForm3_progress}%</span><progress class="taskpbar" value="${taskList.writeForm3_progress}" max="100"></progress></td>
										<td><a>${taskList.writeForm3_workersName}</a></td>
										<td><a>${taskList.writer}</a></td>
										<td><a>${taskList.writeForm3_start_date}</a></td>
										<td><a>${taskList.writeForm3_end_date}</a></td>
										<td><a>${taskList.regDate}</a></td>
										<td><a>수정일</a></td>
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

</body>
</html>