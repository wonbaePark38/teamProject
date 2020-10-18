<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
    <link rel="stylesheet" href="css/searchPassword.css" />
    <script src="./script/jquery-3.5.1-min.js"></script>
    <script type="text/javascript" src="./script/searchPassword.js"></script>
</head>

<body>
    <div class="wrap">
        <div class="header">
            <div class="header-left-menu">
                <a href="index.jsp">
                    <img src="images/bi_flow.png">
                </a>
            </div>
            <div class="header-right-menu">
                <a href="newlogin.jsp">
                    로그인
                </a>
            </div>

        </div>

        <div class="contents">
            <div class="search-label">
                <h1>비밀번호를 잊어버리셨나요?</h1>
                <label>기존에 가입하신 이메일을 입력하시면, 비밀번호 변경 메일을 발송해드립니다.</label>
            </div>

            <div class="search-form">
                <div class="input-email-div">
                    <input type="text" id="email-input" placeholder="이메일"/>    
                </div>

                <div class="email-check-div">
                    <label id="false-email-input-label">
                        	이메일을 발송하였습니다.
                    </label>
                </div>
                
                <div class="send-email-div">
                    <button id="send-emailBt">
                        <span>비밀번호 변경 메일 받기</span>
                    </button>
                </div>
            </div>
        </div>
    </div><!--end wrap-->

</body>
</html>

<!-- 





 -->