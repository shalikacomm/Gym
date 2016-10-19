<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/login.css" />

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
<div style="width:400px">
<canvas id="myChart" width="400" height="400"></canvas>
</div>



	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>


	<script src="assets/chart/Chart.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/login.js"></script>
	<script>
	$(document).ready(function(){
	var dataName= [];
	var dataValue=[];
	
	$.ajax({
		type : "GET",
		url : "ChartCon?action=charts",
		dataType : "json",
		
		success : function(data) {
			
			$.each(data.record,function(i,obj) {
					 dataName.push( new String(obj.description));
					dataValue.push(obj.stock);	
			});
		//	alert(dataValue);
					}
	});
	
	
	
var ctx = $("#myChart");
// console.log(ctx)

 var myChart = new Chart(ctx, {
   type: 'bar',
   data : {
       labels: dataName,
       datasets: [{
           label: 'click here',
           fill : false,
           lineTension: 0.1,
           data: [12, 19, 3, 5, 2, 3],
           backgroundColor: 'rgba(255, 159, 64, 0.2)',
           borderColor:'rgba(255, 159, 64, 1)',
           borderCapStyle:'butt',
           borderDash:[],
           borderDashOffset:0.0,
           borderJoinStyle: 'miter',
           pointBorderColor:'rgba(75, 192, 64, 1)',
           pointBackgroundColor:'#fff',
           pointBorderWidth:1,
           pointHoverRadius:5,
           pointHoverBackgroundColor: 'rgba(255, 159, 64, 1)',
           pointHoverBorderColor: 'rgba(220, 220, 220, 1)',
           pointHoverBorderWidth: 2,
           pointRadius:10,
           data:dataValue,
           
       }]
   },
   options: {
       scales: {
           yAxes: [{
               ticks: {
                   beginAtZero:true
               }
           }]
       }
   }
});
	});
</script>
	
</body>
</html>