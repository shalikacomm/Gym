<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<%@page import="com.bit.entity.UserEntity" %>
<!-- BEGIN HEAD -->
<head>
<link rel="stylesheet" href="assets/css/login.css" />
     <meta charset="UTF-8" />
    <title> Login Page</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
     <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <!-- GLOBAL STYLES -->
     <!-- PAGE LEVEL STYLES -->
     <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/login.css" />
    <link rel="stylesheet" href="assets/plugins/magic/magic.css" />
     <!-- END PAGE LEVEL STYLES -->
   <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
    <!-- END HEAD -->

    <!-- BEGIN BODY -->
<!-- <body background=""> -->
<body BACKGROUND="${pageContext.request.contextPath}/assets_front/images/login_wall.jpg"/>
   <!-- PAGE CONTENT --> 
    <div class="container">
    <div class="text-center">
       <!--  <img src="assets/img/logo.jpg" /> -->
    </div>
    <div class="tab-content">
        <div id="login" class="tab-pane active">
            <form action="LoginCon?action=login" method="post" class="form-signin" id="LoginForm
            
             ">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">
                    Enter your Username and Password
                </p>
       
                <input type="text" placeholder="Enter your Username" name="nic" class="form-control" />
                <input type="password" placeholder="Password" name="password" class="form-control" />
              <button class="btn text-muted text-center btn-danger subClick" type="submit">Sign in</button>
            
                           <% UserEntity currentUser = (UserEntity) (session.getAttribute("InvalidUser"));
                        if (currentUser != null) {
                    %>                                     
<span class="text-danger">User Details are not found!</span>
                    <%}%>
</form>
                </div>
                  <div id="forgot" class="tab-pane">
            <form action="LoginCon?action=reset" method="post" class="form-signin">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">Enter your valid e-mail</p>
                <input type="email"  required="required" name="resetEmail" placeholder="Your E-mail"  class="form-control" />
                <br />
                <button class="btn text-muted text-center btn-success" type="submit">Recover Password</button>
            </form>
        </div>
            
        </div>
        <div class="text-center">
        <ul class="list-inline" style="color: #fff;">
            <li><a class="text-muted" href="FRegisterCon?action=insert" ><font color="blue">Register</font></a></li>
            <li><a class="text-muted" href="#forgot" data-toggle="tab"><font color="#f4b342">Forgot Password</font></a></li>
                </ul>
    </div>
    </div>
   


	  <!--END PAGE CONTENT -->     
	      
      <!-- PAGE LEVEL SCRIPTS -->
      <script src="assets/plugins/jquery-2.0.3.min.js"></script>
      <script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
   <script src="assets/js/login.js"></script>
      <!--END PAGE LEVEL SCRIPTS -->
<script>
		$(document).ready(function() {
							$(function() {
								formValidation();
							});
							$("#memPaymentForm").submit(function(e) {
												e.preventDefault();
												if (!$("#memPaymentForm").valid())
													return false;
											var username =	$("#mem_id").val();
												swal(
														{
															title : "Are you sure?",
															text : "Your payment will be added to "+username+ " account",
															type : "warning",
															showCancelButton : true,
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "Yes, Proceed!",
															cancelButtonText : "No, cancel!",
															closeOnConfirm : true,
															closeOnCancel : true
														},
														function(isConfirm) {
															if (isConfirm) {
																$.ajax({
																			type : "POST",
																			url : "MemberFeeCon",
																			data : $("#memPaymentForm").serialize(),
																			success : function(
																					data) {
																				if (data == 'true') {
																					swal(
																							{
																								title : "",
																								text : "You membership has been updated",
																								type : "success",
																								showCancelButton : false,
																								confirmButtonColor : "#DD6B55",
																								confirmButtonText : "OK!",
																								closeOnConfirm : true
																							},
																							function() {
																								 window.location = "MemberFeeCon?action=list";
																								

																							});
																				} else {
																					swal(
																							"Data not saved!",
																							"Please contact administrator!",
																							"error");
																				}
																			}

																		});
															} else {
																swal(
																		"Cancelled",
																		"Your Transaction details are removed:)",
																		"error");
															}
														});

											});
						});
	</script>
</body>

    <!-- END BODY -->
</html>
