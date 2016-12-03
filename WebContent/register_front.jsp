
<!doctype html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><html lang="en" class="no-js"> <![endif]-->
<html lang="en">
<head>

<!-- Basic -->
<title>FIT & FUN HEALTH CLUB | Home</title>

<!-- Define Charset -->
<meta charset="utf-8">

<!-- Responsive etatag -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Page Description and Author -->
<meta name="description" content="Margo - Responsive HTML5 Template">
<meta name="author" content="iThemesLab">


<%@include file="head_src_front.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/modal.css" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
</head>
<body>

	<!-- Container -->
	<div id="container">
		<!-- Start Header -->
		<%@include file="header_front.jsp"%>
		<!-- End Header -->
		<!-- Start Page Banner -->
		<div class="page-banner"
			style="padding: 40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2 style="text-transform: none;">Members Application Form...</h2>
						<p style="font-weight: bold; color: #8A5497;"></p>
					</div>
					<div class="col-md-6">
						<ul class="breadcrumbs">
							<li><a href="<?php echo base_url(); ?>site_main/index">Home</a></li>
							<li>Member</li>
							<li>Become a Member</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Banner -->

		<!-- Start Content -->

		<div id="content">
			<div class="container">
				<div class="page-content"
					style="background-image: url('${pageContext.request.contextPath}/assets_front/images/registration_12.jpg'); background-size: 33% 90%; margin-left:-10%; background-repeat: no-repeat;">

					<!--Registration form start-->
						<div class="row hide" id="processing_img">
															<div class="col-md-4"></div>
															<div class="col-md-6">
																<img
																	src="${pageContext.request.contextPath}/assets/img/processing.gif" />
															</div>
														</div>
					<div class="row">
						<div
							class="col-lg-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"
							style="margin-left: 36%; margin-top: 4%;">
							<form id="front_registration_form" role="form" method="POST" action="FRegisterCon">
						
								<div class="row">
									<div class="col-md-2">
										<div class="form-group">
											<!--<label style="color: #5f5f5f; font: bold 14px sans-serif;">Pet Owner ID</label>-->
											<input class="form-control hidden" type="text"
												id="user_id" name="user_id"
												value="${user_id}" readonly="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<div class="form-group">
											<label style="color: #5f5f5f; font: bold 14px sans-serif;">Title</label><em
												style="color: red;">*</em> <select
												class="form-control selectpicker" data-live-search="false"
												id="petOwner_title" name="petOwner_title">
												<option>Mr.</option>
												<option>Mrs.</option>
												<option>Ms.</option>
												<option>Miss.</option>
											</select>
										</div>
									</div>
										<div class="col-md-4">
										<div class="form-group">
											<label style="color: #5f5f5f; font: bold 14px sans-serif;">First_Name</label><em style="color: red;">*</em> <input
												class="form-control" type="text" id="petOwner_fname"
												name="first_name" required="" placeholder="First Name" />
										</div>
									</div>
									<div class=" form-group col-md-4"></div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label style="color: #5f5f5f; font: bold 14px sans-serif;">Last
												Name</label><em style="color: red;">*</em> <input
												class="form-control" type="text" id="petOwner_lname"
												name="last_name" required="" placeholder="Last Name" />
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label style="color: #5f5f5f; font: bold 14px sans-serif;">Gender</label><em
												style="color: red;">*</em>
											<div class="radio" style="margin-top: -1%;">
												<span id="spryradio1"> <label><input
														type="radio" name="gender" id="RadioGroup1_0"
														value="male" class="" /> Male</label><br /> <label><input
														type="radio" name=gender id="RadioGroup1_1"
														value="female" class="" /> Female</label><br /> <label
													for="petOwner_gender" class="error"
													style="margin-left: -20px;"></label>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label for="petOwner_email"
												style="color: #5f5f5f; font: bold 14px sans-serif;">Email</label><em
												style="color: red;">*</em> <input type="email"
												class="form-control" id="petOwner_email"
												name="email" required=""
												placeholder="abc@gmail.com" />
										</div>
									</div>
									<div class="col-lg-2">
										<div class="form-group">
											<label for="petOwner_nic"
												style="color: #5f5f5f; font: bold 14px sans-serif;">NIC</label><em
												style="color: red;">*</em> <input type="text"
												class=" gur new-empty form-control" id="user_nic"
												name="nic" required="" placeholder="123456789V"
												maxlength="10" required="required" />
										</div>
									</div>
									<div class="col-lg-3"></div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label for="petOwner_email"
												style="color: #5f5f5f; font: bold 14px sans-serif;">DOB</label><em
												style="color: red;">*</em>
											<div id="sandbox-container">
												<div class="input-group date">
													<input type="text" placeholder="YYYY-MM-DD" name="dob"
														id="dob" class="all form-control"
														value=""><span
														class="input-group-addon"><li class="glyphicon glyphicon-th"></li></span>
												</div>
												<label for="dob" class="error" id="doctor_bday-error"></label>
											</div>
										</div>
									</div>
								
									<div class="col-lg-3"></div>
								</div>
								<div class="row">
									<div class="col-lg-5">
										<div class="form-group">
											<label for="petOwner_address"
												style="color: #5f5f5f; font: bold 14px sans-serif;">Address</label><em
												style="color: red;">*</em>
											<textarea class="form-control" rows="5" id="address"
												name="address" 	placeholder="Enter the Address" required="required"></textarea>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
										<input class="form-control"	type="hidden" id="role" name="role" value="member"
												placeholder="City" />
										</div>
									</div>
									<div class="col-lg-3"></div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label style="color: #5f5f5f; font: bold 14px sans-serif;">Mobile
												Number</label><em style="color: red;">*</em> <input
												class="form-control" type="text" id="petOwner_mobile"
												name="mobile_number" required="" placeholder="Mobile" />
										</div>
									</div>
									
										<div class="col-lg-3">
									<div class="form-group">
										<div class="checkbox">
											<label><b>Marital Status</b></label><em style="color: red;">*</em></br> <label>
												<input class="uniform" type="radio" name="status"
												value="0"/>Single
											</label>
										</div>
										<div class="checkbox">
											<label> <input class="uniform" type="radio"
												name="status" value="1"/> Married
											</label>
										</div>
									</div>
								</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<button class="btn btn-primary btn-sm" 	type="submit">Register</button>
									</div>
									<div class="col-md-1">
										<input type="reset" class="btn btn-warning btn-sm"
											value="Reset" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- End Content -->




		<!-- Start Footer -->
		<footer>
			<%@include file="footer_front.jsp"%>
		</footer>
		<!-- End Footer -->

	</div>
	<!-- End Container -->

	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<div id="loader">
		<div class="spinner">
			<div class="dot1"></div>
			<div class="dot2"></div>
		</div>
	</div>

	<!-- Style Switcher -->
	<div class="switcher-box">
		<a href="#" class="open-switcher show-switcher"><i
			class="fa fa-cog fa-2x"></i></a>
		<h4>Style Switcher</h4>
		<span>12 Predefined Color Skins</span>
		<ul class="colors-list">
			<li><a onClick="setActiveStyleSheet('blue'); return false;"
				title="Blue" class="blue"></a></li>
			<li><a onClick="setActiveStyleSheet('sky-blue'); return false;"
				title="Sky Blue" class="sky-blue"></a></li>
			<li><a onClick="setActiveStyleSheet('cyan'); return false;"
				title="Cyan" class="cyan"></a></li>
			<li><a onClick="setActiveStyleSheet('jade'); return false;"
				title="Jade" class="jade"></a></li>
			<li><a onClick="setActiveStyleSheet('green'); return false;"
				title="Green" class="green"></a></li>
			<li><a onClick="setActiveStyleSheet('purple'); return false;"
				title="Purple" class="purple"></a></li>
			<li><a onClick="setActiveStyleSheet('pink'); return false;"
				title="Pink" class="pink"></a></li>
			<li><a onClick="setActiveStyleSheet('red'); return false;"
				title="Red" class="red"></a></li>
			<li><a onClick="setActiveStyleSheet('orange'); return false;"
				title="Orange" class="orange"></a></li>
			<li><a onClick="setActiveStyleSheet('yellow'); return false;"
				title="Yellow" class="yellow"></a></li>
			<li><a onClick="setActiveStyleSheet('peach'); return false;"
				title="Peach" class="peach"></a></li>
			<li><a onClick="setActiveStyleSheet('beige'); return false;"
				title="Biege" class="beige"></a></li>
		</ul>
		<span>Top Bar Color</span> <select id="topbar-style"
			class="topbar-style">
			<option value="1">Light (Default)</option>
			<option value="2">Dark</option>
			<option value="3">Color</option>
		</select> <span>Layout Style</span> <select id="layout-style"
			class="layout-style">
			<option value="1">Wide</option>
			<option value="2">Boxed</option>
		</select> <span>Patterns for Boxed Version</span>
		<ul class="bg-list">
			<li><a href="#" class="bg1"></a></li>
			<li><a href="#" class="bg2"></a></li>
			<li><a href="#" class="bg3"></a></li>
			<li><a href="#" class="bg4"></a></li>
			<li><a href="#" class="bg5"></a></li>
			<li><a href="#" class="bg6"></a></li>
			<li><a href="#" class="bg7"></a></li>
			<li><a href="#" class="bg8"></a></li>
			<li><a href="#" class="bg9"></a></li>
			<li><a href="#" class="bg10"></a></li>
			<li><a href="#" class="bg11"></a></li>
			<li><a href="#" class="bg12"></a></li>
			<li><a href="#" class="bg13"></a></li>
			<li><a href="#" class="bg14"></a></li>
		</ul>
	</div>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/modal_verticle.js"></script>
	<script src="assets/js/bootstrap-inputmask.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
	<script src="assets/js/validationInit.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
		<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>


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
		$(document).ready(function() {
						
							$(function() {
								formValidation();
							}); 
							$("#front_registration_form").submit(
											function(e) {
												e.preventDefault();
											 	if (!$("#front_registration_form").valid())
													return false; 
												 $("#processing_img").removeAttr("class", "hide");
								                    $("#processing_img").attr("class", "row");
												
												$.ajax({
															type : "POST",
															url : "FRegisterCon",
															data : $("#front_registration_form").serialize(),
															success : function(data) {
																if (data == 'true') {
																	 $("#processing_img").attr("class", "hide");
										                                $("#spnmessage_modal").removeAttr("class", "alert alert-danger");
										                                $("#spnmessage_modal").attr("class", "alert alert-success");
										                                $("#spnmessage_modal").html('<p><strong>Successfully Send the Email</strong></p>');
										                                $("#divmessage_modal").removeAttr("class", "hide");
										                                $("#divmessage_modal").fadeIn(1500);
										                                $("#divmessage_modal").delay(2500).fadeOut(1500);
																	swal(
																			{
																				title : "User Added !",
																				text : "Your credentials has been sent by a mail!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : false
																			},
																			function() {
																				window.location = "FRegisterCon?action=insert";
																			});
																} else {
																	  $("#processing_img").attr("class", "hide");
										                                $("#spnmessage_modal").removeAttr("class", "alert alert-success");
										                                $("#spnmessage_modal").attr("class", "alert alert-danger");
										                                $("#spnmessage_modal").html('<p><strong>Email not send check your internet connection </strong></p>');
										                                $("#divmessage_modal").removeAttr("class", "hide");
										                                $("#divmessage_modal").fadeIn(1500);
										                                $("#divmessage_modal").delay(2500).fadeOut(1500);
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