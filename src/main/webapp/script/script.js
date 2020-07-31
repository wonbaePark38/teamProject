
function test(){
  alert('클릭');
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
    
