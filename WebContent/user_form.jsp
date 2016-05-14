<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	href="assets/plugins/colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="assets/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<!-- PAGE LEVEL STYLES -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="assets/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">


				<div class="panel panel-default">
					<div class="panel-heading">Instructor Registration</div>
					<div class="panel-body">
						<form role="form" action="UserCon" method="POST">

							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label> User ID </label> <input class="form-control"
											value="${user_id }" readonly="readonly" />
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
										<label> DOB</label><em style="color: red;">*</em>

										<div class="input-group input-append  date" id="dpYears"
											data-date="12-02-2012" data-date-format="dd-mm-yyyy"
											data-date-viewmode="years">
											<input class="form-control" type="text" value="12-02-2012"
												name="dob" readonly="" /> <span
												class="input-group-addon add-on"><i
												class="icon-calendar"></i></span>
										</div>

									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Mobile No.</label><em style="color: red;">*</em> <input
											name="mobile_number" class="form-control" />
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
										<textarea class="form-control" id="address_perm"
											name="address" cols="20" rows=""></textarea>
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label>User Role</label><em style="color: red;">*</em> <select name="role"
											class="form-control" id="doctor_title" name="doctor_title">
											<option>Administrator</option>
											<option>Instructor</option>
											<option>Member</option>
											<option>Operator</option>
										</select>
									</div>
									<div class="col-sm-3">
									<div class="form-group">
										<input type="submit" value="Save" />
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
				todayHighlight : true,
				endDate : '-16y'
			});
		});
	</script>

	<!--end PAGE LEVEL SCRIPTS date picker-->
	<!-- PAGE LEVEL SCRIPT date picker-->
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script
		src="assets/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
	<script src="assets/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script src="assets/plugins/validVal/js/jquery.validVal.min.js"></script>
	<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="assets/plugins/daterangepicker/moment.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/plugins/timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
	<script
		src="assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>
	<script src="assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
	<script src="assets/js/formsInit.js"></script>
	<script>
		$(function() {
			formInit();
		});
	</script>

	<!--END PAGE LEVEL SCRIPT date picker-->
</body>
</html>