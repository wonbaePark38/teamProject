
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

  
  $('.submit_a').click(function(e) {
//	  $.ajax({
//		  type:"POST",
//		  dataType: "JSON",
//		  url:"writeform5.do",
//		  data
//	  });
	  
	  console.log($('#todoContent_external').contents());
	  
	  
  });
  
  