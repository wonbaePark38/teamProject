<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/lockModeConfig.css" rel="stylesheet">
    <script src="script/jquery-3.5.1-min.js"></script>
    <script type="text/javascript" src="script/pushAlramSetting.js"></script>
</head>
<body>
   <div class="wrap">
        
    <header>
        <strong>잠금모드</strong>
    </header>

    <div class="lock-switch-div">
        <strong>
            잠금모드 설정
        </strong>
        <div class="lock-switch123">
            <label class="lock-switch">
                <input type="checkbox" id="lock">
                <span class="slider round"></span>
            </label>
           
        </div>
    </div>

    <h5>해당 시간만큼 사용하지 않으면 잠금처리됩니다.</h5>
    <br>
    <select name="setting-time" class="lock-select" disabled="disabled">
        <option value="">1분</option>
        <option value="">5분</option>
        <option value="">10분</option>
        <option value="">30분</option>
        <option value="">1시간</option>
        <option value="">2시간</option>
        <option value="">3시간</option>
        <option value="">4시간</option>
        <option value="">5시간</option>
        <option value="">6시간</option>
    </select>
   </div>
</body>
</html>