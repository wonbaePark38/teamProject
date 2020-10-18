
google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(drawChart);


  function drawChart() {
		if ($('#postpone_count').length == 0) {
			$('#task_status_table').prepend ('<td id="postpone_count">0</td>');
		}
		if ($('#complate_count').length == 0) {
			$('#task_status_table').prepend ('<td id="complate_count">0</td>');
		}
		if ($('#feedback_count').length == 0) {
			$('#task_status_table').prepend ('<td id="feedback_count">0</td>');
		}
		if ($('#doing_count').length == 0) {
			$('#task_status_table').prepend ('<td id="doing_count">0</td>');
		}
		if ($('#request_count').length == 0) {
			$('#task_status_table').prepend ('<td id="request_count">0</td>');
		}
	  
	  var request = $('#request_count').text();
	  var doing = $('#doing_count').text();
	  var feedback = $('#feedback_count').text();
	  var complate = $('#complate_count').text();
	  var postpone = $('#postpone_count').text();
    var data = google.visualization.arrayToDataTable([
      ['Task', 'Hours per Day'],
      ['요청', parseInt(request,10)],
      ['진행', parseInt(doing,10)],
      ['피드백', parseInt(feedback,10)],
      ['완료', parseInt(complate,10)],
      ['보류', parseInt(postpone,10)]
    ]);

    var options = {
      title: '업무 리포트'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
  }