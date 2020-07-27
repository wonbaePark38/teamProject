
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

  $(document).mouseup(function(e){
    var container=$('.todo_worker_select_div');
    
    if(container.has(e.target).length==0){
      container.css('display','none');
    }
  });