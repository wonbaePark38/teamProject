// 업무 리포트 접기
  function fold(){
    document.getElementById('chart').style.display=(document.getElementById('chart').style.display=='block') ? 'none' : 'block';
  }

  //업무 작성폼 추가항목
  function external_button(){
    document.getElementById('externalFold').style.display=(document.getElementById('externalFold').style.display=='block') ? 'none' : 'block';
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

    document.getElementById('add_location').style.display='none';
    document.getElementById('add_file').style.display='inline-block';
    document.getElementById('add_pic').style.display='inline-block';
  }

  function write20Form(){
    document.getElementById('write20Form_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

    document.getElementById('add_location').style.display='inline-block';
    document.getElementById('add_file').style.display='inline-block';
    document.getElementById('add_pic').style.display='inline-block';
  }

  function workForm(){
    document.getElementById('workForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

    document.getElementById('add_location').style.display='none';
    document.getElementById('add_file').style.display='inline-block';
    document.getElementById('add_pic').style.display='inline-block';
  }

  function scheduleForm(){
    document.getElementById('scheduleForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';

    document.getElementById('add_location').style.display='none';
    document.getElementById('add_file').style.display='none';
    document.getElementById('add_pic').style.display='none';
  }

  function todoForm(){
    document.getElementById('todoForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';

    document.getElementById('add_location').style.display='none';
    document.getElementById('add_file').style.display='none';
    document.getElementById('add_pic').style.display='none';

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
    document.getElementById('doing').style.backgroundColor = '#4aaefb';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function feedback(){
    document.getElementById('feedback').style.backgroundColor = '#4aaefb';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function complete(){
    document.getElementById('complete').style.backgroundColor = '#4aaefb';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
  }

  function postpone(){
    document.getElementById('postpone').style.backgroundColor = '#4aaefb';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
  }

  
  



  //date picker
  $( document ).ready(function() {
    $("#start_date").datepicker();
  });

  $( document ).ready(function() {
    $("#end_date").datepicker();
  });

  $( document ).ready(function() {
    $("#sche_start_date").datepicker();
  });

  $( document ).ready(function() {
    $("#sche_end_date").datepicker();
  });

  $( document ).ready(function() {
    $("#todo_date_input").datepicker({dateFormat : 'mm/dd'});
  });

  $('#todoAppend').click(function(){
    $(".todo_date_input_external").datepicker({dateFormat : 'mm/dd'});
  });

  //allday
  function alldayBtn(){
    document.getElementById('start_time_select').disabled = (document.getElementById('start_time_select').disabled == true)? false : true;
    document.getElementById('end_time_select').disabled = (document.getElementById('end_time_select').disabled == true)? false : true;
  }
  

  //todo append
  var startDateNum = 0;
  var startWorkerNum = 0;

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

  function todoAppend(){
      var todoAppendContent = document.createElement('div');
      
      todoAppendContent.innerHTML 
        = "<hr>";

      var cancleBtn = document.createElement('button');
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
      todoDatePickInput.setAttribute('style','width: 91%; margin-left: 0px;');

      todoDatePickDiv.append(todoDatePickInput);
      todoAppendContent.append(todoDatePickDiv);



      // 작업자 선택 영역 만들기
      var workerPickId = workerIdNumCreate('todo_worker_pick_div');

      var todoWorkerPicDiv = document.createElement('div');
      todoWorkerPicDiv.setAttribute('id',workerPickId);
      todoWorkerPicDiv.setAttribute('style','width: 11%; display: inline-block;');

      var todoWorkerPickInput = document.createElement('input');
      todoWorkerPickInput.setAttribute('type','text');
      todoWorkerPickInput.setAttribute('class','todo_worker_input_external');
      todoWorkerPickInput.setAttribute('placeholder','인원');
      todoWorkerPickInput.setAttribute('style','width: 91%; margin-left: 0px;');

      todoWorkerPicDiv.append(todoWorkerPickInput);

      

      
      todoAppendContent.appendChild(todoWorkerPicDiv);


      document.getElementById('todoContent_external').appendChild(todoAppendContent);

    }

    
    //todo worker select
    function todoWorkerSelect(){
      document.getElementById('todo_worker').style.display = (document.getElementById('todo_worker').style.display == 'block')?'none':'block';
      
    }
    
    


    // 툴바 장소 찍기
    function locationPick(){
      document.getElementById('search_location_div').style.display = (document.getElementById('search_location_div').style.display == 'block')?'none':'block';
    }



    function workerSelect(){
      document.getElementById('worker_select_div').style.display = (document.getElementById('worker_select_div').style.display == 'block')?'none':'block';
    }



























  