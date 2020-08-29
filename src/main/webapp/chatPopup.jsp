<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href='css/chatPopup.css' rel='stylesheet' />
    <script src="script/jquery-3.5.1-min.js"></script>
      <script type="text/javascript" src="script/chatPopup.js"></script>
</head>
<body>
    <div id='chat-wrap'>
        <div id='chat-title'>
            채팅방 이름 들어갈 자리
        </div>
        <div id='chat-content'>
            <textarea id="view-chat-msg" readonly="readonly"></textarea>
        </div>
        <div id='input-msg-div'>
            <textarea id="input-chat-msg"></textarea>
            <button id="send-bt">전송</button>
        </div>
    </div>
</body>

</html>