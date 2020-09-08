<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용 통계</title>
    <link href="css/useStatistics.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/be57023a12.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="mainWrap">
    <jsp:include page="projectManagerPageSidebar.jsp" flush="true" />
    <div style="margin-left:50px">
        <div class="header">
           	 플로우 사용 통계        
        </div>

        <div class="input-div">
            <form method="POST" action="#">
                <select id="select-type">
                    <option value="이름">이름</option>
                    <option value="부서">부서</option>
                    <option value="직책">직책</option>
                    <option value="계정">계정</option>
                </select>
                <input type="text" class="search-keyword" value="검색어를 적어주세요">
                <input type="submit" class="submit-bt" value="검색">
            </form>
            <button id="excel-down" type="button" alt="엑셀 다운로드"> 
                <i class="fas fa-download" style="color:#615cba; font-size: 20px;"></i> 
                엑셀 다운로드
            </button>   
        </div>

        <table class="useStatistics-table">
            <thead>
                <tr>
                    <th scope="col">
                        회사
                    </th>

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
                        참여 프로젝트
                    </th>

                    <th scope="col">
                        게시물수
                    </th>

                    <th scope="col">
                        댓글수
                    </th>

                    <th scope="col">
                        채팅방수
                    </th>

                    <th scope="col">
                        채팅메세지수
                    </th>
                </tr>
            </thead>

            <tbody> <!--for문 들어올 자리-->
                <tr>
                    <td>
                        kkk     
                    </td>

                    <td>
                        박원배
                    </td>

                    <td>
                        3조
                    </td>

                    <td>
                        
                    </td>

                    <td style="display:flex; flex-wrap:wrap;">
                        deux38@naver.com
                    </td>
                    <td>
                        2개
                    </td>
                    <td>
                        5개
                    </td>

                    <td>
                        5개
                    </td>

                    <td>
                        1개
                    </td>

                    <td>
                        50개
                    </td>
                </tr>
            </tbody><!--for문 들어올 자리-->
        </table>
    </div>
    </div>
</body>
</html>