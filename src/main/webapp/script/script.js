

 var checknumber=0;
  var filenameStatus = 1;  
  var filesizeStatus = 1;
  var writerStatus = 1;
  var updateStatus = 1;
  var listBt = document.getElementById('listSortBt');
  var badukBt = document.getElementById('badukSortBt');
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

    $("#listSortBt").click(function(){
      console.log('리스트버튼');
      $('#listSortBt').css('backgroundColor','#615cba');
      $('#badukSortBt').css('backgroundColor','#e4e7eb');
    });
  
    $('#badukSortBt').click(function(){
      console.log('바둑버튼');
      $('#listSortBt').css('backgroundColor','#e4e7eb');
      $('#badukSortBt').css('backgroundColor','#615cba');
      
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
    
    //히든 메뉴 다른곳 클릭했을때 닫아주는 이벤트
    $(document).mouseup(function(e){
      var container=$('.moreMenuContainer');
      
      
      if(container.has(e.target).length==0){
        container.css('display','none');
      }
    });
    
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
    
   
  });
  


function test(){
alert('클릭');
/*
var temp = document.getElementById('tempnode');
var add='<a href=javascript:alert("클릭!!")>';
add+='체크';
add+='</a>';
temp.innerHTML=add;
*/


/*var sourceNode = document.getElementById('totalProjectButton').value;
var present = document.getElementById('btnLeft');
vat addNode = '<input type="button" onclick= '
*/


/*
var present = document.getElementById('totalProjectButton').innerText;

var temp = document.getElementById('tempnode');
var newtag = document.createElement('a');
temp.appendChild(newtag);
var add='<a href="#>' +present+'</a>';



*/
}

function hiddenMenuFold(thisevent,e){
  var node = $(thisevent).parent().next();
  var presentDisplay = node.css('display');
  if(presentDisplay == 'block'){
    
    node.css('display','none');
  }
  else{
    node.css("display","block");
  }
}

  function badukListhiddenMenuFold(thisevent,e){
    
    var node = $(thisevent).parent().next();
   console.log();
    var presentDisplay = node.css('display');
    if(presentDisplay == 'block'){
      
      node.css('display','none');
    }
    else{
      node.css("display","block");
    }
  }
  
  
  //thisevent.style.display=(document.querySelector('.moreMenuContainer2').style.display=='block') ? 'none' : 'block';
