<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="wrap">
        <header>
            접속 기기 관리
        </header>


        <!-- for문 들어올 자리-->
        <div class="table-row">
            <div class="table-left">
                <strong>pc_chrome~~~</strong>
                <span class="last-use">마지막 사용: ~~~~</span>
                <span class="first-use">최초 등록: ~~~~</span>
            </div>
            <div class="table-right">
                <button type="button" id="not-using-device" onclick="removeDevice()" style="display: none;">
                    <span>제거</span>
                </button>


                <label id="using-device" style="display: block;">
                    <span>접속 기기</span>
                </label>
            </div>

        </div>

        <!--end for문 -->
    </div>

</body>
</html>