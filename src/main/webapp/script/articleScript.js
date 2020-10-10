$(document).ready(function(){
	$('.img_input').on('change',handleImgFileSelect);
	//게시글 참여자
	var project_user_num = 0;
	var project_juser_num = 0;
	$('.right-sendience-li').each(function(){
		project_user_num ++;
	});
	$('.msg_user').find('#totaluser').text(project_user_num);
	$('#juser').find('.right-sendience-li').each(function(){
		project_juser_num++;
	});
	$('#cluser').text('('+(project_juser_num)+')');
	
	// 할일 게시글 반복문
	$('.todo_datas').each(function(){
		var todo_count = 0;
		var todo_success_count = 0;
		// 할일 게시글 안에 리스트 반복문
		$(this).children('.tdlist').each(function(){
			todo_count++;
			if ($(this).children().first().children('.tcheck').attr('id') == 'todo_check_on') {
				todo_success_count++;
			}
		});
		
		var percentage = todo_success_count/ todo_count * 100;
		$(this).find('#todo_success').text(todo_success_count);
		$(this).find('#todo_total').text(todo_count);
		$(this).find('#set_bar').text(percentage);
		$(this).find('#pgval').val(percentage);
	});
	
	// 댓글 리스트
	$('.post_idx').each(function(){
		var reply_count = 0;
		$(this).find('.remark_data').each(function(){
			reply_count++;
		});
		$(this).find('.reply_count').text(reply_count);
	});
	
	// 멘션
	$('.div_text_write').on('input', function() {
	    var currentVal = $(this).val();
	    var textarea = $(this);
	   if (currentVal.indexOf('@') != -1) {
			$(this).parent().parent().find('#mention_select_div').css('display','initial');
			
			
			
		} else {
			$(this).parent().parent().find('#mention_select_div').hide();
		}
	    console.log(currentVal);
	});
	
	// 멘션 리스트
	$('.mention_User').on('click',function(){
		if ($(this).attr('id') == 'mention_off') {
			$(this).attr('id','mention_on');
			$(this).attr('name',$(this).parent().val());
			$(this).text('@'+$(this).text());
			$(this).parent().parent().parent().parent().parent().find('#menstionbar').append($(this));
			$(this).parent().parent().parent().parent().parent().find('#mention_select_div').hide();
			
			var textarea = $(this).parent().parent().parent().parent().parent().find('.div_text_write');
			
			textarea.val(textarea.val().substr(0,textarea.val().length -1));
		} else if ($(this).attr('id') == 'mention_on') {
			$(this).attr('id','mention_off');
			$(this).text($(this).text().substr(1,$(this).text().length));
			$(this).parent().prev().find('li#mid[value='+$(this).attr('name')+']').append($(this));
			$(this).parent().prev().find('#mention_select_div').hide();
		}
	});
	
	// 고정 게시물 리스트
	$('#apx_count').each(function(){
		
	});
});


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
  function request(obj){
    document.getElementById('request').style.backgroundColor = '#4aaefb';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = '업무';
  }

  function doing(){
    document.getElementById('doing').style.backgroundColor = '#50b766';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = '진행';
  }

  function feedback(){
    document.getElementById('feedback').style.backgroundColor = '#f17a19';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = '피드백';
  }

  function complete(){
    document.getElementById('complete').style.backgroundColor = '#798ed1';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('postpone').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = '완료';
  }

  function postpone(){
    document.getElementById('postpone').style.backgroundColor = '#aeaeae';
    document.getElementById('request').style.backgroundColor = 'white';
    document.getElementById('doing').style.backgroundColor = 'white';
    document.getElementById('feedback').style.backgroundColor = 'white';
    document.getElementById('complete').style.backgroundColor = 'white';
    
    document.getElementById('work_status').value = '보류';
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
      
    var returnDivID = id;
    return returnDivID;
  }

  function dateIdNumCreate(id){
      
      var returnDateID = id;
      return returnDateID;
  }

  function workerIdNumCreate(id){

      var returnWorkerID = id;
      return returnWorkerID;
  }

  function workerInputIdNumCreate(id){

    var returnWorkerInputID = id;
    return returnWorkerInputID;
  }

  function workerNameIdNumCreate(id){

    var returnWorkerNametID = id;
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
   /* function selectWorker(seq,name,id,div){
       
      //todo_arr[seq-1][2] = name;
       
      
//     document.getElementById(id).value = name;
      document.getElementById(div).style.display = 'none';
    }*/
    
  function todoAppend(){
     
     var seq_num = 'seq_'+startDivNum;
     
//     var todo_seq_input = document.createElement('input');
//     todo_seq_input.setAttribute('type','hidden');
//     todo_seq_input.setAttribute('id',seq_num);
//     todo_seq_input.setAttribute('value',startDivNum);
     
//     document.getElementById('todoContent_external').appendChild(todo_seq_input);
     
//     todo_seq = document.getElementById(seq_num).value;
     
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
      inputTag.setAttribute('class','todo_content');
      inputTag.setAttribute('placeholder','할일 입력');
      inputTag.setAttribute('style','border-style: none; width: 63%; margin-left: 3px; margin-right: 5.5px;');
      inputTag.setAttribute('oninput','writeForm5_content_arr(this,'+startDivNum+')');
      todoAppendContent.append(inputTag);
      
      
      // 날짜 선택 영역 만들기
      var datePickId = dateIdNumCreate('todo_date_pick_div');

      var todoDatePickDiv = document.createElement('div');
      todoDatePickDiv.setAttribute('id',datePickId);
      todoDatePickDiv.setAttribute('style','width: 18%; display: inline-block;');

         var todoDatePickInput = document.createElement('input');
         todoDatePickInput.setAttribute('type','text');
         todoDatePickInput.setAttribute('class','todo_date');
         todoDatePickInput.setAttribute('placeholder','일자');
         todoDatePickInput.setAttribute('readOnly','true');
         todoDatePickInput.setAttribute('style','width: 96%; margin-left: 0px;');
         todoDatePickInput.setAttribute('onclick','javascript:$(this).datepicker({dateFormat: "yy/mm/dd"});');
         todoDatePickInput.setAttribute('onchange','writeForm5_date_arr(this,'+startDivNum+')');
         
         todoDatePickDiv.append(todoDatePickInput);
         
      todoAppendContent.append(todoDatePickDiv);



      // 작업자 선택 영역 만들기

      var todoWorkerPicDiv = document.createElement('div');
      todoWorkerPicDiv.setAttribute('id',workerPickId);
      todoWorkerPicDiv.setAttribute('style','width: 12%; display: inline-block; position: relative;');

        
        var todoWorkerPickInput = document.createElement('input');
        todoWorkerPickInput.setAttribute('type','text');
        todoWorkerPickInput.setAttribute('id',workerInputId);
        todoWorkerPickInput.setAttribute('class','todo_worker');
        todoWorkerPickInput.setAttribute('placeholder','담당자');
        todoWorkerPickInput.setAttribute('readOnly','true');
        todoWorkerPickInput.setAttribute('style','width: 91%; margin-left: 0px;');
        
        todoWorkerPicDiv.append(todoWorkerPickInput);

        var todoWorkerSelectDiv = document.createElement('div');
        todoWorkerSelectDiv.setAttribute('id',workerSelectEvent);
        todoWorkerSelectDiv.setAttribute('class','todo_worker_select_div');
        todoWorkerSelectDiv.setAttribute('style','display: none; z-index: 99; width: 150px; max-height: 140px; background-color: white; position: absolute; overflow-y: scroll; border-radius: 5px; border: 2px solid black;');
        
        var todoWorkerUl = document.createElement('ul');
        todoWorkerUl.setAttribute('style','list-style: none; padding-left: 10px; position: absolute;');
        
    
        $('.project_user').each(function(){
        	var member_name = $(this).attr('name');
        	var member_id = $(this).attr('value');
        	
        	workerName_a = workerNameIdNumCreate('workerNmae');
        	
        	var todoWorkerLi = document.createElement('li');
        	var todoWorkerLi_a = document.createElement('a');
        	var todoWorkerLi_input = document.createElement('input');
        	todoWorkerLi_a.setAttribute('id','member_a');
        	todoWorkerLi_a.setAttribute('name',member_name);
        	todoWorkerLi.append(todoWorkerLi_a);
        	todoWorkerLi_a.innerHTML= member_name;
        	todoWorkerLi_input.setAttribute('id','member_li_input');
        	todoWorkerLi_input.setAttribute('value',member_id);
        	todoWorkerLi_input.setAttribute('type','hidden');
        	todoWorkerLi.append(todoWorkerLi_input);
        	
        	todoWorkerUl.append(todoWorkerLi);
        });

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
    $(document).on('click','#workerInputId',function(){
    	$(this).next().css('display','block');
    });
      

    
    //todo worker select
    function todoWorkerSelect(){
      document.getElementById('todo_worker').style.display = (document.getElementById('todo_worker').style.display == 'block')?'none':'block';
      
    }
    
    


    // 툴바 장소 찍기
    function locationPick(){
      document.getElementById('search_location_div').style.display = (document.getElementById('search_location_div').style.display == 'block')?'none':'block';
    }



	$(document).on('click','#pin_icon',function(){
		if ($(this).attr('value') == '0') {
			$(this).attr('value','1');
		} else {
			$(this).attr('value','0');
		}
		
		// pixed
		var article_pixed = $(this).attr('value');
		// article_id
		var article_id = $(this).parent().parent().parent().parent().attr('id');
		// project_name
		var project_name = $('p[id=title]').text();
		// project_id
		var project_id = $(this).next('input[name=project_id]').val();
		
		var article_pix = $('<form></form>');
		// form 설정
		article_pix.attr('method','post');
		article_pix.attr('action','articlepix.do');
													
		// form 데이터
		article_pix.append($('<input/>',{type:'hidden', name:'project_name' ,value: project_name}));
		article_pix.append($('<input/>',{type:'hidden', name:'project_id' ,value: project_id}));
		article_pix.append($('<input/>',{type:'hidden', name:'article_pix' ,value: article_pixed}));
		article_pix.append($('<input/>',{type:'hidden', name:'article_id' ,value: article_id}));
													
		// form 생성하는 곳
		article_pix.appendTo('body');
		article_pix.submit();
	});
	
	
		
	// 업무탭 작업자 추가 및 작업자들 저장
  $(document).on('click','.task_User',function(){
	  var worker_name = $(this).text();
	  var worker_id = $(this).prev().val();
	 
	  /*	  
	  workers_id += (worker_id+',');
	  workers_name += (worker_name + ',');
	  
	  $('#work_workers').attr('value',workers_name);
	  $('#work_workers_id').attr('value',workers_id);
	  
	  */	 
	  // 작업자 띄우기
	  var worker_append = document.createElement('div');
	  worker_append.setAttribute('id','user_div'+worker_id);
	   worker_append.setAttribute('style','display:inline-block; padding: 0 10px; background-color: #efeff9; margin-top: 3px; margin-right: 3px; height: 30px; border-radius: 3px;');
	      
	      /*var worker_append_workerName = document.createElement('span');
	      worker_append_workerName.setAttribute('style','display: inline-block; vertical-align:middle; width: 80px; margin-left:5px;');
	      worker_append_workerName.setAttribute('class','taskSU');
	      worker_append_workerName.setAttribute('id',worker_id);
	      worker_append_workerName.innerText = worker_name;
	      worker_append.append(worker_append_workerName);*/
	   
	      document.getElementById('worker_append_div').appendChild(worker_append);
	      $(this).attr('class','task_User_on');
		  $(this).prev().appendTo('#user_div'+worker_id);
		  $(this).appendTo('#user_div'+worker_id);

	 	$(this).parent().parent().prev().hide();
  });
  // 업무 게시글 담당자 삭제
  $(document).on('click','.task_User_on',function(){
	  var id = $(this).prev().val();
	  var list = $('#worker_select_div').find('li#'+id);
	  var paretn_div = $(this).parent();
	  paretn_div.remove();
	  $(this).attr('class','task_User');
	  $(this).prev().appendTo(list);
	  $(this).appendTo(list);
	  
	  
  });
  

  $(document).on('click','#member_a',function(){
	  var value = $(this).attr('name');
	  $(this).parent().parent().parent().prev().val(value);
	  
	  $('.todo_worker_select_div').css('display','none');
  });
  
  
 
// 할일 게시글 진행상황
$(document).on('click','.tcheck',function(){
	
	var todo_id = $(this).parent().parent().attr('name');
	var todo_seccess;
	var p_title = $('p#title').text();
	var p_id = $('#p_id').val();
	// form 생성
	var todo_check = $('<form></form>');
	
	// form 설정
	todo_check.attr('method','post');
	todo_check.attr('action','todoupdate.do');
	
	if ($(this).attr('id') == 'todo_check') {
		$(this).attr('id','todo_check_on');  
		todo_check.append($('<input/>',{type:'hidden', name:'todo_success', value: 1}));
	} else if ($(this).attr('id') == 'todo_check_on') {
		$(this).attr('id','todo_check');  
		todo_check.append($('<input/>',{type:'hidden', name:'todo_success', value: 0}));
	}
	
	// form 데이터
	todo_check.append($('<input/>',{type:'hidden', name:'project_id', value: p_id}));
	todo_check.append($('<input/>',{type:'hidden', name:'project_name', value: p_title}));
	todo_check.append($('<input/>',{type:'hidden', name:'todo_id', value: todo_id}));
	
	// form 생성하는 곳
	todo_check.appendTo('body');
	todo_check.submit();
});


$(document).on('click','#set_icon',function(){
	$(this).parent().next().next().toggle();
});

// 상단게시글
$(document).on('click','.pix_div',function(){
	$('.pix_div').next().hide();
	if ($(this).next().hide()) {
		$(this).next().show();
	} else {
		$(this).next().hide();
		
	}
});

// 게시글 수정하기
function article_modified_set(type, parent){
	
	if (type == 'initialize') {
		parent.find('#set_icon').hide();	// 게시글 설정버튼
		parent.find('#set_icon_list').hide();	// 게시글 설정버튼 리스트
		parent.find('.article_status').hide();	// 게시글 좋아요/댓글 갯수
		parent.find('.bottom_list').children('li').hide();	// 게시글 좋아요/댓글/담아두기
		if (parent.attr('name') == 'scheWrite') {
			var title = parent.find('#write_t').text();
			
			parent.find('#write_t').contents().unwrap().wrap('<input type="text" id="write_t" style="width: 60%; padding: 0px; margin-left: 110px; font-weight: 700; height: 35px;" value="'+title+'">');
			parent.find('#write_c').contents().unwrap().wrap('<textarea id="write_c" style="width:100%;margin-left: 25px;"></textarea>');
		} else if (parent.attr('name') == 'todoWrite') {
			var title = parent.find('#write_t').text();
			parent.find('#write_t').contents().unwrap().wrap('<input type="text" id="write_t" value="'+title+'">');
			parent.find('.todo_c').each(function(){
				var content = $(this).text();
				$(this).contents().unwrap().wrap('<input type="text" class="todo_c" value="'+content+'">');
			});
		} else { // 게시글 내용 유무
			var title = parent.find('#write_t').text();
			parent.find('#write_t').contents().unwrap().wrap('<input type="text" id="write_t" style="width:95%;" value="'+title+'">');
			parent.find('#write_c').contents().unwrap().wrap('<textarea id="write_c" style="width:100%;"></textarea>');
		}
		parent.find('.bottom_list').append('<li class="modified_set" style="float:right;"><a id="modified_cancel" class="modified_btn">취소</a></li>')
		parent.find('.bottom_list').append('<li class="modified_set" style="float:right;"><a id="modified_success" class="modified_btn">수정</a></li>')
	} else if (type == 'terminate') {
		if (parent.attr('name') == 'scheWrite') {
			parent.find('#write_t').contents().unwrap().wrap('<dd id="write_t" class="wc_title"></dd>');
			parent.find('#write_c').contents().unwrap().wrap('<pre id="write_c" style="font-size: 15px;margin-left: 25px;"></pre>');
		} else if (parent.attr('name') == 'todoWrite') {
			parent.find('#write_t').contents().unwrap().wrap('<strong id="write_t"></strong');
			parent.find('.todo_c').each(function(){
				$(this).contents().unwrap().wrap('<span type="text" class="todo_c"></span>');
			});
		} else { 
			parent.find('#write_t').contents().unwrap().wrap('<strong id="write_t" style="width:100%;"></strong');
			parent.find('#write_c').contents().unwrap().wrap('<pre id="write_c" style="font-size: 15px;"></pre>');
		}
		parent.find('.bottom_list').children('.modified_set').remove();
		parent.find('.bottom_list').children('li').show();
		parent.find('.article_status').show();
		parent.find('#set_icon').show();
	}
	
}

// 게시글 수정 서브밋
function article_modified_form(type,parent){
	var write_title = parent.find('#write_t').val();
	var write_content = parent.find('#write_c').val();
	
	var modified_success = $('<form></form>');

	// form 설정
	modified_success.attr('method','post');
	modified_success.attr('action','articlemodified.do');
	
	// form 데이터
	modified_success.append($('<input/>',{type:'hidden', name:'form_name', value: parent.attr('name')}));
	modified_success.append($('<input/>',{type:'hidden', name:'project_id', value: $('#p_id').val()}));
	modified_success.append($('<input/>',{type:'hidden', name:'project_name', value: $('p#title').text()}));
	modified_success.append($('<input/>',{type:'hidden', name:'article_id', value: parent.attr('id')}));
	
	if (type == 'nomalWrite') {
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm1_content', value: write_content}));
	} else if (type == 'nomalWrite2.0') {
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm2_title', value: write_title}));
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm2_content', value: write_content}));
	} else if (type == 'taskWrite') {
		var task_status = parent.find('.task_type_select').text();
		var task_progress = parent.find('#progress_a').val();
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm3_title', value: write_title}));
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm3_status', value: task_status}));
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm3_progress', value: task_progress}));
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm3_content', value: write_content}));
	} else if (type == 'scheWrite') {
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm4_title', value: write_title}));
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm4_content', value: write_content}));
	} else if (type == 'todoWrite') {
		var todo_content = '';
		parent.find('.todo_c').each(function(){
			todo_content += $(this).val()+',';
		});
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm5_title', value: write_title}));
		modified_success.append($('<input/>',{type:'hidden', name:'writeForm5_content', value: todo_content}));
	}
	
	// form 생성하는 곳
	modified_success.appendTo('body');
	modified_success.submit();
	
}
$(document).on('click','#article_set',function(){
	var parent = $(this).parent().parent().parent().parent().parent().parent();
	
	
	if ($(this).text() == '수정') {
		if (parent.attr('name') == 'nomalWrite') {
			article_modified_set('initialize',parent);
			parent.find('.modified_btn').on('click',function(){
				if ($(this).attr('id') == 'modified_cancel') {
					article_modified_set('terminate',parent);
				} else if ($(this).attr('id') == 'modified_success') {
					article_modified_form(parent.attr('name'),parent);
				}
			});
		} else if(parent.attr('name') == 'nomalWrite2.0') {
			article_modified_set('initialize',parent);
			parent.find('.modified_btn').on('click',function(){
				if ($(this).attr('id') == 'modified_cancel') {
					article_modified_set('terminate',parent);
				} else if ($(this).attr('id') == 'modified_success') {
					article_modified_form(parent.attr('name'),parent);
				}
			});
		} else if (parent.attr('name') == 'taskWrite') {
			article_modified_set('initialize',parent);
			var init_task = parent.find('.task_type_select');
			//var init_worker_manager = parent.find('.');
			parent.find('.task_type').attr('class','task_type_on');
			
			parent.find('.task_type_on').on('click',function(){
				var select_status = $(this); 
				if (confirm('상태를 수정하시겠습니까?')) {
					parent.find('#status_select_div').find('span').attr('class','task_type_on');
					select_status.attr('class','task_type_select');
					$('.task_type_on').css('backgroundColor','white');
					if (select_status.text() == '요청') {
						select_status.css('backgroundColor','#4aaefb')
					} else if (select_status.text() == '진행') {
						select_status.css('backgroundColor','#50b766')
					} else if (select_status.text() == '피드백') {
						select_status.css('backgroundColor','#f17a19')
					} else if (select_status.text() == '완료') {
						select_status.css('backgroundColor','#798ed1')
					} else if (select_status.text() == '보류') {
						select_status.css('backgroundColor','#aeaeae')
					}
				 } 
			 });
			parent.find('.modified_worker').on('click',function(){
				var task_parent = $(this).parent().parent().parent().parent().parent().parent();
				
				task_parent.find('.modified_worker_select_div').toggle();
				
			});
			
			parent.find('#modified_task_User').on('click',function(){
				var task_user = $(this).parent().parent().parent().parent().prev();
				task_user.append('<input type="button" name="'+$(this).prev().attr('value')+'"value="'+$(this).text()+'">');
				parent.find('.modified_worker_select_div').hide();
			});
			
			parent.find('#progress_a').on('click',function(){
				if ($(this).attr('value') == '100') {
					$(this).attr('value',0);
				} else{
					$(this).attr('value',$(this).val()+20);
				}
			});
			
			
			parent.find('.modified_btn').on('click',function(){
				if ($(this).attr('id') == 'modified_cancel') {
					article_modified_set('terminate',parent);
					parent.find('.task_type_on').attr('class','task_type');
					// 임시
					var task_cancel = $('<form></form>');
					task_cancel.attr('method','post');
					task_cancel.attr('action','mainpage.do');
					task_cancel.append($('<input/>',{type:'hidden', name:'project_id', value: $('#p_id').val()}));
					task_cancel.append($('<input/>',{type:'hidden', name:'project_name', value:  $('p#title').text()}));
					task_cancel.appendTo('body');
					task_cancel.submit();
				} else if ($(this).attr('id') == 'modified_success') {
					article_modified_form(parent.attr('name'),parent);
				}
			});
		} else if (type = 'scheWrite') {
			article_modified_set('initialize',parent);			
			
			parent.find('.modified_btn').on('click',function(){
				if ($(this).attr('id') == 'modified_cancel') {
					article_modified_set('terminate',parent);
					
					
				} else if ($(this).attr('id') == 'modified_success') {
					article_modified_form(parent.attr('name'),parent);
					
				}
			});
		}
		
	} else if ($(this).text() == '삭제') {
		parent.find('#set_icon_list').hide();
		 if (confirm('게시글을 정말로 삭제하시겠습니까?')) {
			
			var article_del = $('<form></form>');
			
			// form 설정
			article_del.attr('method','post');
			if (form_name == 'todoWrite') {
				article_del.attr('action','deletetodo.do');
			} else {
				article_del.attr('action','deletearticle.do');
			}
			var form_name = parent.attr('name');
			var p_title = $('p#title').text();
			var p_id = $('#p_id').val();
			// form 데이터
			article_del.append($('<input/>',{type:'hidden', name:'project_id', value: $('#p_id').val()}));
			article_del.append($('<input/>',{type:'hidden', name:'project_name', value:  $('p#title').text()}));
			article_del.append($('<input/>',{type:'hidden', name:'article_id', value: parent.attr('id')}));
			
			// form 생성하는 곳
			article_del.appendTo('body');
			article_del.submit();
		 } else {
			alert('취소되었습니다.');
		 }
	}
});


 $(document).on('click','#bringIcon',function(){
	
	 var article_id = $(this).parent().parent().parent().parent().attr('id');
	 var p_title = $('p#title').text();
	 var p_id = $('#p_id').val();
	 var aricle_lookup = $('<form></form>');
	
	// form 설정
	aricle_lookup.attr('method','post');
	aricle_lookup.attr('action','mergecontain.do');
	
	// form 데이터
	aricle_lookup.append($('<input/>',{type:'hidden', name:'project_id', value: p_id}));
	aricle_lookup.append($('<input/>',{type:'hidden', name:'project_name', value: p_title}));
	aricle_lookup.append($('<input/>',{type:'hidden', name:'article_id', value: article_id}));
	 if ($(this).attr('class') == 'bringIcon') {
		aricle_lookup.append($('<input/>',{type:'hidden', name:'article_contain', value: 'bringIcon_on'}));
	} else if ($(this).attr('class') == 'bringIcon_on') {
		aricle_lookup.append($('<input/>',{type:'hidden', name:'article_contain', value: 'bringIcon'}));
		
	}
		 
	// form 생성하는 곳
	aricle_lookup.appendTo('body');
	aricle_lookup.submit();
	
 });
 
 
 $(document).on('click','#input_btn_icon', function(){
	 var reply_div = $(this).parent().parent().parent().next('.reply_div');
	 reply_div.toggle();
 });
 
 $(document).on('keydown keyup', 'textarea', function () {
	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
});

$(document).on('click','.remark_btn',function(){
	var p_title = $('p#title').text();
	var p_id = $('#p_id').val();
	
	if ($(this).text() == '수정') {
		$(this).text('확인');
		$(this).next().next().text('취소');
		var content = $(this).parent().next().find('pre').text();
		$(this).parent().next().find('#reply_c').contents().unwrap().wrap('<input type="text" id="reply_c" value="'+content+'">');
		
	} else if ($(this).text() == '삭제') {
		if (confirm('댓글을 정말로 삭제하시겠습니까?')) {
			var reply_id = $(this).parent().next().find('strong').attr('id');
			
			var reply_delete = $('<form></form>');
			
			// form 설정
			reply_delete.attr('method','post');
			reply_delete.attr('action','deletereply.do');
			
			// form 데이터
			reply_delete.append($('<input/>',{type:'hidden', name:'project_id', value: p_id}));
			reply_delete.append($('<input/>',{type:'hidden', name:'project_name', value: p_title}));
			reply_delete.append($('<input/>',{type:'hidden', name:'reply_id', value: reply_id}));
			
				 
			// form 생성하는 곳
			reply_delete.appendTo('body');
			reply_delete.submit();
		} else {
			alert('취소 되었습니다.')
		}
		
	} else if ($(this).text() == '취소') {
		$(this).prev().prev().text('수정');
		$(this).text('삭제');
		$(this).parent().next().find('#reply_c').contents().unwrap().wrap('<pre id="reply_c"></pre>');
	} else if ($(this).text() == '확인') {
		
		var reply_content = $(this).parent().next().find('#reply_c').val();
		var reply_id = $(this).parent().next().find('strong').attr('id');
		
		var reply_update = $('<form></form>');
		
		// form 설정
		reply_update.attr('method','post');
		reply_update.attr('action','updatereply.do');
		
		// form 데이터
		reply_update.append($('<input/>',{type:'hidden', name:'project_id', value: p_id}));
		reply_update.append($('<input/>',{type:'hidden', name:'project_name', value: p_title}));
		reply_update.append($('<input/>',{type:'hidden', name:'reply_content', value: reply_content}));
		reply_update.append($('<input/>',{type:'hidden', name:'reply_id', value: reply_id}));
		
			 
		// form 생성하는 곳
		reply_update.appendTo('body');
		reply_update.submit();
		
	}
});
 
// 이미지 업로드

var sel_files = [];

$(document).on('click','#img_upload',function(){
	$(this).parent().find('.img_input').trigger('click');
});

function handleImgFileSelect(e) {
	sel_files = [];
	$('.post_images').empty();	
	var imgDiv = $(this).parent().parent().find('#uploadImg');
	var imgView = $(this).parent().parent().find('.post_images');
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index = 0;
	filesArr.forEach(function(f){
		if (!f.type.match('image.*')) {
			alert('이미지 확장자만 가능합니다.')
			return;
		}
		
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e) {
			var html = '<div id="img_id_'+index+'"><img src="'+e.target.result+'" data-file="'+f.name+'" class="selProductFile" title="Click to remove"><a href="javascript:;" onclick="deleteImageAction('+index+')" >삭제</a></div>';
			imgDiv.append(html);
			index++;

		}
		reader.readAsDataURL(f);
		imgView.show();
	});
}
$(document).on('click','#file_del',function(){
	alert('개발 중 입니다.');
});
function deleteImageAction(index){
	alert('개발 중 입니다.')
//	var img_id = '#img_id_'+index;
//	$(img_id).remove();
}
 