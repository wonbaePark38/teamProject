<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./script.js"></script>
<script>
 	window.onload = function(){
 		var nameTxt = document.querySelector('#googleName');
 		var name = sessionStorage.getItem('user');
 		nameTxt.innerHTML = name;
 	}
	
</script>
</head>

<body>

	<h1>글목록</h1>
	<h3><span id="googleName"></span>
		회원님 환영합니다<br/>
		<a href="logout.do" onclick="logout();">Log-Out</a>
		
		
	</h3>
	<!-- 검색시작 -->

	<!-- 검색 종료 -->
	<form action="getBoardList.do" method="post">
		<table border="1">
			<tr>
				<td><select name="searchCondition">
						<!-- 선택해서 넘어갈때 searchCondition=value값으로 넘어가짐 -->
						<c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }</option>
						</c:forEach>
				</select> <input type="text" name="searchKeyword" /> <input type="submit"
					value="검색" /></td>
			</tr>
		</table>
	</form>
	<br />
	<!-- 검색 종료 -->
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>

		<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.seq}</td>
				<td><a href="getBoard.do?seq=${board.seq}">${board.title }</a>
				</td>
				<td>${board.writer }</td>
				<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
				<td>${board.cnt }</td>

			</tr>
		</c:forEach>
	</table>
	</br>
	<a href="insertBoard.jsp">새글 작성</a>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>