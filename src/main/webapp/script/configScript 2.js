
$(document).ready(function () {
  


    $('#account-info').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'accountInfo.html',
            type :'GET',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/accountInfo.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                
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
           
            url :'settingPassword.html',
            type :'GET',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/settingPassword.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                
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
           
            url :'pushAlramSetting.html',
            type :'GET',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/accountInfo.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
                
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
