
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

  var writeForm5_content_str = new Object();
  var todo_arr = new Array();
  
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
		  var todo_arr1 = new Object();
		  
		  todo_arr1.writeForm5_content = $(e).find('.todo_content').val();
		  todo_arr1.writeForm5_date = $(e).find('.todo_date').val();
		  todo_arr1.writeForm5_worker = $(e).find('.todo_worker').val();
		
		  
		  todo_arr.push(todo_arr1);
		  
		  console.log(i,$(e).find('.todo_content').val());
		  console.log(i,$(e).find('.todo_date').val());
		  console.log(i,$(e).find('.todo_worker').val());
		  
		  console.log(todo_arr);

		  
	  });
	  
	  //writeForm5_content_str = JSON.stringify(todo_arr);
	  
	  console.log( writeForm5_content_str);
	  var test = JSON.stringify(todo_arr);
	  alert(todo_arr);
	  
	  $.ajax({
		  type:"POST",
		  dataType: "JSON",
		  url:"writeform5.do",
		  data : todo_arr,
		  success:function(e){
			  alert(e);
		  },
		  error:function(e){
			  alert(e);
		  }
		  
	  });
	  
	  todo_arr = null;
  });
  
  