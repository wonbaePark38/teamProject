$(document).ready(function(){
	
    $('#payment-info').click(function () {
        console.log('접속');
       
        $.ajax({
           
            url :'paymentInfo.jsp',
            type :'GET',
            cache:false,
            dataType:"html",
            beforeSend:function(){
                $('<link rel="stylesheet" type="text/css" href="'+'css/paymentInfo.css'+'" >')
                .appendTo("head");
            },
            success:function(data){
               
              $('#ajaxpagecontainer').html(data);
              console.log(data);
            },
            error:function(err1, err2, err3){
                
                alert('통신실패');
            }
         
        });

        
    });

   
});