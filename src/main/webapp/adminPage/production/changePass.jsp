<%@page import="com.spring.plug.adminsignup.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<script>
function checkPass() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	
    var pass1 = document.getElementsByName("password")[0];
    var pass2 = document.getElementsByName("newpassword")[0];
    var pass3 = document.getElementsByName("checknewpassword")[0];
    
    // ------------ 이메일 까지 -----------
    if(!check(re,pass1,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }
    
    if(pass1.value=="") {
        alert("기존 비밀번호를 입력해 주세요");
        pass1.focus();
        return false;
    }
    if(!check(re,pass2,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(pass2.value=="") {
        alert("새로운 비밀번호를 입력해 주세요");
        pass2.focus();
        return false;
    }
    if(!check(re,pass3,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }
    if(pass3.value=="") {
        alert("새로운 비밀번호를 입력해 주세요");
        pass3.focus();
        return false;
    }
    

    if(pass2.value != pass3.value) {
        alert("변경 할 비밀번호가 일치하지 않습니다.\n다시 확인해 주세요.");
        pass2.value = "";
       	pass3.value = "";
        pass2.focus();
        return false;
    }
    
    document.changePw.submit();

}

function check(re, me, message) {
    if(re.test(me.value)) {
        return true;
    }
    alert(message);
    me.value = "";
    me.focus();
    //return false;
}
</script>
<body>
<c:if test="${result eq 'true'}">
		<script type="text/javascript">
			alert('비밀번호가 정상적으로 변경되었습니다.');
			self.close();
		</script>
	</c:if>
	<c:if test="${result eq 'false'}">
		<script type="text/javascript">
			alert('기존 비밀번호가 일치하지 않습니다.\n다시 확인해 주세요.');
		</script>
	</c:if>
<h1>비밀번호 변경</h1><br>
<form action="changePassword.do" name="changePw" method="post">
현재 비밀번호 : <input type="password" name="password" /><br>
변경 비밀번호 : <input type="password" name="newpassword" /><br>
변경 비밀번호 확인 : <input type="password" name="checknewpassword" />
</form>
<br><br>
<a href="#" onclick="javascript:checkPass()">변경</a>
<a href="#" onclick="javascript:self.close()">닫기</a>
</body>
</html>