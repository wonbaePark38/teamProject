<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>언어설정</title>
    <link href="css/languageSetting.css" rel="stylesheet">
</head>
<body>
    <div class="wrap">
        <header>
            언어 및 타임존 설정
        </header>

        <div class="language-setting-div">
            <h3>언어 설정</h3>
            <select id="language-select">
                <option value="korean">한국어 (Korean)</option>
                <option value="english">영어 (English)</option>
            </select>
        </div>
        
        <div class="small-text">
            플로우에서 사용할 언어를 선택하십시오.
            <span class="present-language"></span>
            로 설정되어 있습니다.
        </div>
       
        <div class="timezone-setting-div">
            <h3>타임존 설정</h3>
            <select id="timezone-select">
                <option value="korean">(UTC +09:00) 대한민국(Korea),일본(Japan)</option>
                <option value="korean">(UTC -08:00) 미국 LA(Los Angeles, USA), DST</option>
                <option value="korean">(UTC -05:00) 미국 뉴욕(New York, USA), DST</option>
                <option value="korean">(UTC +08:00) 싱가폴(Singapole), 필리핀(Philippines)</option>
            </select>
        </div>

        <div class="small-text">
            플로우는 타임존을 사용하여 타임라인 내 등록되어 있는 글과 댓글에 시간을 표기하며
            신규 알림을 발송합니다.<br/>
            *현재 <span></span> 로 설정되어 있습니다.
        </div>


    </div>
</body>
</html>