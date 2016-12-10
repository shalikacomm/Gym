
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
 <link rel='stylesheet' href='assets/fullcalendar-3.0.0/fullcalendar-3.0.0/calendar_css.css' />
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
						<h2 style="text-transform: none;">Members Attendance Form...</h2>
						<p style="font-weight: bold; color: #8A5497;"></p>
					</div>
					<div class="col-md-6">
						<ul class="breadcrumbs">
							<li><a href="index_front.jsp">Home</a></li>
							<li>Attendance</li>
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
					style="background-image: url('<?php echo base_url(); ?>/admin_assets/img/petowner_bg_img1.jpg'); background-size: 33% 90%; margin-left:-10%; background-repeat: no-repeat;">

					  <div class="row">
                        <div class="col-lg-12">

                            <div class="box">
                           
                                <div class="body">
                                <div class="row inv_row" id="row" style="margin-left: 0%;">
							
								</div>
                                
                                    <div class="">
                                        <input class="form-control" value="${user_id}" type="hidden" id="user_id" name="petOwner_id" readonly="" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12"><br/><br/>
                                            <div id='calendar'></div>
                                        </div>
                                    </div>
                                </div>


                            </div>

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
<script src ="assets/fullcalendar-3.0.0/fullcalendar-3.0.0/calendar_moment.min.js"></script>
	
<script src ="assets/fullcalendar-3.0.0/fullcalendar-3.0.0/calendar_fullcalendar.min.js"></script>
	

	<script>

            $(document).ready(function () {
            	
                 	//	 $('#calendar').refresh();
                var user_id = $('#user_id').val();
               
                $('#calendar').fullCalendar( 'refetchEvents' );
                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,basicWeek,basicDay'
                    },
//                    defaultDate: '2016-09-12',
                    navLinks: true, // can click day/week names to navigate views
                    editable: false,
                    eventLimit: true, // allow "more" link when too many events
                    events: 'AttenCon?action=getFrontMemAttendance&user_id='+user_id,
          
                
                });
       
            	
            	
                       });

        </script>

	
	
</body>
</html>