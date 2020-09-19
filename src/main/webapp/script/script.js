


$(document).ready(function(){

	var checknumber=0;

	var node2='';
	var node2style;
	 var ctrlDown = false,
     ctrlKey = 17,
     vKey = 86;
    
	
	//체크박스 체크 했을때 발생하는 이벤트
	$('.col1-checkbox').on('change',function(){
		var checkedNumberNode = document.querySelector('.check-message-container');
		var checkSpan = checkedNumberNode.children;


		if(this.checked){
			checknumber++;
			console.log('체크 갯수' + checknumber);
		}else{
			checknumber--;
			console.log('체크 갯수' + checknumber);
		}
		checkedNumber.innerHTML=checknumber + '건 선택됨';


	});

	$("#USER_PW").keydown(function(e){

		var passwordLength=$('#USER_PW').val();
		var str = passwordLength.length+1;

		if((e.keyCode == ctrlKey && e.keyCode == vKey) || str>0){
			ctrlDown = true;
			$('.signup_btn_st1').css('background-color','#5a53d0');
			$('.signup_btn_st1').attr('disabled',false);
		}
	}).keyup(function(e){
    	if(e.keyCode == ctrlKey){
    		ctrlDown = false;
    	}
	});

	/*$(document).keydown(function(e) {
		var passwordLength=$('#USER_PW').val();
		var str = passwordLength.length;
		
        if (e.keyCode == ctrlKey && str>0){
        	ctrlDown = true;
        	$('.signup_btn_st1').css('background-color','#5a53d0');
			$('.signup_btn_st1').attr('disabled',false);
        }
    }).keyup(function(e){
    	if(e.keyCode == ctrlKey){
    		ctrlDown = false;
    	}
    });*/


});




function errorEmail(){

	alert('없는 이메일 입니다.');
	document.getElementById('USER_ID').value ="";
	document.getElementById('USER_PW').value ="";
}

function errorPassword(){
	alert('비밀번호가 틀렸습니다.');
	document.getElementById('USER_PW').value ="";
}

function errorNotCheckEmail(){
	alert('이메일 인증을 하지 않았습니다');
	document.getElementById('USER_ID').value ="";
	document.getElementById('USER_PW').value ="";
}



var googleUser = {};
var startGoogleLogin = function() {
	gapi.load('auth2', function(){

		auth2 = gapi.auth2.init({
			client_id: '198753219443-qhctu45a6g5mv2o4rp7f0evfr9gfni0t.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',

		});
		attachSignin(document.getElementById('googleBt'));
	});
};



function attachSignin(element) {

	auth2.attachClickHandler(element, {},
			function(googleUser) {
		var profile = googleUser.getBasicProfile();

		document.getElementById('googleInfo').value = profile.getEmail();
		document.getElementById('googleName').value = profile.getName();
		document.getElementById('socialGoogle').value = 'Google';
		document.googleSubmit.submit();

	}, function(error) {});    
}

function signOut(socialCompare) { 
	
	if(socialCompare == 'Google'){ //구글 로그아웃
		
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {   
			console.log('User signed out.');   
			auth2.disconnect();   
		}); 
		auth2.disconnect();
	} else{
		Kakao.init('7b60be3909569dd7f234238a2bae4b61');
		Kakao.Auth.logout(
				function(obj) {
					if(obj==true){}else{}
					console.log('카카오 로그아웃');
				}
		);
	}
	
	location.href='logout.do';

}

/*카카오 로그인 코드*/
var startKakaoLogin = function(){
	Kakao.init('7b60be3909569dd7f234238a2bae4b61');
	Kakao.Auth.loginForm({
		success: function(authObj){

			Kakao.API.request({
				url :'/v2/user/me',
				success: function(res){

					var email = res.kakao_account.email;
					var name = res.properties.nickname;
					document.getElementById('kakaoInfo').value = email;
					document.getElementById('kakaoName').value = name;
					document.getElementById('socialKakao').value = 'Kakao';
					document.kakaoSubmit.submit();
				}
			})
			console.log(authObj);
			var token = authObj.access_token;
		},
		fail: function(err){
			alert(JSON.stringify(err));
		}
	});
} 

function clientCenterFold(){

	document.getElementById('helpMenu_on').style.display=(document.getElementById('helpMenu_on').style.display=='block') ? 'none' : 'block';

}
function fold(){

	document.getElementById('chart').style.display=(document.getElementById('chart').style.display=='block') ? 'none' : 'block';
}
function searchPress(){
	console.log('클릭');
}



