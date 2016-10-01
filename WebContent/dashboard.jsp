<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>

<!-- tiles styles  -->


<!-- BOOTSTRAP STYLES-->

    <link href="assets/assets_tiles/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/assets_tiles/css/font-awesome.css" rel="stylesheet" />

        <!-- CUSTOM STYLES-->
    <link href="assets/assets_tiles/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


 <!-- JQUERY SCRIPTS -->
    <script src="assets/assets_tiles/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/assets_tiles/js/custom.js"></script>


<!-- tiles styles  -->
 <link href="assets/bootstrap-notify-master/animate.css" rel="stylesheet" />
 <!-- this is for notifications -->
<style>
            /*@import url(http://fonts.googleapis.com/css?family=Old+Standard+TT:400,700);*/
            [data-notify="container"][class*="alert-pastel-"] {
                background-color: rgb(255, 255, 238);
                border-width: 0px;
                border-left: 15px solid rgb(255, 240, 106);
                border-radius: 0px;
                box-shadow: 0px 0px 5px rgba(51, 51, 51, 0.3);
                font-family: 'Old Standard TT', serif;
                letter-spacing: 1px;
            }
            [data-notify="container"].alert-pastel-info {
                border-left-color: rgb(255, 179, 40);
            }
            [data-notify="container"].alert-pastel-danger {
                border-left-color: rgb(255, 103, 76);
            }
            [data-notify="container"][class*="alert-pastel-"] > [data-notify="title"] {
                color: rgb(80, 80, 57);
                display: block;
                font-weight: 700;
                margin-bottom: 5px;
            }
            [data-notify="container"][class*="alert-pastel-"] > [data-notify="message"] {
                font-weight: 400;
            }
        </style>
 <!-- this is for notifications end -->
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
	
			 <!-- /. NAV SIDE  -->
     <!--  files tika daaapaLA  <div id="page-wrapper" >
            <div id="page-inner">
      -->           <div class="row">
                    <div class="col-lg-12">
                     <h2 style="padding-top: 3px;"><strong>ADMIN DASHBOARD</strong></h2>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>Welcome ${currentSessionUser.first_name }! </strong> You Have No pending Task For Today.
                        </div>
                       
                    </div>
                    </div>
                  <!-- /. ROW  --> 
                            <div class="row text-center pad-top" style="margin-left: 200px;">
              <!--     <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="blank.html" >
 <i class="fa fa-circle-o-notch fa-5x"></i>
                      <h4>Check Data</h4>
                      </a>
                      </div>
                     
                     
                  </div>  -->
          
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="MemberCon?action=insert" >
 <i class="fa fa fa-user fa-5x"></i>
                      <h4>Reg. Member</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="UserCon?action=list" >
 <i class=" fa fa-users fa-5x"></i>
                      <h4>Manage Users</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="blank.html" >
 <i class="fa fa-thumbs-o-down fa-5x"></i>
                      <h4>Deactivated</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="MemberFeeCon?action=insert" >
 <i class="fa fa-money  fa-5x"></i>
                      <h4>Payables</h4>
                      </a>
                      </div>
                     
                     
                  </div>
              </div>
                 <!-- /. ROW  --> 
                <div class="row text-center pad-top" style="margin-left: 200px;">
                 
          
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="ProductCon?action=list" >
 <i class="fa fa-spoon fa-5x"></i>
                      <h4>Products</h4>
                      </a>
                      </div>
                     
                 
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="blank.html" >
 <i class="fa fa-bell-o fa-5x"></i>
                      <h4>Notifications </h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="InvoiceCon?action=insert" >
 <i class="fa fa-globe  fa-5x"></i>
<!--  <i class="fa fa-user fa-5x"></i> -->
                      <h4>Sell Products</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                     <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="StockCon?action=insert" >
 <i class="glyphicon glyphicon-cutlery fa-4x"></i>
                      <h4>Add Inventory</h4>
                      </a>
                      </div>
                     
                     
                  </div> 
              </div>   
                  <!-- /. ROW  -->    
                 <div class="row text-center pad-top" style="margin-left: 200px;">
                   
          
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="UserCon?action=insert" >
                          
 <i class="fa fa-graduation-cap fa-5x"></i>
                      <h4>Add Users</h4>
                      </a>
                      </div>
                        
                  </div>
                  
                   
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="InvoiceCon?action=invoice_list" >
 <i class="fa fa-file-text fa-5x"></i>
                      <h4>Receipts</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="blank.html" >
 <i class="fa fa-key fa-5x"></i>
                      <h4>Admin </h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="SystemCon?action=list" >
 <i class="fa fa-cog fa-4x"></i>
                      <h4>System Settings</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                    
              </div>
                 <!-- /. ROW  -->  
          
				  <div class="row">
                    <div class="col-lg-12 ">
					<br/>
                        
                    </div>
                    </div>
                  <!-- /. ROW  --> 
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
			
			
			</div>
		</div>

		<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>
	<script src="assets/bootstrap-notify-master/bootstrap-notify.min.js"></script>
	
	<!-- <script>
            $(document).ready(function () {

                var jqXHR = $.ajax({
                    type: "POST",
                    url: "<?php echo base_url(); ?>index.php/doctor/getTodayAppointmentsNotify",
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        if (data.record_1 === 'YES') {
                            if (data.rec !== "") {

                                $.each(data.rec, function (i, obj) {
                                    $.notify({
                                        // options
//                                    icon: 'glyphicon glyphicon-warning-sign',
                                        title: 'Appointments:',
                                        message: 'You have ' + obj.number_count + ' appointments on ' + obj.session + '&nbsp;session',
                                        url: '<?php echo base_url(); ?>index.php/appointments/view_calendar',
                                        target: '_self'
                                    }, {
                                        // settings
                                        type: 'pastel-warning',
                                        delay: 2000,
                                        timer: 5000,
//                                    animate: {
//                                        enter: 'animated fadeInDown',
//                                        exit: 'animated fadeOutUp'
//                                    }
                                        placement: {
                                            from: "top",
                                            align: "right"
                                        },
                                    }
                                    );

                                });
                            } else {
                                $.notify({
                                    // options
//                                    icon: 'glyphicon glyphicon-warning-sign',
                                    title: 'Bootstrap notify',
                                    message: 'You have no appointments Today',
                                    url: '<?php echo base_url(); ?>index.php/appointments/petOwnerBookAppointments',
                                    target: '_self'
                                }, {
                                    // settings
                                    type: 'pastel-warning',
                                    delay: 2000,
                                    timer: 5000,
//                                    animate: {
//                                        enter: 'animated fadeInDown',
//                                        exit: 'animated fadeOutUp'
//                                    }
                                }
                                );
                            }
                        }
                    }
                });
            });
        </script> -->
	

</body>
</html>