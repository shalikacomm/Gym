<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Exercises</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
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
  <li><a href="ExerciseCon?action=insert">Add Execise</a></li>
    </ul>

		<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<form id="exerciseForm" class="form-horizontal" align="center"
								novalidate>
								</br>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label class="control-label col-md-5" style="float: right;">Exercise
												ID</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="exe_id" name="exercise_id"
												readonly="readonly" class="form-control"
												value="${exer_id}<c:out value="${exerciseObj.exercise_id}" />" />
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
											<input type="text" id="desc" name="desc"
												placeholder="Exercise description" class="form-control"
												value="<c:out value="${exerciseObj.description}" />" />
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
													value="Save" class="btn-success btn-sm" type="submit">
												<input id="btn_reset" value="Reset"
													class="btn-warning btn-sm " type="reset" /> <a
													class="btn-primary btn-sm"
													href="ExerciseCon?action=list">Cancel</a>
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
<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script> 
		<script src="assets/js/validationInit.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(function() {
								formValidation();
							});
							$("#exerciseForm").submit(
											function(e) {
												e.preventDefault();
												if (!$("#exerciseForm").valid())
													return false;
												$.ajax({
															type : "POST",
															url : "ExerciseCon",
															data : $(
																	"#exerciseForm")
																	.serialize(),
															success : function(
																	data) {
																if (data == 'true') {
																	swal(
																			{
																				title : "New Exercise Added!",
																				text : "You created a new Exercise!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : false
																			},
																			function() {
																				
																				window.location = "ExerciseCon?action=insert";
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