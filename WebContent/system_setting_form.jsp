<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>System Setting Form</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
					<div class="inner" style="margin-top:1%;"> 	
	<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="ExerciseCon?action=insert">System Settings</a></li>
    </ul>

		<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<header>
							<div class="icons">
								<i class="icon-cogs"></i>
							</div>
							<h5>Enter System Settings</h5>
							</header>

							<form id="systemSetForm" class="form-horizontal" align="center"
								novalidate>


								</br>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label class="control-label col-md-5" style="float: right;">Setting ID</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="set_id" name="set_id"
												readonly="readonly" class="form-control"
												value="${set_id}<c:out value="${settings.set_id}" />" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="limiter" class="control-label col-md-5"
												style="float: right;">Description</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="desc" name="description" readonly="readonly"
												placeholder="Product description" class="form-control"
												value="<c:out value="${settings.description}" />" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Value</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="p_price" name="value"
												placeholder="Purchase Price" class="form-control"
												value="<c:out value="${settings.value}" />" />
										</div>


									</div>
								</div>
					
								<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-3"></div>
										<div class="col-sm-6">
											<div>
												<input id="btn_save"
													value="Save" class="btn-success btn-sm " type="submit">
												<input id="btn_reset" value="Reset"
													class="btn-warning btn-sm" type="reset" /> <a
													class="btn-primary btn-sm"
													href="SystemCon?action=list">Cancel</a>
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

	<%@include file="footer.jsp"%>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
							$(function() {
								//formValidation();
							});
							$("#systemSetForm").submit(
											function(e) {
												e.preventDefault();
												/* if (!$("#systemSetForm").valid())
													return false; */
												$.ajax({
															type : "POST",
															url : "SystemCon",
															data : $(
																	"#systemSetForm")
																	.serialize(),
															success : function(
																	data) {
																if (data == 'true') {
																	swal(
																			{
																				title : "",
																				text : "Your system setting updated!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : false
																			},
																			function() {
																				window.location = "SystemCon?action=list";
																			});
																} else {
																	swal(
																			"",
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