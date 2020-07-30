<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>접속 통계</title>
    <link href="css/connectionStatistics.css" rel="stylesheet">
    <script src="script/jquery-3.5.1-min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript" src="script/connectionStatistics.js"></script>
    <script type="text/javascript">
       
      </script>


</head>
<body>
    <div class="mainWrap">
        <header>
            접속 통계
        </header>
        <div class="contents">
            <div class="select-type-text-div">
                <div class="month-select">
                    
                    <Strong>월별 통계 차트</Strong>
                    <label>| 최근 6개월</label>
                   
                </div>
                
                <div class="week-select">
                    
                    <Strong>주별 통계 차트</Strong>
                    <label>| 최근 10주</label>
                </div>
            </div> <!-- end select-type-text-div-->
            
            <div class="select-bt-div">
                <button type="button" id="month-select-bt">
                    월별
                </button>

                <button type="button" id="week-select-bt">
                    주별
                </button>
            </div>

            <div id="chart-div"></div>

            <div class="data-input-div">
                <form method="method" action="#">
                    <select id="search-type">
                        <option value="name">이름</option>
                        <option value="department">부서</option>
                        <option value="position">직책</option>
                    </select>

                    <input type="text" value="검색어를 입력해주세요" name="keyword" class="search-keyword">
                    <input type="submit" id="submit-bt" value="검색">

                    <input type="radio" name="login-or-not" checked='checked'>접속자
                    <input type="radio" name="login-or-not">비접속자
                </form>    
            </div>

            <div class="table-view-div">
                <table class="statistics">
                    <thead>
                        <tr>
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
                    <tbody>
                        <tr>
                            <td>
                                박원배
                            </td>
                            <td>
                                
                            </td>
                            <td>
                               
                            </td>
                            <td>
                                deux38@naver.com
                            </td>
                            <td>
                                30
                            </td>
                        </tr>
                    </tbody> <!--for문 들어갈 자리-->
                     
                </table>
            </div>
        </div> <!--end contents-->

    </div>
</body>

</html>