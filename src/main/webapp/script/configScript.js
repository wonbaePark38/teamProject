
$(document).ready(function () {
  

    var check = $("input[id='alram1']");
    var check2 = $("input[id='alram2']");
    var lock = $("input[id='lock']");
    check.click(function(){
       
        $("p").toggle();
        var status =$('#alram1');
        if($('input:checkbox[id="alram1"]').is(":checked")){
            console.log('체크됨');
            $('.checkbox-style').attr('disabled',false);
        }else{
            console.log('체크해제');
            $('.checkbox-style').attr('disabled',true);
        }
    });

    check2.click(function(){
        
    
        $("p").toggle();
        var status =$('#alram2');
        if($('input:checkbox[id="alram2"]').is(":checked")){
            console.log('체크됨');
            $('.start-combobox').attr('disabled',false);
            $('.end-combobox').attr('disabled',false);
        }else{
            $('.start-combobox').attr('disabled',true);
            $('.end-combobox').attr('disabled',true);
            console.log('체크해제');
            
        }
    });

    lock.click(function(){
        
    
        $("p").toggle();
        var status =$('#lock');
        if($('input:checkbox[id="lock"]').is(":checked")){
            console.log('체크됨');
           $('.lock-select').attr('disabled',false);
        }else{
            $('.lock-select').attr('disabled',true);
            console.log('체크해제');
            
        }
    });



    $('#account-info').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'accountInfo.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/accountInfo.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
              $('#ajaxpagecontainer').children().remove();  
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });
    });

    $("#password-setting").click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'settingPassword.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/settingPassword.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
            $('#ajaxpagecontainer').children().remove();
            $('#ajaxpagecontainer').html(data);
            console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });
    });

    $('#push-alram-setting').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'pushAlramSetting.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/accountInfo.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                $('#ajaxpagecontainer').children().remove();  
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });
    });

    $('#lock-mode-setting').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'lockModeConfig.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/lockModeConfig.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                $('#ajaxpagecontainer').children().remove(); 
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });
    });

    $('#favorites-setting').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'favoritesSetting.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/favoritesSetting.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                $('#ajaxpagecontainer').children().remove();  
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });

        
    });

   


    $('#language-setting').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'languageSetting.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/languageSetting.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                $('#ajaxpagecontainer').children().remove();  
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });
    
         
    });

    $('#connect-device-setting').click(function () {
        console.log('접속페이지');
       
        $.ajax({
           
            url :'connectManage.jsp',
            type :'POST',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/languageSetting.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                $('#ajaxpagecontainer').children().remove();  
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                console.log(err1);
                console.log(err2, "2");
                console.log(err3, "3");
                alert('통신실패');
            }
         
        });
    
         
    });

   

});


function reset(){
	
    var modal = document.getElementById('modal');
    modal.style.display = "block";
}
function settinCancel(){
 
    var modal = document.getElementById('modal');
    var confirmCancel = document.getElementById("confirm-cancel");                                          
    modal.style.display="none";
}

function settingConfirm(){
 
    var modal = document.getElementById('modal');
    var confirm = document.getElementById("confirm");
    var confirmCancel = document.getElementById("confirm-cancel");                                          
    modal.style.display="none";
}

function removeDevice(){
    alert('제거버튼 클릭');
}