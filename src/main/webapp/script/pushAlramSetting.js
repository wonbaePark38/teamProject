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



});