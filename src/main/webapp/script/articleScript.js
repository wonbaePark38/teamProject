







//헤더 채팅영역
function headerChatting(){
  document.getElementById('header_chat_div').style.display=(document.getElementById('header_chat_div').style.display=='block') ? 'none' : 'block';
}

  function headerChattingRoom(){
    document.getElementById('header_chat_chattingRoom').style.display = 'block';
    document.getElementById('header_chat_contactAddress').style.display = 'none';
  }

  function headerContactAddresss(){
    document.getElementById('header_chat_contactAddress').style.display = 'block';
    document.getElementById('header_chat_chattingRoom').style.display = 'none';
  }



//헤더 알람영역
function headerAlarm(){
  document.getElementById('header_alarm_div').style.display=(document.getElementById('header_alarm_div').style.display=='block') ? 'none' : 'block';
  
}

//헤더 옵션영역
function headerOption(){
  document.getElementById('header_option_div').style.display=(document.getElementById('header_option_div').style.display=='block') ? 'none' : 'block';
}



// 업무 리포트 접기
  function fold(){
    document.getElementById('chart').style.display=(document.getElementById('chart').style.display=='block') ? 'none' : 'block';
  }

  //업무 작성폼 추가항목
  function external_button(){
    document.getElementById('work_form_external_div').style.display=(document.getElementById('work_form_external_div').style.display=='block') ? 'none' : 'block';
    document.getElementById('external').style.display='none';
  }

  //업무 작성폼 진행도
  function progressBar(){
    var postValue =  document.getElementById('progress').value;
    value = postValue + 20;

    document.getElementById('progress').value = value;
  }
  
  // 글쓰기 버튼
  function writeForm(){
    document.getElementById('writeForm_div').style.display='block';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

  }

  function write20Form(){
    document.getElementById('write20Form_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

  }

  function workForm(){
    document.getElementById('workForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

  }

  function scheduleForm(){
    document.getElementById('scheduleForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

  }

  function todoForm(){
    document.getElementById('todoForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';

  }

  // work status select
  function request(){
    document.getElementById('request').style.backgroundColor = '#4aaefb';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function doing(){
    document.getElementById('doing').style.backgroundColor = '#50b766';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function feedback(){
    document.getElementById('feedback').style.backgroundColor = '#f17a19';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function complete(){
    document.getElementById('complete').style.backgroundColor = '#2e417e';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function postpone(){
    document.getElementById('postpone').style.backgroundColor = '#aeaeae';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
  }

  // 업무탭 작업자 선택영역
  function work_workerSelect(){
    document.getElementById('worker_select_div').style.display = (document.getElementById('worker_select_div').style.display == 'block')?'none':'block';
    
  }

 

  //allday
  function alldayBtn(){
    document.getElementById('start_time_select').disabled = (document.getElementById('start_time_select').disabled == true)? false : true;
    document.getElementById('end_time_select').disabled = (document.getElementById('end_time_select').disabled == true)? false : true;
  }
  

  // todo append
  var startDivNum = 0;
  var startDateNum = 0;
  var startWorkerNum = 0;
  var startWorkerInputNum = 0;
  var startWorkerNameNum = 0;

  function divIdNumCreate(id){
      
    var returnDivID = id + (startDivNum + 1);
    startDivNum = startDivNum + 1;
    return returnDivID;
  }

  function dateIdNumCreate(id){
      
      var returnDateID = id + (startDateNum + 1);
      startDateNum = startDateNum + 1;
      return returnDateID;
  }

  function workerIdNumCreate(id){

      var returnWorkerID = id + (startWorkerNum + 1);
      startWorkerNum = startWorkerNum + 1;
      return returnWorkerID;
  }

  function workerInputIdNumCreate(id){

    var returnWorkerInputID = id + '_' + (startWorkerInputNum + 1);
    startWorkerInputNum = startWorkerInputNum + 1;
    return returnWorkerInputID;
  }

  function workerNameIdNumCreate(id){

    var returnWorkerNametID = id + '_' + (startWorkerNameNum + 1);
    startWorkerNameNum = startWorkerNameNum + 1;
    return returnWorkerNametID;
  }


  var todo_div = "";
  var workerPickId = "";
  var workerInputId = "";
  var workerSelectEvent = "";
  var workerName_a = "";

  function todoAppend(){

      // id 만들기
      todo_div = divIdNumCreate('todo_div');
      workerPickId = workerIdNumCreate('todo_worker_pick_div');
      workerInputId = workerInputIdNumCreate('workerInputId');
      workerSelectEvent = 'input_' + workerInputId;

      var todoAppendContent = document.createElement('div');
      todoAppendContent.setAttribute('id',todo_div);
      todoAppendContent.innerHTML 
        = "<hr>";

      var cancleBtn = document.createElement('button');
      cancleBtn.setAttribute('onclick','delete_todo("'+ todo_div +'")');
      cancleBtn.setAttribute('style','border-radius: 35%; background-color: red; border-style: none;');
      cancleBtn.innerHTML = '-';

      todoAppendContent.appendChild(cancleBtn);

      //할일 입력창 만들기
      var inputTag = document.createElement('input');
      inputTag.setAttribute('type','text');
      inputTag.setAttribute('placeholder','할일 입력');
      inputTag.setAttribute('style','border-style: none; width: 70%; margin-left: 3px; margin-right: 5.5px;');
      
      todoAppendContent.append(inputTag);
      
      
      // 날짜 선택 영역 만들기
      var datePickId = dateIdNumCreate('todo_date_pick_div');

      var todoDatePickDiv = document.createElement('div');
      todoDatePickDiv.setAttribute('id',datePickId);
      todoDatePickDiv.setAttribute('style','width: 11%; display: inline-block;');

      var todoDatePickInput = document.createElement('input');
      todoDatePickInput.setAttribute('type','text');
      todoDatePickInput.setAttribute('class','todo_date_input_external');
      todoDatePickInput.setAttribute('placeholder','일자');
      todoDatePickInput.setAttribute('readOnly','true');
      todoDatePickInput.setAttribute('style','width: 91%; margin-left: 0px;');

      todoDatePickDiv.append(todoDatePickInput);
      todoAppendContent.append(todoDatePickDiv);



      // 작업자 선택 영역 만들기

      var todoWorkerPicDiv = document.createElement('div');
      todoWorkerPicDiv.setAttribute('id',workerPickId);
      todoWorkerPicDiv.setAttribute('style','width: 11%; display: inline-block; position: relative;');

        
        var todoWorkerPickInput = document.createElement('input');
        todoWorkerPickInput.setAttribute('type','text');
        todoWorkerPickInput.setAttribute('id',workerInputId);
        todoWorkerPickInput.setAttribute('class','todo_worker_input_external');
        todoWorkerPickInput.setAttribute('placeholder','인원');
        todoWorkerPickInput.setAttribute('readOnly','true');
        todoWorkerPickInput.setAttribute('style','width: 91%; margin-left: 0px;');
        todoWorkerPickInput.setAttribute('onclick','worker_pick("'+ workerSelectEvent +'")');
        todoWorkerPicDiv.append(todoWorkerPickInput);

        var todoWorkerSelectDiv = document.createElement('div');
        todoWorkerSelectDiv.setAttribute('id',workerSelectEvent);
        todoWorkerSelectDiv.setAttribute('class','todo_worker_select_div');
        todoWorkerSelectDiv.setAttribute('style','display: none; z-index: 99; width: 150px; max-height: 140px; background-color: white; position: absolute; overflow-y: scroll; border-radius: 5px; border: 2px solid black;');
        
        var todoWorkerUl = document.createElement('ul');
        todoWorkerUl.setAttribute('style','list-style: none; padding-left: 10px; position: absolute;');

        for(var i = 0; i < 5; i++){

          workerName_a = workerNameIdNumCreate('workerNmae');

          var todoWorkerLi = document.createElement('li');
            var todoWorkerLi_a = document.createElement('a');
            todoWorkerLi_a.setAttribute('id',workerName_a);
            todoWorkerLi_a.setAttribute('onclick','selectWorker("'+ workerName_a +'","'+ workerInputId +'","'+ workerSelectEvent +'")');
            todoWorkerLi.append(todoWorkerLi_a);
            todoWorkerLi_a.innerHTML= i;
            
          todoWorkerUl.append(todoWorkerLi);
        }

        todoWorkerSelectDiv.append(todoWorkerUl);
        

        todoWorkerPicDiv.append(todoWorkerSelectDiv);
      
      todoAppendContent.appendChild(todoWorkerPicDiv);


      document.getElementById('todoContent_external').appendChild(todoAppendContent);

    }

    //리스트에서 작업자 선택
    function selectWorker(name,id,div){
      var test31 =  document.getElementById(name).innerText;
      document.getElementById(id).value = test31;
      document.getElementById(div).style.display = 'none';
    }

    // 할일 삭제
    function delete_todo(id){
      document.getElementById(id).remove();
    }

    // 작업자 선택 영역 펼치기
    function worker_pick(id){
      
     document.getElementById(id).style.display = (document.getElementById(id).style.display == 'block')? 'none':'block';
      
    }

    
    //todo worker select
    function todoWorkerSelect(){
      document.getElementById('todo_worker').style.display = (document.getElementById('todo_worker').style.display == 'block')?'none':'block';
      
    }
    
    


    // 툴바 장소 찍기
    function locationPick(){
      document.getElementById('search_location_div').style.display = (document.getElementById('search_location_div').style.display == 'block')?'none':'block';
    }


    


























  