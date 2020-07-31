

$( document ).ready(function() {
    $('#month-select-bt').click(function(){
        console.log('월 버튼 클릭');
        var monthNode = document.querySelector('.month-select');
        var weekNode = document.querySelector('.week-select');
        console.log(monthNode);
        $('.month-select').css('display','block');
        $('.week-select').css('display','none');
    });

    $('#week-select-bt').click(function(){

        console.log('주 버튼 클릭');
        var monthNode = document.querySelector('.month-select');
        var weekNode = document.querySelector('.week-select');
        console.log(weekNode);
       
        $('.month-select').css('display','none');
        $('.week-select').css('display','block');
    });
});

$(function(){
	 google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['Year', 'Sales', 'Expenses'],
         ['2004',  1000,      400],
         ['2005',  1170,      460],
         ['2006',  660,       1120],
         ['2007',  1030,      540]
       ]);

       var options = {
         title: 'Company Performance',
         'width' : 700,
         'height' : 300
       };

       var chart = new google.visualization.LineChart(document.getElementById('chart-div'));

       chart.draw(data, options);
     }
});

window.onload  = function() {
   
};
