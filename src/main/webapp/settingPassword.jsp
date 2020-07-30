<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 설정</title>
    <link href="css/settingPassword.css" rel="stylesheet">

    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="script/script.js"></script>
    <script type="text/javascript" src="script/configScript.js"></script>
</head>

<body>


    <div class="wrap">
        <header>
            비밀번호 설정
        </header>

        <div class="text-area">
            <div>
                <h3>비밀번호 재설정이 가능합니다.</h3>
            </div>
            <div>
                비밀번호는 영문, 숫자 포함 6자리 이상이어야 합니다.
            </div>
        </div>
        <div class="form-container">
            <form method="POST" action="#">
                <div class="input-password">
                    <label>
                        비밀번호
                    </label>
                    
                  <input type="password">    
                           
                 </div>
                 <div class="check-password">
                     <label>
                        비밀번호 확인
                     </label>
                     
                    <input type="password">
                    <input class="change-button" type="submit" value="변경">
                </div>
            </form>
            
        </div>
        
    
    </div> <!--wrap-->
    </body>
</html>