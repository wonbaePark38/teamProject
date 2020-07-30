<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>푸쉬 알림 설정</title>
    <script src="script/jquery-3.5.1-min.js"></script>
    <link href="css/pushAlramSetting.css" rel="stylesheet">
    <script type="text/javascript" src="script/configScript.js"></script>

</head>

<body>
    <div class="wrap">
        <header>
            푸쉬 알림 설정
        </header>

        <div class="alram-switch-div">
            <strong>
                알림
            </strong>
            <div class="alram-switch">

                <label class="switch1">
                    <input type="checkbox" id="alram1" checked="checked">
                    <span class="slider1 round"></span>
                </label>
                
            </div>
        </div>

        <div>
            새로운 글, 댓글 등록 또는 채팅 알림을 실시간으로 알려드립니다.
        </div>

        <div class="alram-type">
            <div class="project-alram">
                <input type="checkbox" class="checkbox-style one">
                <span style="margin-left: 10px;">프로젝트 알림</span>
            </div>

            <div class="chatting-alram">
                <input type="checkbox" class="checkbox-style two">
                <span style="margin-left: 10px;">채팅 알림</span>
            </div>
        </div>
        <div class="not-prohibite-switch-div">
            <strong>
                방해금지 모드 설정
            </strong>

            <div class="alram-switch2">

                <label class="switch2">
                    <input type="checkbox" id="alram2">
                    <span class="slider2 round"></span>
                </label>
             
            </div>

        </div>
        <br />
        <label>
            시간설정
        </label>
        <div>
            설정한 시간 동안에는 알림을 받지 않습니다.
        </div>

        <div class="combobox-div">
            <div>
                <select name="start-time" class="start-combobox" disabled='disabled'>
                   <option value="">01:00</option>
                   <option value="">02:00</option>
                   <option value="">03:00</option>
                   <option value="">04:00</option>
                   <option value="">05:00</option>
                   <option value="">06:00</option>
                   <option value="">07:00</option>
                   <option value="">08:00</option>
                   <option value="">09:00</option>
                   <option value="">10:00</option>
                   <option value="">11:00</option>
                   <option value="">12:00</option>
                   <option value="">13:00</option>
                   <option value="">14:00</option>
                   <option value="">15:00</option>
                   <option value="">16:00</option>
                   <option value="">17:00</option>
                   <option value="">18:00</option>
                   <option value="">19:00</option>
                   <option value="">20:00</option>
                   <option value="">21:00</option>
                   <option value="">22:00</option>
                   <option value="">23:00</option>
                   <option value="">24:00</option>
                </select>
            </div>
            &nbsp;
            <em>~</em>
            &nbsp;
            <div>
                <select name="end-time" class="end-combobox" disabled='disabled'>
                   <option value="">01:00</option>
                   <option value="">02:00</option>
                   <option value="">03:00</option>
                   <option value="">04:00</option>
                   <option value="">05:00</option>
                   <option value="">06:00</option>
                   <option value="">07:00</option>
                   <option value="">08:00</option>
                   <option value="">09:00</option>
                   <option value="">10:00</option>
                   <option value="">11:00</option>
                   <option value="">12:00</option>
                   <option value="">13:00</option>
                   <option value="">14:00</option>
                   <option value="">15:00</option>
                   <option value="">16:00</option>
                   <option value="">17:00</option>
                   <option value="">18:00</option>
                   <option value="">19:00</option>
                   <option value="">20:00</option>
                   <option value="">21:00</option>
                   <option value="">22:00</option>
                   <option value="">23:00</option>
                   <option value="">24:00</option>
                </select>
            </div>

        </div>
    </div>
</body>

</html>