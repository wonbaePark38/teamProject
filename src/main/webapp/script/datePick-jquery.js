
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

  function todo_datepick(obj){
	  $(obj).datepicker();
  }
  
  $(".todo_date_input_external").click(function() {
    $(".todo_date_input_external").datepicker({dateFormat : 'mm/dd'});
  });

  var todo_content_arr = new Array();
  var todo_date_arr = new Array();
  var todo_worker_arr = new Array();
  

  
  $('#writeForm5_submit').click(function(e) {
	  

	  
	  var test =  $('#todoContent_external').contents().each(function(i,e) { 
		  

		  
		  var todo_title = $('#todo_title').val();
		  
		  if(todo_title == null || todo_title == ''){
			  $('#todo_title').val('none');
		  }
		  
		  var content = $(e).find('.todo_content').val();
		  var date = $(e).find('.todo_date').val();
		  var worker = $(e).find('.todo_worker').val();
		  
		  
		  if(content == '' || content == null){
			  content = 'none';
		  }
		  if(date == '' || date == null){
			  date = 'none';
		  }
		  if(worker == '' || worker == null){
			  worker = 'none';
		  }
		  
		  
		  
		  todo_content_arr.push(content);
		  todo_date_arr.push(date);
		  todo_worker_arr.push(worker);
		  
		  
		  console.log(i,content);
		  console.log(i,date);
		  console.log(i,worker);
		  
		  
		  
		  
	  });
	  
	  
	  $('#todo_content_value').val(todo_content_arr);
	  $('#todo_date_value').val(todo_date_arr);
	  $('#todo_worker_value').val(todo_worker_arr);
	  

	  
	  
	  
	  $('#writeForm5_form').submit();
  });
  
  
  $('#writeForm3_submit').click(function(e) {
	
	  
	  
	  
	  
	  
	 
	  
  });
  