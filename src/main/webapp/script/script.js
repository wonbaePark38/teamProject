

 
  $(document).ready(function(){
    
	  var checknumber=0;
	  /*var filenameStatus = 1;  
	  var filesizeStatus = 1;
	  var writerStatus = 1;
	  var updateStatus = 1;
	 */
	 
	 
	  
	  var node2='';
	  var node2style;
    //$(".downimg").show();
    //$(".upimg").hide();
    
    
    
    /*$('.checkbox-all').click(function(){
      $('.col1-checkbox').prop('checked',this.checked);
    });

    $('.checkbox-all-baduk').click(function(){
     
      $('.checkbox-baduk').prop('checked',this.checked);
    });

    
    
    $("#namesortbt").click(function(){
        console.log('클릭~~');
        if(filenameStatus==1){
          
          $("#namesortbt .downimg").hide();
          $("#namesortbt .upimg").show();
          filenameStatus=0;
        }else if(filenameStatus==0){
          
          $("#namesortbt .downimg").show();
          $("#namesortbt .upimg").hide();
          filenameStatus=1;
        }
        
      });
    $("#sizesortbt").click(function(){
      
      if(filesizeStatus==1){
        
        $("#sizesortbt .downimg").hide();
        $("#sizesortbt .upimg").show();
        filesizeStatus=0;
      }else if(filesizeStatus==0){
        
        $("#sizesortbt .downimg").show();
        $("#sizesortbt .upimg").hide();
        filesizeStatus=1;
      }
      
    });
    $("#personsortbt").click(function(){
      
      if(writerStatus==1){
        $("#personsortbt .downimg").hide();
        $("#personsortbt .upimg").show();
        writerStatus=0;
      }else if(writerStatus==0){
        $("#personsortbt .downimg").show();
        $("#personsortbt .upimg").hide();
        writerStatus=1;
      }
      
    });
  
    $("#updatesortbt").click(function(){
      console.log('화살표버튼 클릭');
      if(updateStatus==1){
        $("#updatesortbt .downimg").hide();
        $("#updatesortbt .upimg").show();
        updateStatus=0;
      }else if(updateStatus==0){
        $("#updatesortbt .downimg").show();
        $("#updatesortbt .upimg").hide();
        updateStatus=1;
      }
      
    });

    $("#updatesortbt-baduk").click(function(){
      console.log('화살표버튼 클릭');
      if(updateStatus==1){
        $("#updatesortbt-baduk .downimg").hide();
        $("#updatesortbt-baduk .upimg").show();
        updateStatus=0;
      }else if(updateStatus==0){
        $("#updatesortbt-baduk .downimg").show();
        $("#updatesortbt-baduk .upimg").hide();
        updateStatus=1;
      }
      
    });

    $("#namesortbt-baduk").click(function(){
      console.log('화살표버튼 클릭');
      if(updateStatus==1){
        $("#namesortbt-baduk .downimg").hide();
        $("#namesortbt-baduk .upimg").show();
        updateStatus=0;
      }else if(updateStatus==0){
        $("#namesortbt-baduk .downimg").show();
        $("#namesortbt-baduk .upimg").hide();
        updateStatus=1;
      }
      
    });*/
   
    
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
    
    $("#USER_PW").keypress(function(event){
    	
    	var passwordLength=$('#USER_PW').val();
    	var str = passwordLength.length+1;
    	
    	if(str>0){
    		$('.signup_btn_st1').css('background-color','#5a53d0');
    		$('.signup_btn_st1').attr('disabled',false);
      }
    });
    	
   
    
    
 });
  
  function loginErrchk(){
	  var idForm = document.getElementById("USER_ID").value;
	  var passwordForm = document.getElementById("USER_PW").value;
	  if (!idForm || !passwordForm) {
		  alert("아이디와 비밀번호 모두 입력하세요");
	  }else{
		  document.loginBt.submit();
	  }
	  
  }


function hiddenMenuFold(thisevent){
  
  var node = $(thisevent).parent().next();
  
  console.log('스크립트' + node2style);
  var presentDisplay = node.css('display');
 
  if(node2style == 'block'){
    node2.css('display','none');
    node2style = node.css('display');
  }
  else{
    node2.css("display","block");
    node2style = node.css('display');
  }
}

  function badukListhiddenMenuFold(thisevent){
    
    var node = $(thisevent).parent().next();
     
    var presentDisplay = node.css('display');
    if(presentDisplay == 'block'){
      node.css('display','none');
    }
    else{
      node.css("display","block");
      
    }
  }
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

  /*구글 로그인 로그아웃 코드*/
  function signOut(){
	  var auth2 = gapi.auth2.getAuthInstance();
	  auth2.signOut().then(function(){
		  console.log('구글 로그아웃');
	  });
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
	    	document.getElementById('socialGoogle').value = 'y';
	    	document.googleSubmit.submit();
	    	
        }, function(error) {});    
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
					 document.getElementById('socialKakao').value = 'y';
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




