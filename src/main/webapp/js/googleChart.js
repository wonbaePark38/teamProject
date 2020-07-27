google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['요청', 5],
          ['진행', 1],
          ['피드백', 3],
          ['완료', 9],
          ['보류', 1]
        ]);

        var options = {
          title: '업무 리포트'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }