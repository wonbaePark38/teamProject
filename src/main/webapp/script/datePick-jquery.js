
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


  $('#todoAppend').click(function(){
    $(".todo_date_input_external").datepicker({dateFormat : 'mm/dd'});
  });

  