<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/makeChatRoom.css" rel="stylesheet">
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="script/makeChatRoom.js"></script>
	
</head>
<body>
    <div class="wrap">
      <div class="header">
          <label>채팅방 만들기</label>
      </div>
      <div class="input-form">
      
        <ul>
            <li>
                <label>방 이름</label>
                <input type="text" id="roomName-input" name="chatRoomName">
            </li>

            <li>
                <label>프로젝트 선택</label>
                <select name="projectId" id="select-projectId">
                    <option value="">프로젝트를 선택하세요</option>
                </select>
            </li>
            
            <li>
                <label>암호 설정</label>
                <input type="radio" name="radioSelect" id="select-private" value="y">예
                <input type="radio" name="radioSelect" id="select-public" value="n" checked="checked">아니오

            </li>
            <li>
                <label>비밀번호</label> 
                <input type="password" name="roomPassword" id="password-input" disabled> 
            </li>

            <li>
                <label>비밀번호 확인</label>
                <input type="password" id="password-input-re" disabled>
            </li>
            <li style="margin-left: 80px;">
               <button type="button" id="confirm" >만들기</button>
               <button type="button" id="cancel" >취소</button>
            </li>
        </ul>
       
      </div>
      
      
    </div>
</body>
</html>