<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Plug</title>

<link href="css/write_completion.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href='css/main.css' rel='stylesheet' />
<script src='lib/main.js'></script>
<!-- <script src='fullcalendar/core/locales/ko.js'></script> -->
<script>

var today_date = new Date();   

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      initialDate: '2020-07-11',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
    	  {
              title: '시작',
              start: '2020-07-20',
              end: '2020-09-02'
            }
    	  
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<!-- 일정 메뉴 -->
			<div class="col-lg-3" style="height: 768px; ">
				<div>일정</div>
				<div>
					<label>
						<input type="checkbox"> &nbsp;
						<span>내가 등록한 일정</span>
					</label>
				</div>
				<div style="border-bottom: 1px solid #d9dada;">
					<label>
						<input type="checkbox"> &nbsp;
						<span>초대받은 일정</span>
					</label>
				</div>
				<div style="padding-top: 6px;">업무</div>
				<div>
					<label>
						<input type="checkbox"> &nbsp;
						<span>내 업무</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox"> &nbsp;
						<span>요청한 업무</span>
					</label>
				</div>
				<div>
					<label>
						<input type="checkbox"> &nbsp;
						<span>전체 업무</span>
					</label>
				</div>
			</div>


			<!-- 일정 내용 -->
			<div class="col-lg-9" >
				<div class="calendar_contents">
					<div class="calendar_content_header">
					<div id='calendar'></div>
					</div>
				</div>
			</div>
		</div>
		<!-- row -->
	</div>
	<!-- container -->
	
	


	
</body>
</html>