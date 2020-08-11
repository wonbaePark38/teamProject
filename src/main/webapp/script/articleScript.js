//
//function writeForm_submit5() {
//		var form5 = document.getElementById('writeForm5_form');
//		
//		
//		
//		var writeform5_JSON =  JSON.stringify(todo_arr);
//		
//		console.log(writeform5_JSON);
//		//form5.submit();
//	}

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

    if(value > 100){
    	value = 0;
    }
    document.getElementById('work_progress').value = value;
    document.getElementById('progress').value = value;
  }
  
  // 글쓰기 버튼
  function writeForm(){
    document.getElementById('writeForm_div').style.display='block';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';
    document.getElementById('writeForm2_form').reset();
    document.getElementById('writeForm3_form').reset();
    document.getElementById('writeForm4_form').reset();
    document.getElementById('writeForm5_form').reset();

  }

  function write20Form(){
    document.getElementById('write20Form_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';
    document.getElementById('writeForm1_form').reset();
    document.getElementById('writeForm3_form').reset();
    document.getElementById('writeForm4_form').reset();
    document.getElementById('writeForm5_form').reset();
  }

  function workForm(){
    document.getElementById('workForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';
    document.getElementById('writeForm1_form').reset();
    document.getElementById('writeForm2_form').reset();
    document.getElementById('writeForm4_form').reset();
    document.getElementById('writeForm5_form').reset();
  }

  function scheduleForm(){
    document.getElementById('scheduleForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('todoForm_div').style.display='none';
    document.getElementById('writeForm1_form').reset();
    document.getElementById('writeForm2_form').reset();
    document.getElementById('writeForm3_form').reset();
    document.getElementById('writeForm5_form').reset();
  }

  function todoForm(){
    document.getElementById('todoForm_div').style.display='block';
    document.getElementById('writeForm_div').style.display='none';
    document.getElementById('write20Form_div').style.display='none';
    document.getElementById('workForm_div').style.display='none';
    document.getElementById('scheduleForm_div').style.display='none';
    document.getElementById('writeForm1_form').reset();
    document.getElementById('writeForm2_form').reset();
    document.getElementById('writeForm3_form').reset();
    document.getElementById('writeForm4_form').reset();
  }

  // work status select
  function request(){
    document.getElementById('request').style.backgroundColor = '#4aaefb';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = 'request';
  }

  function doing(){
    document.getElementById('doing').style.backgroundColor = '#50b766';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = 'doing';
  }

  function feedback(){
    document.getElementById('feedback').style.backgroundColor = '#f17a19';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = 'feedback';
  }

  function complete(){
    document.getElementById('complete').style.backgroundColor = '#2e417e';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = 'complete';
  }

  function postpone(){
    document.getElementById('postpone').style.backgroundColor = '#aeaeae';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = 'postpone';
  }

  // 업무탭 작업자 선택영역
  function work_workerSelect(){
    document.getElementById('worker_select_div').style.display = (document.getElementById('worker_select_div').style.display == 'block')?'none':'block';
    
  }

  // 업무탭 작업자 추가 및 작업자들 저장
  var workers_name = [];
  var workers_name_str = "";
  
  function add_worker(obj) {
	  
	var worker_name = obj.innerText;
	
	
	workers_name_str = workers_name_str.concat(',' + worker_name);
	workers_name.push(worker_name);
	
	
	
	console.log(workers_name_str);
	
	
	document.getElementById('work_workers').value = workers_name_str;
	
	var work_workers_value = document.getElementById('work_workers').value; 
	
	work_workers_value = workers_name;
	
	console.log(work_workers_value);
	
	var worker_append = document.createElement('div');
	worker_append.setAttribute('style','display:inline-block; width: 100px; background-color: #efeff9; margin-top: 3px; margin-right: 3px; height: 30px; border-radius: 3px;');
		
		var worker_append_workerName = document.createElement('span');
		worker_append_workerName.setAttribute('style','display: inline-block; vertical-align:middle; width: 80px; margin-left:5px;');
		worker_append_workerName.innerText = obj.innerText;
		worker_append.append(worker_append_workerName);
	
		var worker_append_cancle = document.createElement('button');
		worker_append_cancle.setAttribute('style','vertical-align: middle; display: inline-block; height: 30px; width: 14px; border: none; background: url(images/btn_del_name.png) no-repeat center center;');
		worker_append.append(worker_append_cancle);
		
	
	document.getElementById('worker_append_div').appendChild(worker_append);
  }
 

  //allday
  function alldayBtn(){
    document.getElementById('start_time_select').disabled = (document.getElementById('start_time_select').disabled == true)? false : true;
    document.getElementById('end_time_select').disabled = (document.getElementById('end_time_select').disabled == true)? false : true;
  }
  
  // 우선순위 선택영역 표시
  function orderSelectDiv() {
	document.getElementById('order_div').style.display = (document.getElementById('order_div').style.display == 'block') ? 'none' : 'block';
  }
  
  function orderSelect(order) {
	document.getElementById('work_order').value = order.innerText;
	document.getElementById('order_div').style.display = 'none';
	
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

	var todo_param = "";
  
	var todo_seq;
	
	
	
	
	
	function writeForm5_content_arr(obj,seq) {
		
		var obj_value = obj.value;
		//todo_arr[seq-1][0] = obj_value;
		
		
		
		console.log(obj_value);
	}
	
	function writeForm5_date_arr(obj,seq) {
		
		var obj_value = obj.value;
		//todo_arr[seq-1][1] = obj_value;
		
		console.log(obj_value);
	}
  
	//리스트에서 작업자 선택
    function selectWorker(seq,name,id,div){
    	
      //todo_arr[seq-1][2] = name;
    	
		
	  document.getElementById(id).value = name;
      document.getElementById(div).style.display = 'none';
    }
    
  function todoAppend(){
	  
	  var seq_num = 'seq_'+startDivNum;
	  
//	  var todo_seq_input = document.createElement('input');
//	  todo_seq_input.setAttribute('type','hidden');
//	  todo_seq_input.setAttribute('id',seq_num);
//	  todo_seq_input.setAttribute('value',startDivNum);
	  
//	  document.getElementById('todoContent_external').appendChild(todo_seq_input);
	  
//	  todo_seq = document.getElementById(seq_num).value;
	  
	  document.getElementById('todoContent_external').childNodes
	  
	  
      // id 만들기
      todo_div = divIdNumCreate('todo_div');
      workerPickId = workerIdNumCreate('todo_worker_pick_div');
      workerInputId = workerInputIdNumCreate('workerInputId');
      workerSelectEvent = 'input_' + workerInputId;

      var todoAppendContent = document.createElement('div');
      todoAppendContent.setAttribute('id',todo_div);
      todoAppendContent.innerHTML 
        = "<hr>";

      var cancleBtn = document.createElement('a');
      cancleBtn.setAttribute('onclick','delete_todo("'+ todo_div +'")');
      cancleBtn.setAttribute('style','display: inline-block; width: 18px; height: 18px; background: url(images/btn_todo_checkbox.png) no-repeat 0 -85px;');


      todoAppendContent.appendChild(cancleBtn);

      //할일 입력창 만들기
      var inputTag = document.createElement('input');
      inputTag.setAttribute('type','text');
      inputTag.setAttribute('placeholder','할일 입력');
      inputTag.setAttribute('style','border-style: none; width: 70%; margin-left: 3px; margin-right: 5.5px;');
      inputTag.setAttribute('oninput','writeForm5_content_arr(this,'+startDivNum+')');
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
	      todoDatePickInput.setAttribute('onclick','javascript:$(this).datepicker({dateFormat: "mm/dd"});');
	      todoDatePickInput.setAttribute('onchange','writeForm5_date_arr(this,'+startDivNum+')');
	      
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
            todoWorkerLi_a.setAttribute('onclick','selectWorker('+ startDivNum +',"'+ workerName_a +'","'+ workerInputId +'","'+ workerSelectEvent +'")');
            todoWorkerLi.append(todoWorkerLi_a);
            todoWorkerLi_a.innerHTML= i;
            
          todoWorkerUl.append(todoWorkerLi);
        }

        todoWorkerSelectDiv.append(todoWorkerUl);
        

        todoWorkerPicDiv.append(todoWorkerSelectDiv);
      
      todoAppendContent.appendChild(todoWorkerPicDiv);


      document.getElementById('todoContent_external').appendChild(todoAppendContent);

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


    


























  