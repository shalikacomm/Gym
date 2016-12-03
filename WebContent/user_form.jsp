<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<style>
.popover-title {
    background-color: #df6262;
    color: #FFFFFF;
    font-size: 12px;
    text-align:;
}
</style>

<!-- END PAGE LEVEL  STYLES -->

<link rel="stylesheet" href="assets/css/sweetalert.css" />

<!-- END PAGE LEVEL  STYLES -->

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px; margin-top:1%;">
<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="UserCon?action=insert">Add Users</a></li>
    </ul>

				<div class="panel panel-default">
					<div class="panel-heading">User Registration</div>
					<div class="panel-body">
						<form role="form" id="userForm" action="UserCon" method="POST">
					<div class="row">
															<div class="col-lg-12 col-md-12 col-sm-12">
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-md-6 col-sm-6 hide"
																			id="divmessage_modal">
																			<div style="margin-left:10%; width: 80%; padding: 10px;"
																				id="spnmessage_modal" class="alert alert-success"
																				role="alert"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<div class="row hide" id="processing_img">
															<div class="col-md-4"></div>
															<div class="col-md-6">
																<img
																	src="${pageContext.request.contextPath}/assets/img/processing.gif" />
															</div>
														</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label> User ID </label> <input class="form-control"
											name="user_id" value="${user_id }<c:out value="${userObject.user_id}" />" readonly="readonly" />
									</div>
								</div>
							</div>
							<div class="row">
														
								<div class="col-sm-3">
									<div class="form-group">
										<label> First Name</label><em style="color: red;">*</em> <input id="first_name" value="<c:out value="${userObject.first_name}" />"
											name="first_name" class="form-control no_space"  />

									</div>
								</div>
								<div class="col-sm-5">
									<div class="form-group">
										<label> Last Name</label><em style="color: red;">*</em> <input
											name="last_name" class="form-control no_space" value="<c:out value="${userObject.last_name}" />"/>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Email</label><em style="color: red;">*</em> <input
											name="email" class="form-control no_space" value="<c:out value="${userObject.email}" />"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2">
									<div class="form-group">
										<label> NIC</label><em style="color: red;">*</em> <input
											name="nic" type="text" class=" gur new-empty form-control no_space"
											id="member_nic" name="nic" placeholder="123456789V"
											maxlength="10" title="Insert a Valid NIC" value="<c:out value="${userObject.nic}" />"/>
									</div>
								</div>
								<div class="col-sm-3">

									<div class="form-group">
										<label for="date_of_birth" style="margin-left: 0%;">Date
											of Birth</label><em style="color: red;">*</em>
										<div id="sandbox-container">
											<div class="input-group date">
												<input type="text" placeholder="YYYY-MM-DD" name="dob"
													id="dob" class="all form-control" value="<c:out value="${userObject.dob}" />"><span
													class="input-group-addon"><li class= "glyphicon glyphicon-th"></li></span>
											</div>
											<label for="dob" class="error" id="doctor_bday-error"></label>
										</div>
									</div>

								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label>Mobile No.</label><em style="color: red;">*</em> <input
											name="mobile_number" class="form-control"  maxlength="10" value="<c:out value="${userObject.mobile_number}" />"/>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<div class="checkbox">
											<label><b>Gender</b></label><em style="color: red;">*</em></br> <label>
												<input class="uniform" type="radio" name="gender"
												value="male" ${userObject.gender=='male'?'checked':''} />Male
											</label>
										</div>
										<div class="checkbox">
											<label> <input class="uniform" type="radio"
												name="gender" value="female" ${userObject.gender=='female'?'checked':''} /> Female
											</label>
											</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Address</label>
										<textarea class="form-control" id="address_perm" placeHolder="Enter your address"
											name="address" cols="20" rows=""><c:out value="${userObject.address}" /></textarea>
									</div>
								</div>

							</div>
							<div class="row">
							
								<div class="col-sm-2">
									<div class="form-group">
										<div class="checkbox">
											<label><b>Marital Status</b></label><em style="color: red;">*</em></br> <label>
												<input class="uniform" type="radio" name="status"
												value="0" ${userObject.marital_status== '0' ?'checked':''} />Single
											</label>
										</div>
										<div class="checkbox">
											<label> <input class="uniform" type="radio"
												name="status" value="1" ${userObject.marital_status== '1' ?'checked':''}/> Married
											</label>
										</div>
									</div>
								</div>
							
							
							
								<div class = "row">
								<div class="col-sm-2">
								
									<div class="form-group">
										<label>User Role</label><em style="color: red;">*</em>
										
										<% String role=currentUser.getRole();
										if(role.equals("administrator")) { %>
										 <select
											name="role" class="form-control" id="user_type"
											name="user_type">
											<option value = "administrator">Administrator</option>
											<option value ="instructor">Instructor</option>
											<option selected value = "member">Member</option>
											<option value = "operator">Operator</option>
										</select>
										<%} else if(role.equals("operator")){ %>
										<input readonly="readonly"  class="form-control" value="member" type="text" name="user_type">
										<%} %>
									</div>
									</div></div>
									<div class="col-sm-12">
									<div class="col-sm-2" style="float:right;">
										<div class="form-group">
											<input type="submit" value="Save"
												class="btn btn-success btn-sm " />
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
<!-- 
<script>
$('.no_space').on('keypress', function(e) {
    if (e.which == 32)
    	$(this).popover({
	          //  title: 'Warning!',
            title: 'Please enter no spaces',
            placement: 'bottom',
            color: '#df6262'
        }).popover('show');
       
});
</script>

 -->

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
												 $("#processing_img").removeAttr("class", "hide");
								                    $("#processing_img").attr("class", "row");
												
												$.ajax({
															type : "POST",
															url : "UserCon",
															data : $(
																	"#userForm")
																	.serialize(),
															success : function(
																	data) {
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
																				<% String role2=currentUser.getRole();
																				if(role2.equals("administrator")) { %>
																				window.location = "UserCon?action=list";
																				<%}else{%>
																				window.location = "UserCon?action=member_list";
																				<%} %>
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

	<!--END PAGE LEVEL SCRIPT date picker-->
</body>
</html>
