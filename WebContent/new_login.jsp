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
            <form action="LoginCon?action=passwordChange" method="post" class="form-signin">
                 <p class="text-muted text-center btn-block btn btn-primary btn-rect">User Password Change</p>
                 <input type="text" placeholder="Username" class="form-control" name ="username"readonly="readonly" value="${freshUser.nic}" />
                <input type="password" placeholder="password" class="form-control" name="password"/>
                <input type="password" placeholder="Re type password" class="form-control" name ="re_password"/>
                <button class="btn text-muted text-center btn-success" type="submit">Change Password</button>
            </form>

                </div>
                    </div>
    
    </div>
   


	  <!--END PAGE CONTENT -->     
	      
      <!-- PAGE LEVEL SCRIPTS -->
      <script src="assets/plugins/jquery-2.0.3.min.js"></script>
      <script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
   <script src="assets/js/login.js"></script>
      <!--END PAGE LEVEL SCRIPTS -->

</body>
    <!-- END BODY -->
</html>
