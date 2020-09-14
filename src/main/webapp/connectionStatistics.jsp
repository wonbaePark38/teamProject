<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>접속 통계</title>
    
    <script src="script/jquery-3.5.1-min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="css/connectionStatistics.css" rel="stylesheet">
    <script src="script/jquery-3.5.1-min.js"></script>
    <script type="text/javascript" src="script/connectionStatistics.js"></script>
  

</head>
<body>
<jsp:include page="privateConfigHeader.jsp" flush="true" />
	<script>
		$('.headerWrap').css('width', '100%');
		$('.headerWrap').css('border', '0');
		$('#inputkeyword').css('display','none');
	</script>
	<div class="mainWrap">
    <jsp:include page="projectManagerPageSidebar.jsp" flush="true" />
    <div id="main-contents">
        <div class="header">
            접속 통계
        </div>
        <div class="contents">
            <div class="select-type-text-div">
                <div class="month-select">
                    <Strong>월별 통계 차트</Strong>
                    <label>| 최근 6개월</label>
                </div>
            </div> <!-- end select-type-text-div-->
				<div id="Line_Controls_Chart">
					<!-- 라인 차트 생성할 영역 -->
					<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
					<!-- 컨트롤바를 생성할 영역 -->
					<div id="controlsArea" style="display: none" style="padding:0px 20px 0px 0px;"></div>
				</div>


				<div class="data-input-div">
               
                    <select id="search-type">
                        <option value="이름">이름</option>
                        <option value="부서">부서</option>
                        <option value="직책">직책</option>
                    </select>

                    <input type="text" placeholder="검색어를 입력해주세요" name="keyword" class="search-keyword">
					<input type="radio" name="login-or-not" value="all" checked='checked'>&nbsp;&nbsp;전체&nbsp;&nbsp;
                    <input type="radio" name="login-or-not" value="connect">&nbsp;&nbsp;접속자&nbsp;&nbsp;
                    <input type="radio" name="login-or-not" value="disconnect">&nbsp;&nbsp;비접속자
                    
            </div>

            <div class="table-view-div">
                <table class="statistics">
                    <thead class="title-head">
                        <tr class="con-statistics-tr">
                            <th scope="col">
                                이름
                            </th>
    
                            <th scope="col">
                                부서
                            </th>
    
                            <th scope="col">
                                직책
                            </th>
    
                            <th scope="col">
                                계정
                            </th>
    
                            <th scope="col">
                                이번달 접속수
                            </th>
                        </tr>
                    </thead>
                    <!--for문 들어갈 자리-->
                  
                     
                </table>
            </div>
        </div> <!--end contents-->
		</div>
    </div>
</body>


  
</html>
