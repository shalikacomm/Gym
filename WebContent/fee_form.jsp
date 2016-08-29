<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Monthly Fee</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->


<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />

<link rel="stylesheet" href="assets/css/sweetalert.css" />
<link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css"
 />

<!-- END PAGE LEVEL  STYLES -->
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

				<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<header>
							<div class="icons">
								<i class="icon-glass"></i>
							</div>
							<h5>Monthly fee</h5>
							</header>

							<form id="feeForm" class="form-horizontal" align="center"
								novalidate>


								</br>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label class="control-label col-md-5" style="float: right;">Fee ID
												</label>
										</div>
										<div class="col-md-2">
											<input type="text" id="fee_id" name="fee_id"
												readonly="readonly" class="form-control"
												value="${fee_id}<c:out value="${feeobj.feeID}" />" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="limiter" class="control-label col-md-5"
												style="float: right;">Monthly Fee</label>
										</div>
										<div class="col-md-2">
											<input type="text" id="fee" name="fee" style="text-align:right"
												placeholder="Monthly Fee" class="form-control"
												value="<c:out value="${productobj.description}" />" />
										</div>
									</div>
								</div>
					<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div style="margin-left: -60%;">
												<input style="left: 118%; width: 7%;" id="btn_save"
													value="Save" class="btn btn-success btn-sm " type="submit">
												<input id="btn_reset" value="Reset"
													class="btn btn-warning btn-sm " type="reset" /> <a
													class="btn btn-primary btn-sm"
													href="ProductCon?action=list">Cancel</a>
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
	</div>

	<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>



	<!-- PAGE LEVEL SCRIPT-->
	<script src="assets/js/jquery-ui.min.js"></script>
	
	<!-- <script
		src="assets/plugins/datepicker/js/bootstrap-datepicker.en-GB.min.js"></script>
 -->
	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>

	<script src="assets/js/validationInit.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
	$(document).ready(function(){
		$()
		
	});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
							$(function() {
								formValidation();
							});
							$("#feeForm").submit(
											function(e) {
												//alert("jhghh");;
												e.preventDefault();
												if (!$("#feeForm").valid())
													return false;
												$.ajax({
															type : "POST",
															url : "FeeCon",
															data : $(
																	"#feeForm")
																	.serialize(),
															success : function(
																	data) {
																if (data == true) {
																	swal(
																			{
																				title : "New Fee Added",
																				text : "This will be your current Fee!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : false
																			},
																			function() {
																				window.location = "FeeCon?action=list";
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
	<script>
		
	</script>
	<!--END PAGE LEVEL SCRIPT-->

</body>
</html>