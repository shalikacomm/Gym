<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Progress Check</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/login.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<style>
.popover-title {
    background-color: #df6262;
    color: #FFFFFF;
    font-size: 12px;
    text-align:;
}
</style>
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

<div class="panel panel-default">
					<div class="panel-heading">Member Progress Check </div>
					<div class="panel-body">
						<form action="MemberDCon" method="POST" id="memDetailList">

							<div class="row">
								<div class="col-sm-2">

									<div class="form-group">
										<label id="checkme"> User ID </label>
										
										 <select name="user_id" class="form-control chzn-select user" id="users">

											<%-- <option value="<c:out value="${memObject.user_id}" />">${memObject.user_id}</option> --%>
											<option></option> 
											<c:forEach items="${users}" var="temp">
												<option value="<c:out value= "${temp.user_id}" />">${temp.user_id}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label> First Name</label><em style="color: red;">*</em> <input
											id="first_name" readonly="readonly" class="form-control" />

									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Last Name</label><em style="color: red;">*</em> <input
											id="last_name" readonly="readonly" class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label> NIC</label><em style="color: red;">*</em> <input
											id="nic" readonly="readonly" class="form-control" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Email</label><em style="color: red;">*</em> <input
											id="email" readonly="readonly" class="form-control" />
									</div>
								</div>
							</div>
							<hr />
						
							<div class="row col-md-8" id="inv_row">
											
							<div class="form-group col-md-3">
							<label>Plaese select body part</label>
							</div>
							<div class="form-group">
								<div class="text-center col-md-4" style="margin-left:1%;">
											<select id="body_item2" name="body_part" class="form-control item chzn-select">
											 <option value="empty"></option>
											 <option value="height">Height</option>
 											 <option value="weight">Weight</option>
  											<option value="goal_weight">Goal Weight</option>
	  										<option value="chest">Chest</option>
	  										<option value="hip">Hip</option>
	  										<option value="shoulder_length">Shoulder length</option>
	  										<option value="thigh">Thigh</option>
	  										<option value="bicep">Bicep</option>
	  										
												</select>
										</div>
										</div></div>
										<div style="width:800px">
										<canvas id="myChart" width="800" height="500"></canvas>
										</div>
							
							
</form></div></div>


	</div>


	<%@include file="right_panel.jsp"%>

	
<script src="assets/chart/Chart.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/login.js"></script>
		<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
		
		
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
	$(document).ready(function(){
		$('.item').on('change',function(){
			var item  = $(this).val();
			// alert(item);
			var user  = $('.user').val();
			if(user == ""){
			//	alert(123);
				$('#checkme').popover({
		          //  title: 'Warning!',
		            title: 'Please Select a User',
		            placement: 'bottom',
		            color: '#df6262'
		        }).popover('show'); 
			}else{
				dataName=[];
				dataValue=[];
				$('#checkme').popover('destroy'); 
				// var itemName = $('.item').val();
				// alert(item);
				
				 $.ajax({
					 method:'GET',
					 url:'MemberDCon?action=body_part&userName='+ user,
					 success: function(data){
						 alert("done");
						 console.log(data.record);
							$.each(data.record,function(i,obj) {
								 dataName.push(obj.date_added);
								
								 if(item=="weight"){
								dataValue.push(obj.weight);	
								 }else if(item=="height"){
								dataValue.push(obj.height);	
								 }
								 else if(item=="goal_weight"){
								dataValue.push(obj.goal_weight);	
								 }
								 else if(item=="chest"){
								dataValue.push(obj.chest);	
								 }
								 else if(item=="hip"){
								dataValue.push(obj.hip);	
								 }
								 else if(item=="shoulder_length"){
								dataValue.push(obj.shoulder_length);	
								 }
								 else if(item=="thigh"){
								dataValue.push(obj.thigh);	
								 }
								 else if(item=="bicep"){
								dataValue.push(obj.bicep);	
								 }
							
						});
					 
					 }		 
				 });
				 
				 var ctx = $("#myChart");
				// console.log(ctx)

				 var myChart = new Chart(ctx, {
				   type: 'line',
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
			}
		
	});
	});
	
	</script>
	<script>
	$(document).ready(function(){
		
		$("#users").on('change', function() {
			var userID = $("#users").val();
			
			$.ajax({
				method : 'GET',
				url : 'MemberCon?action=user_details&user_id=' + userID,
				success : function(data, status) {
					console.log(data.record);
					var users = data.record;
					$("#first_name").val(users.first_name);
					$("#last_name").val(users.last_name);
					$("#nic").val(users.nic);
					$("#email").val(users.email);
					$('#body_item2').val("empty").trigger("chosen:updated");
				}
			});

		});
		
	
		
	});
	
	
	</script>
	
</body>
</html>