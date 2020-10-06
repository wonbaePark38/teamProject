
 //date picker
 $( document ).ready(function() {
    $("#start_date").datepicker();
    $("#end_date").datepicker();
    $("#sche_start_date").datepicker();
    $("#sche_end_date").datepicker();
  });
 function todo_datepick(obj){
	 $(obj).datepicker();
 }
 $(".todo_date_input_external").click(function() {
	 $(".todo_date_input_external").datepicker({dateFormat : 'yy/mm/dd'});
 });


  

  
  

  