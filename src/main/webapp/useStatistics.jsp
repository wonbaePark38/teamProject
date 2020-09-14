<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용 통계</title>
    <link href="css/useStatistics.css" rel="stylesheet">
    <script src="script/jquery-3.5.1-min.js"></script>
    <script src="script/useStatistics.js"></script>
    <script src="https://kit.fontawesome.com/be57023a12.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="privateConfigHeader.jsp" flush="true" />
    <div class="mainWrap">
    <jsp:include page="projectManagerPageSidebar.jsp" flush="true" />
    <script>
    	$('.headerWrap').css('width','100%');
		$('.headerWrap').css('border','0');
		$('#inputkeyword').css('display','none');
    </script>
    <div id="main-contents">
        <div class="header">
           	 플로우 사용 통계        
        </div>

        <div class="input-div">
           
                <select id="select-type">
                    <option value="이름">이름</option>
                    <option value="부서">부서</option>
                    <option value="직책">직책</option>
                    <option value="계정">계정</option>
                </select>
                <input type="text" class="search-keyword" placeholder="검색어를 입력해주세요">
               
          
       
        </div>

        <table class="useStatistics-table">
            <thead>
                <tr>
                    <th scope="col">
                       이름
                    </th>

                    <th scope="col">
                        계정
                    </th>

                    <th scope="col">
                        회사
                    </th>

                    <th scope="col">
                        부서
                    </th>

                    <th scope="col">
                        직책
                    </th>
        
                    <th scope="col">
                        게시물수
                    </th>

                    <th scope="col">
                        댓글수
                    </th>
                </tr>
            </thead>
            
        </table>
    </div>
    </div>
</body>
</html>