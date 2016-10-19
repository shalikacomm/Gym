<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Details Registration</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->
<link href="assets/plugins/jquery-steps-master/demo/css/normalize.css"
	rel="stylesheet" />
<link href="assets/plugins/jquery-steps-master/demo/css/wizardMain.css"
	rel="stylesheet" />
<link
	href="assets/plugins/jquery-steps-master/demo/css/jquery.steps.css"
	rel="stylesheet" />
<!-- END PAGE LEVEL  STYLES -->
<!-- PAGE LEVEL STYLES date picker -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />

<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />

<link rel="stylesheet"
	href="assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->

<!-- PAGE LEVEL STYLES -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />


<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />

<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />
<link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />

<!-- END PAGE LEVEL  STYLES -->

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
						<form action="MemberCon" method="POST" id="memForm"
							enctype="multipart/form-data">

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
										<label> Member ID </label> <input class="form-control"
											name="member_id" id="mem_id"
											value="${member_id }<c:out value="${memObject.member_id}" />"
											readonly="readonly" />
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>Height</label><em style="color: red;">*</em>(m)<input
											type="number" id="height"
											value="<c:out value="${memObject.height}" />" name="height"
											min="1" class="form-control" />

									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Weight</label><em style="color: red;">*</em>(kg)<input
											type="number" id="weight"
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
										<label> Goal Weight</label>(kg)<input id="goal_weight"
											value="<c:out value="${memObject.goal_weight}" />"
											name="goal_weight" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>Bicep</label>(inches)<input id="bicep" type="number"
											value="<c:out value="${memObject.bicep}" />" name="bicep"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Chest</label>(inches)<input id="biceps" type="number"
											value="<c:out value="${memObject.chest}" />" name="chest"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Hip</label>(inches)<input id="biceps" type="number"
											value="<c:out value="${memObject.hip}" />" name="hip"
											class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Thigh</label>(inches)<input id="biceps" type="number"
											value="<c:out value="${memObject.thigh}" />" name="thigh"
											class="form-control" />
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>Sholuder Length</label>(inches)<input type="number"
											value="<c:out value="${memObject.shoulder_length}" />"
											name="sholuder_length" class="form-control" />
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
								<div class="col-sm-2">
									<div class="form-group">
										<a data-toggle="modal" class="payment btn btn-info btn-md"
											style="border-radius: 6px; background: #27C3BB;" id=""
											href="#imageup">Upload Image</a>

									</div>
								</div>

							</div>


							<!-- modal start -->


							<div class="col-lg-12">
								<div class="modal fade" id="imageup" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true"
									data-keyboard="false" data-backdrop="static">
									<div class="modal-dialog modal-lg">
										<!--<div class="modal-content">-->
										<div class="panel with-nav-tabs panel-info modal-content">
											<div class="panel-heading modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<ul class="nav nav-tabs">
													<li class="active"><a href="#doctor_info"
														data-toggle="tab">Select Your Image</a></li>

													<!--<li><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>-->
												</ul>
											</div>
											<div class="panel-body modal-body">
												<div class="tab-content">
													<div class="tab-pane fade in active" id="doctor_info">
														<div class="row">
															<div class="col-md-3 col-lg-3 " align="center"
																id="doc_img">
																<!-- loading the doctor image from the AJAx call  -->
															</div>
															<div class=" col-md-9 col-lg-9 ">
																<table class="table table-user-information">
																	<tbody id="doc_detail">
																		<div class="col-lg-8">
																			<div class="form-group">
																				<label>Member Photo</label><em style="color: red;">*</em>
																				<div class="fileupload fileupload-new"
																					data-provides="fileupload">
																					<div class="fileupload-preview thumbnail"
																						style="width: 200px; height: 150px;"></div>
																					<div>
																						<span class="btn btn-file btn-success"><span
																							class="fileupload-new">Select image</span><span
																							class="fileupload-exists">Change</span> <input
																							type="file" name="img_path" /></span> <a href="#"
																							class="btn btn-danger fileupload-exists"
																							data-dismiss="fileupload">Remove</a>
																					</div>
																				</div>
																			</div>
																		</div>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<div>
														<hr>
													</div>
													<div class="row">
													<div>
													<div class="col-sm-2">
													<div class="form-group">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
													</div>
													</div>
													<div class="col-sm-2">
													<div class="form-group">
												<button type="submit" class="btn btn-success saveImg"
														style="background: #27C3BB">Save Image</button>
												</div>
												</div>
												</div>
												</div>
											</div>
										</div>
										<!--</div>-->
									</div>
								</div>
							</div>
							<!-- modal end -->



						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>
	<!-- PAGE LEVEL SCRIPTS -->
	<script
		src="assets/plugins/jquery-steps-master/lib/jquery.cookie-1.3.1.js"></script>
	<script src="assets/plugins/jquery-steps-master/build/jquery.steps.js"></script>
	<script src="assets/js/WizardInit.js"></script>
	<!--END PAGE LEVEL SCRIPTS -->
	<!--Start PAGE LEVEL SCRIPTS date picker-->

<script>
$(document).ready(function(){
	$('.saveImg').on('click',function(){
		var user_id = $('#users').val();
		var mem_id = $('#users').val();
		
	});
	});
</script>
	<script>
		$(document).ready(function() {

			$("#memForm").submit(function(e) {
				e.preventDefault();
				var formData = new FormData($("#memForm")[0]); // change form id

				$.ajax({
					url : 'MemberCon',
					type : 'POST',
					data : formData,
					async : false,
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(response) {
						if (response == 'true') {
							alert("Success");
						} else {
							alert("fail");
						}

					}
				});

			});

			/* Bootstrap Datepicker Validation */
			$('#sandbox-container .input-group.date').datepicker({
				format : "yyyy-mm-dd",
				weekStart : 1,
				todayBtn : false,
				clearBtn : true,
				forceParse : false,
				autoclose : true,
				todayHighlight : true,
				endDate : '-16y'
			});

			/* 		
					var userid = $("#users").val();
					if(userid !=""){
					$.ajax({
						method : 'GET',
						url : 'MemberCon?action=user_details&userId=' + userid,
						success : function(data, status) {
							console.log(data.record);
							var users = data.record;
							$("#first_name").val(users.first_name);
							$("#last_name").val(users.last_name);
							$("#nic").val(users.nic);
							$("#email").val(users.email);
						}
					});
				}
			 */

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

	<!--end PAGE LEVEL SCRIPTS date picker-->
	<!-- PAGE LEVEL SCRIPT date picker-->
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/plugins/validVal/js/jquery.validVal.min.js"></script>
	<script src="assets/plugins/daterangepicker/moment.min.js"></script>
	<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>

	<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
	<script src="assets/plugins/jasny/js/bootstrap-fileupload.js"></script>

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

	<!--END PAGE LEVEL SCRIPT date picker-->
</body>
</html>
