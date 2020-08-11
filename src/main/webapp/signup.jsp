<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link rel="stylesheet" href="css/signup_css.css"/>
<script src="script/jquery-3.5.1-min.js"></script>
<script>
function validate() {
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var email = document.getElementById("email");
    var pw = document.getElementById("password");
    var name = document.getElementById("name");
    var checkpw = document.getElementById("passwordCheck");
    var agree = document.getElementById("agreeTerms");
    
    // ------------ 이메일 까지 -----------
    if(email.value=="") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }
    

    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(name.value=="") {
        alert("이름을 입력해 주세요");
        name.focus();
        return false;
    }
    
    if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(pw.value != checkpw.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        pw.value = "";
        checkpw.value = "";
        pw.focus();
        return false;
    }

    if(agree.checked == false) {
        alert("약관에 동의해 주세요.");
        return false;
    }
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

function sameEmail(){
	  alert('이미 사용중인 이메일 입니다.\n다른 이메일을 사용해 주세요.');
}
</script>
</head>
<body>
	<c:if test="${status eq 'sameEmail'}">
		<script type="text/javascript">
		sameEmail();
		</script>
		
	</c:if>

	<div class="sign-up-wrap">
		<form action="signupPost.do" name="join" method="post" onsubmit="return validate();">
			<input type="hidden" name="socialCompare" value="N" >
			<div>
				<div>
					<label class="signup-label">이메일</label>
					<div class="inputbox">
						<input type="text" id="email" name="email" placeholder="exam@email.com" value="${ UserVO.email }">
					</div>
				</div>
				<div>
					<label class="signup-label">이름</label>
					<div class="inputbox">
						<input type="text" id="name" name="name" placeholder="이름" value="${ UserVO.name }" >
					</div>
				</div>
				<div>
					<label class="signup-label">비밀번호</label>
					<div class="inputbox">
						<input type="password" id="password" name="password" placeholder="비밀번호 입력" value="${ UserVO.password }">
					</div>
				</div>
				<div>
					<label class="signup-label">비밀번호 확인</label>
					<div class="inputbox">
						<input type="password" id="passwordCheck" placeholder="비밀번호 재입력">
					</div>
				</div>
				
				<div class="signup-terms">
					<input type="checkbox" id="agreeTerms" >
					<span>서비스 이용약관,  개인정보취급방침 을 확인하였고, 이에 동의합니다.</span>
				</div>
			
				<div>
					<button class="btn-signup-next" type="submit">다음</button>
				</div>
			</div>
		</form>
	</div>

</body>

</html>