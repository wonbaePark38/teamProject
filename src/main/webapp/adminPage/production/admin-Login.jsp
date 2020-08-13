<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <script type="text/javascript"
	src="https://flow.team/js/lib/jquery-1.10.2.min.js?202007200140"></script>
<script>
function signupok(){
	  alert('회원가입이 완료되었습니다.\n로그인 후 사용가능합니다.');
}

function sameEmail(){
	  alert('아이디 또는 이메일이 이미 사용 중 입니다.\n다른 아이디 또는 이메일을 사용해 주세요.');
	  location.href="#signup";
}

function signupsubmit() {
	document.signup.submit();
}
function loginsubmit() {
	document.login.submit();
}

function idInputCheck() {
	if(document.getElementsByName("username")[0].value == "") {
		alert('아이디를 입력해 주세요.');
		document.getElementsByName("username")[0].focus();
		return false;
	}
	
	location.href = "findPassword.do?username=" + document.getElementsByName("username")[0].value;
	
}


</script>  
  </head>


  <body class="login">
  	<c:if test="${findPassword eq 'true'}">
		<script type="text/javascript">
			alert('임시 비밀번호가 가입하신 이메일로 전송되었습니다.\n이메일을 확인해 주세요.');
		</script>
	</c:if>
	<c:if test="${findPassword eq 'false'}">
		<script type="text/javascript">
			alert('비밀번호 초기화에 실패하였습니다.\n다시 시도해 주세요.');
		</script>
	</c:if>
  	<c:if test="${checkLogin eq 'false'}">
		<script type="text/javascript">
			alert('비밀번호가 일치하지 않습니다.');
		</script>
	</c:if>
	<c:if test="${checkId eq 'false'}">
		<script type="text/javascript">
			alert('아이디가 존재하지 않습니다.\n회원가입 후 이용해 주세요.');
			location.href = "#signup";
		</script>
	</c:if>
  	<c:if test="${status eq 'signupok'}">
		<script type="text/javascript">
		signupok();
		</script>
	</c:if>
	<c:if test="${status eq 'sameEmail'}">
		<script type="text/javascript">
		sameEmail();
		</script>
	</c:if>
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="adminLogin.do" name="login" method="post">
              <h1>Login Form</h1>
              <div>
                <input type="text" name="username" class="form-control" placeholder="Username" />
              </div>
              <div>
                <input type="password" name="password" class="form-control" placeholder="Password" />
              </div>
              <div>
                <a class="btn btn-default submit"  onclick="javascript:loginsubmit()">Log in</a>
                <a class="reset_pass" onclick="javascript:idInputCheck()">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form action="adminSignup.do" name="signup" method="post">
              <h1>Create Account</h1>
              <div>
                <input type="text"  name="username" class="form-control" placeholder="Username" />
              </div>
              <div>
                <input type="email"  name="email" class="form-control" placeholder="Email" />
              </div>
              <div>
                <input type="password"  name="password" class="form-control" placeholder="Password" />
              </div>
              <div>
                <a class="btn btn-default submit" onclick="javascript:signupsubmit()">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a class="to_register" href="#signin"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
