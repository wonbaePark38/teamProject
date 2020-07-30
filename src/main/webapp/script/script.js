

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
    
      listBt.style.backgroundColor = "#00aaf8";
      badukBt.style.backgroundColor = "#c2bdcc";
    });
  
    $('#badukSortBt').click(function(){
      listBt.style.backgroundColor = "#c2bdcc";
      badukBt.style.backgroundColor = "#00aaf8";
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
  
  
  
  //thisevent.style.display=(document.querySelector('.moreMenuContainer2').style.display=='block') ? 'none' : 'block';
  
  
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

function foldfiletype(){
  document.getElementById('filetypeSelectContainer').style.display=(document.getElementById('filetypeSelectContainer').style.display=='block') ? 'none' : 'block';
 }
 
 google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawChart);
 
       function drawChart() {
 
         var data = google.visualization.arrayToDataTable([
           ['Task', 'Hours per Day'],
           ['요청', 5],
           ['진행', 1],
           ['피드백', 3],
           ['완료', 9],
           ['보류', 1]
         ]);
 
         var options = {
           title: '업무 리포트'
         };
 
         var chart = new google.visualization.PieChart(document.getElementById('piechart'));
 
         chart.draw(data, options);
 }