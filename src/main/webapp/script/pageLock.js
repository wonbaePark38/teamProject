/**
 * 화면 잠금 자바 스크립트 파일
 */

$(document).ready(function(){
	
	var setTime = $('#session').val();

	$.ajax({
		url:'getSettings.do',
		method:'POST',
	}).done(function(vo){
		if(vo.lockSwitchStatus == 'on'){
			setTime = vo.lockTime;
			initLock(setTime);
		}
	}).fail(function(err){
		alert('통신에러');
	});
	
	
	
	/*잠금 화면에서 패스워드 입력했을때 발생하는 이벤트*/
	$('#lock-password-bt').click(function(){
		var password = $('#input-password').val();
		
		$.ajax({
			url:'lockPassword.do',
			method:'POST',
			data : {
				password:password
			},
		}).done(function(data){
			
			if(data === 'true'){
				$('#lock-modal').css('display','none');
				sessionStorage.removeItem("lock");
				resetLock(setTime);
			}else{
				setLock();
				alert('비밀번호가 틀렸습니다.');
			}
		}).fail(function(err){
			alert('통신오류');
		});

	});
	
	
	$('#logoutBt').click(function(){
		sessionStorage.removeItem("lock");
		location.href='logout.do';
	})
	$("body").keydown(function (event) {
	     resetLock(setTime);
	});
	
	$("body").click(function (){
		resetLock(setTime);
	});

	
});

//초기설정	
initLock = function(setTime) {
	console.log('모달창 초기화 함수')
    timerHandle = window.setTimeout(function () {
      setLock();
    }, setTime * 1000 * 60); // db에 설정한 시간 후에 lock 걸림

    // Ctrl + Alt + L 키를 누려면 강제 잠금 모드로 전환한다.
	
    $("body").keydown(function (event) { //ctrl+alt+l 누르면 화면  강제로 잠금
        if (event.ctrlKey && event.altKey && event.keyCode == 76) {
        	setLock();
        }
    });
}

//모달창 띄우기
setLock = function () {
	var modal = document.getElementById('lock-modal');
    $('#input-password').val("");
	modal.style.display = "block";
    document.onkeydown = doNotReload;
    sessionStorage.setItem("lock",true);
}
   
// 새로고침 막기
function doNotReload(){
	if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
			|| (event.keyCode == 116) )
	{
		event.keyCode = 0;
		event.cancelBubble = true;
		event.returnValue = false;
		
	}
	
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
	    history.go(1);
	};
}

// timeout 시간을 재설정
resetLock = function (setTime) {

   
    if (timerHandle != undefined) {
        window.clearTimeout(timerHandle);
    }

    timerHandle = window.setTimeout(function () {
        setLock();
    }, setTime * 1000 * 60);
  

}


