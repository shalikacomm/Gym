<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

				<div class="panel panel-default" style="margin-top: 5%;">
					<div class="panel-heading">Charts</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-sm-2">
								<div class="form-group"></div>
							</div>
						</div>
						<div class="row inv_row" id="row" style="margin-left: 0%;">
							<div class="col-md-2">
								<label>Select </label>
							</div>
							<div class="col-md-4">
								<select name="user_id" class="form-control chzn-select"
									id="user_id">
									<option></option>
								</select>
							</div>

						</div>
						<br />

						<div class="panel panel-default" style="margin-top: 5%;">
							<div class="panel-heading">Chart 1</div>
							<div class="panel-body">

								<div class="row">
									<div class="col-sm-2">
										<div class="form-group"></div>
									</div>
								</div>

								<div class="row">
									<!--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">-->
									<div class="col-lg-12">
										<div class="well well-lg">
											<canvas id="c" width="1000" height="500"></canvas>
										</div>
									</div>
									
								</div>

								<br />



							</div>



						</div>


					</div>



				</div>

			</div>

		</div>






	</div>



	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>


	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/Chart.bundle.min.js"></script>
	<script src="assets/js/Chart.js"></script>

	<script>
		$(function() {
			/*----------- BEGIN chosen CODE -------------------------*/

			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			/*----------- END chosen CODE -------------------------*/
		});
	</script>
	<script>
	var dataName= [];
	var dataValue=[];
	
	$.ajax({
		type : "GET",
		url : "ChartCon?action=charts",
		dataType : "json",
		
		success : function(data) {
			
			$.each(data.record,function(i,obj) {
					 dataName.push(obj.description);
					dataValue.push(obj.stock);	
			});

		}

	});

	  var ctx = document.getElementById("c").getContext("2d");
      var data = {
          labels: dataName,
          datasets: [
              {
                   backgroundColor: [
                      '#FF6384',
                      '#FFCE56',
                      '#36A2EB',
                      '#FF6384',
                      '#4BC0C0',
                      '#FFCE56'
                  ],
              
                  data: dataValue,
                  spanGaps: false,
              }]
      };

      new Chart(ctx, {
          type: 'bar',
          data: data,
          options: {
           
              responsive: true,
              legend: {
            	  text : 'click here',
                  position: 'bottom',
              },
              title: {
                  display: true,
                  text: 'Item Stock'
              },
              scales: {
                  yAxes: [{
                          display: true,
                          scaleLabel: {
                          show: true,
                          labelString: 'Value'
                          },
                          ticks: {
                              min: 1,
                              max: 100,
                              beginAtZero: true,
                              stepSize:10

                          }
                      }]

              }
          }
      });

    </script>       


</body>
</html>