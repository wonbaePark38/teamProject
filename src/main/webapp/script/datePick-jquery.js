
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
  
//  document.getElementById('todoContent_external').childNodes.forEach(function(i, e) { console.log(i, e);});
	
//  private int project_id;
//  private String project_name;
//  private String form_name;
//  private Date regDate;
//  private String writer;
  
  $('.submit_a').click(function(e) {
	  

	  
	  var test =  $('#todoContent_external').contents().each(function(i,e) { 
		  
//		  var writeForm5_data = {
//				  'project_id': 1,
//				  'project_name':'test proejct',
//				  'form_name' : $('#formName').val(),
//				  'writer':'tester',
//				  'writeForm5_title' : $('#todo_title').val(),
//				  'writeForm5_content' : $(e).find('.todo_content').val(),
//				  'writeForm5_date' : $(e).find('.todo_date').val(),
//				  'writeForm5_worker' : $(e).find('.todo_worker').val()
//		  } 
		  
		  const content = $(e).find('.todo_content').val();
		  const date = $(e).find('.todo_date').val();
		  const worker = $(e).find('.todo_worker').val();
		
		  
		  todo_content_arr.push(content);
		  todo_date_arr.push(date);
		  todo_worker_arr.push(worker);
		  
		  
		  console.log(i,$(e).find('.todo_content').val());
		  console.log(i,$(e).find('.todo_date').val());
		  console.log(i,$(e).find('.todo_worker').val());
		  
		  
		  
		  
	  });
	  
	  
	  $('#todo_content_value').val(todo_content_arr);
	  $('#todo_date_value').val(todo_date_arr);
	  $('#todo_worker_value').val(todo_worker_arr);
	  
	  //writeForm5_content_str = JSON.stringify(todo_arr);
	  
//	  $.ajax({
//		  type:"POST",
//		  dataType: "JSON",
//		  url:"writeform5.do",
//		  data : todo_arr,
//		  success:function(e){
//			  alert(e);
//		  },
//		  error:function(e){
//			  alert(e);
//		  }
//		  
//	  });
	  
	  
	  
	  $('#writeForm5_form').submit();
  });
  
  