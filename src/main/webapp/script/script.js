

 var checknumber=0;
  var filenameStatus = 1;  
  var filesizeStatus = 1;
  var writerStatus = 1;
  var updateStatus = 1;
  var node2='';
  var node2style;
  //movebt=document.getElementById('moveBt');
  //movebt.disabled = 'disabled';
  var listViewStats = 0;
  
  $(document).ready(function(){
    $(".downimg").show();
    $(".upimg").hide();
    
    
    $('.projectNameBt').click(function(){
      var buttonValue = this.value;
      $('#changePathArea').text(buttonValue);
     
     
    });
    $('.checkbox-all').click(function(){
      $('.col1-checkbox').prop('checked',this.checked);
    });

    $('.checkbox-all-baduk').click(function(){
     
      $('.checkbox-baduk').prop('checked',this.checked);
    });

    $("#listSortBt").click(function(){
      console.log('리스트버튼');
      $('#listSortBt').css('backgroundColor','#615cba');
      $('#badukSortBt').css('backgroundColor','#e4e7eb');
      $('.baduk-main-article-container').css('display','none');
      $('.list-main-article-container').css('display','block');
      
    });
  
    $('#badukSortBt').click(function(){
      console.log('바둑버튼');
      $('#listSortBt').css('backgroundColor','#e4e7eb');
      $('#badukSortBt').css('backgroundColor','#615cba');
      
      $('.list-main-article-container').css('display','none');
      $('.baduk-main-article-container').css('display','block');
      
    });
    $("#namesortbt").click(function(){
      
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
      
    });
   
    //히든 메뉴 클릭했을때 열고닫아주는 이벤트
   

    $('.moreBt').click(function(){
      
      var node = $(this).parent().next();
      
      style = node.css('display');
      if( node.css('display') == 'none'){
        style = 'block';
        node.css('display','block');
      }else{
        style='none';
        node.css('display','none');
      }

    });

    /*$(document).click(function(e){
      var style= node2.css('display');
      if(style == 'block'){
        console.log('뭐지');
        style='none';
        node2.css('display','none');
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
    	var value=$('#USER_PW').val();
    	var str = value.length+1;
    	
    	if(str>0){
    		$('.signup_btn_st1').css('background-color','#5a53d0');
    		$('.signup_btn_st1').attr('disabled',false);
      }
    });
    	
    
 });
  
  function loginErrchk(){
	  if (document.getElementById("USER_ID").value == "") {
		  alert("내용을 입력해주세요");
		  return false;
	  }else
		  document.loginBt.submit();
  }
  
function test(){
alert('클릭');

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
  
  function loginError(){
	 alert('아이디나 비밀번호가 틀렸습니다'); 
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
	    	console.log("Email: " + profile.getEmail());
	    	console.log('Full Name: ' + profile.getName());
	    	document.getElementById('googleId').value = profile.getEmail();
	    	
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
					  
					 var id=res.id;
					 console.log(res);
					 document.getElementById('kakaoId').value = id;
					 //document.kakaoSubmit.submit();				
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

  //thisevent.style.display=(document.querySelector('.moreMenuContainer2').style.display=='block') ? 'none' : 'block';
