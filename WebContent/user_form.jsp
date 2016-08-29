<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />

<!-- END PAGE LEVEL  STYLES -->

<link rel="stylesheet" href="assets/css/sweetalert.css" />

<!-- END PAGE LEVEL  STYLES -->

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">


				<div class="panel panel-default">
					<div class="panel-heading">User Registration</div>
					<div class="panel-body">
						<form role="form" id="userForm" action="UserCon" method="POST">

							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label> User ID </label> <input class="form-control"
											name="user_id" value="${user_id }" readonly="readonly" />
									</div>
								</div>
							</div>
							<div class="row">


								<div class="col-sm-3">
									<div class="form-group">
										<label> First Name</label><em style="color: red;">*</em> <input
											name="first_name" class="form-control" />

									</div>
								</div>
								<div class="col-sm-5">
									<div class="form-group">
										<label> Last Name</label><em style="color: red;">*</em> <input
											name="last_name" class="form-control" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Email</label><em style="color: red;">*</em> <input
											name="email" class="form-control" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label> NIC</label><em style="color: red;">*</em> <input
											name="nic" type="text" class=" gur new-empty form-control"
											id="member_nic" name="nic" placeholder="123456789V"
											maxlength="10" title="Insert a Valid NIC" />
									</div>
								</div>
								<div class="col-sm-3">

									<div class="form-group">
										<label for="date_of_birth" style="margin-left: 0%;">Date
											of Birth</label><em style="color: red;">*</em>
										<div id="sandbox-container">
											<div class="input-group date">
												<input type="text" placeholder="YYYY-MM-DD" name="dob"
													id="dob" class="all form-control"><span
													class="input-group-addon"><li class= "glyphicon glyphicon-th"></li></span>
											</div>
											<label for="dob" class="error" id="doctor_bday-error"></label>
										</div>
									</div>

								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Mobile No.</label><em style="color: red;">*</em> <input
											name="mobile_number" class="form-control"  maxlength="10"/>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<div class="checkbox">
											<label><b>Gender</b></label><em style="color: red;">*</em></br> <label>
												<input class="uniform" type="radio" name="gender"
												value="male" checked="checked" />Male
											</label>
										</div>
										<div class="checkbox">
											<label> <input class="uniform" type="radio"
												name="gender" value="female" /> Female
											</label>
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Address</label>
										<textarea class="form-control" id="address_perm" placeHolder="Enter your address"
											name="address" cols="20" rows=""></textarea>
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>User Role</label><em style="color: red;">*</em>
										
										<% String role=currentUser.getRole();
										if(role.equals("administrator")) { %>
										 <select
											name="role" class="form-control" id="user_type"
											name="user_type">
											<option>Administrator</option>
											<option>Instructor</option>
											<option selected>Member</option>
											<option >Operator</option>
										</select>
										<%} else if(role.equals("operator")){ %>
										<input readonly="readonly"  class="form-control" value="member" type="text" name="user_type">
										<%} %>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<input type="submit" value="Save"
												class="btn btn-success btn-lg " />
										</div>
									</div>
								</div>
							</div>


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




	<!--end PAGE LEVEL SCRIPTS date picker-->
	<!-- PAGE LEVEL SCRIPT date picker-->
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<!-- <script
		src="assets/plugins/datepicker/js/bootstrap-datepicker.en-GB.min.js"></script>
 -->
	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>

	<script src="assets/js/validationInit.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			/* Bootstrap Datepicker Validation */
			
			$('#sandbox-container .input-group.date').datepicker({
				format : "yyyy-mm-dd",
				weekStart : 1,
				todayBtn : false,
				clearBtn : true,
				forceParse : false,
				autoclose : true,
				todayHighlight : false,
				endDate : '-16y'
			});
		});
	</script>





	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							/* $(function() {
									$('#dp3').datepicker();
								});  */
							$(function() {
								formValidation();
							});

							$("#userForm")
									.submit(
											function(e) {
												e.preventDefault();

												if (!$("#userForm").valid())
													return false;

												$
														.ajax({
															type : "POST",
															url : "UserCon",
															data : $(
																	"#userForm")
																	.serialize(),

															success : function(
																	data) {

																if (data == 'true') {

																	swal(
																			{
																				title : "User Added !",
																				text : "You created a User!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : false
																			},
																			function() {
																				window.location = "UserCon?action=list";
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

	<!--END PAGE LEVEL SCRIPT date picker-->
</body>
</html>
