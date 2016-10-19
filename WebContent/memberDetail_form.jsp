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
<link rel="stylesheet" href="assets/css/login.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

<div class="panel panel-default">
					<div class="panel-heading">Member Details Registration</div>
					<div class="panel-body">
						<form action="MemberDCon" method="POST" id="memDetailForm">

							<div class="row">
								<div class="col-sm-2">

									<div class="form-group">
										<label> User ID </label> <select name="user_id"
											class="form-control chzn-select" id="users">

											<option value="<c:out value="${memObject.user_id}" />">${memObject.user_id}</option>
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

							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label> Member Detail ID </label> <input class="form-control"
											name="memberDetail_id" id="mem_id"
											value="${member_id }<c:out value="${memObject.member_id}" />"
											readonly="readonly" />
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>Height</label><em style="color: red;">*</em>(m)<input type="number" step="0.1" 
											 id="height" value="<c:out value="${memObject.height}" />" name="height"
											min="1" class="form-control" />

									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Weight</label><em style="color: red;">*</em>(kg)<input
											type="number" step="0.1" id="weight"
											value="<c:out value="${memObject.weight}" />" name="weight"
											min="1" class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>BMI</label> <input id="bmi" readonly="readonly" 
											value="<c:out value="${memObject.bmi}" />" name="bmi"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label> Goal Weight</label><input id="goal_weight" type="number" step="0.1"
											value="<c:out value="${memObject.goal_weight}" />"
											name="goal_weight" min="1" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>Bicep</label><input id="bicep" type="number" step="0.1"
											value="<c:out value="${memObject.bicep}" />" name="bicep" min="1"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Chest</label><input id="biceps" type="number" step="0.1"
											value="<c:out value="${memObject.chest}" />" name="chest" min="1"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Hip</label><input id="biceps" type="number" step="0.1"
											value="<c:out value="${memObject.hip}" />" name="hip" min="1"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Thigh</label><input id="biceps" type="number" step="0.1"
											value="<c:out value="${memObject.thigh}" />" name="thigh" min="1"
											class="form-control" />
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>Sholuder Length</label><input type="number" step="0.1"
											value="<c:out value="${memObject.shoulder_length}" />"
											name="sholuder_length" min="1" class="form-control" />
									</div>
								</div>
						
							</div>
							<div class="row">
								<div class="col-sm-1">
									<div class="form-group">
										<button type="submit" class="btn btn-success"
											style="background: #27C3BB">Save</button>
									</div>
								</div>
							
							</div>

						</form>
					</div>

				</div>



	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>
	
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/login.js"></script>
		<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
		<script src="assets/js/sweetalert.min.js"></script>
	
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
				}
			});

		});
		
		
		
		
		//BMI calcuation
		$("#weight").on('keyup click', function() {
			bmi_cal();
		});
		$("#height").on('keyup click', function() {
			bmi_cal();
		});
		function bmi_cal() {
			var height = Number($('#height').val());
			var weight = Number($('#weight').val());

			power_height = height * height;

			bmi = weight / power_height;
			$('#bmi').val(bmi.toFixed(2));
		}
		
	});
	
	
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
							/* $(function() {
									$('#dp3').datepicker();
								});  */
						/* 	$(function() {
								formValidation();
							});
 */
							$("#memDetailForm").submit(function(e) {
												e.preventDefault();

												/* if (!$("#userForm").valid())
													return false; */

												$.ajax({
															type : "POST",
															url : "MemberDCon",
															data : $("#memDetailForm").serialize(),

															success : function(data) {

																if (data == 'true') {

																	swal(
																			{
																				title : "Stock Added !",
																				text : "You Added a new Stock Series!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : true
																			},
																			function() {
																			//	window.location = "UserCon?action=list";
																			});
																} else {
																	swal(
																			"Data not saved!",
																			"Please contact administrator!",
																			"error");
																} 

															}

														});

											});
						});
	</script>

	
	
</body>
</html>