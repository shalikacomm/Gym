
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
</head>
<body>

	<!-- Container -->
	<div id="container">

		<!-- Start Header -->
		<div class="hidden-header"></div>
		<header class="clearfix">

			<!-- Start Top Bar -->
			<div class="top-bar">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<!-- Start Contact Info -->
							<ul class="contact-details">
								<li><a href="#"><i class="fa fa-map-marker"></i> No
										03,Sesatha Bulding,Kaduwela,Sri lanka</a></li>
								<li><a
									href="https://www.facebook.com/www.fitfunhc.lk/?fref=ts#"><i
										class="fa fa-envelope-o"></i>@www.fitfunhc.lk</a></li>
								<li><a href="#"><i class="fa fa-phone"></i> +94 71 284
										0229</a></li>
							</ul>
							<!-- End Contact Info -->
						</div>
						<div class="col-md-6">
							<!-- Start Social Links -->
							<ul class="social-list">
								<li><a class="facebook itl-tooltip" data-placement="bottom"
									title="Facebook" href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter itl-tooltip" data-placement="bottom"
									title="Twitter" href="#"><i class="fa fa-twitter"></i></a></li>

								<li><a class="instgram itl-tooltip" data-placement="bottom"
									title="Instagram" href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li><a class="vimeo itl-tooltip" data-placement="bottom"
									title="vimeo" href="#"><i class="fa fa-vimeo-square"></i></a></li>
								<li><a class="skype itl-tooltip" data-placement="bottom"
									title="Skype" href="#"><i class="fa fa-skype"></i></a></li>
							</ul>
							<!-- End Social Links -->
						</div>
					</div>
				</div>
			</div>
			<!-- End Top Bar -->

			<!-- Start Header ( Logo & Naviagtion ) -->
			<div class="navbar navbar-default navbar-top">
				<div class="container">
					<div class="navbar-header">
						<!-- Stat Toggle Nav Link For Mobiles -->
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
						<!-- End Toggle Nav Link For Mobiles -->
						<a class="navbar-brand" href="index.html"><img alt=""
							src="assets_front/images/margo.png"
							style="width: 140px; margin-top: -27px; height: 67px;"></a>
					</div>
					<div class="navbar-collapse collapse">
						<!-- Stat Search -->
						<div class="search-side">
							<a href="#" class="show-search"><i class="fa fa-search"></i></a>
							<div class="search-form">
								<form autocomplete="off" role="search" method="get"
									class="searchform" action="#">
									<input type="text" value="" name="s" id="s"
										placeholder="Search the site...">
								</form>
							</div>
						</div>
						<!-- End Search -->
						<!-- Start Navigation List -->
						<ul class="nav navbar-nav navbar-right">
							<li><a href="index_front.jsp">Home</a>
								
								</li>
							<li><a  href="login.jsp">LogIn</a>
								</li>
							<li><a href="exercise_front.jsp">Exercise</a>
							
								</li>
							<li><a href="nutrition_front.jsp">Nutrition</a>
							</li>
							<li><a class="active" href="team_front.jsp">Team</a>
								</li>
							<li><a href="contact_front.jsp">Contact Us</a></li>
						</ul>
						<!-- End Navigation List -->
					</div>
				</div>
			</div>
			<!-- End Header ( Logo & Naviagtion ) -->

		</header>
		<!-- End Header -->
		  <!-- Start Page Banner -->
     <div class="page-banner" >;
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <h2 style=" text-transform: none;">Members Application Form...</h2>
                            <p style="font-weight: bold; color: #8A5497;">The Best Care for you Pet..</p>
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
                    <div class="page-content" style="background-image: url('<?php echo base_url(); ?>/admin_assets/img/petowner_bg_img1.jpg'); background-size: 33% 90%; margin-left:-10%; background-repeat: no-repeat;">

                        <!--Registration form start-->
                        <div class="row" >
                            <div class="col-lg-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3" style="margin-left:36%; margin-top: 4%;">
                                <form id="petOwner_registration_form" role="form" method="POST" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <!--<label style="color: #5f5f5f; font: bold 14px sans-serif;">Pet Owner ID</label>-->
                                                <input class="form-control hidden" type="text" id="petOwner_id" name="petOwner_id"  value="<?php echo $petOwner_id; ?>" readonly=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Title</label><em style=" color: red;">*</em>
                                                <select class="form-control" id="petOwner_title" name="petOwner_title">
                                                    <option>Mr.</option>
                                                    <option>Mrs.</option>
                                                    <option>Ms.</option>
                                                    <option>Miss.</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Initials</label>
                                                <input class="form-control" type="text" id="petOwner_initials" name="petOwner_initials" placeholder="Initials" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">First Name</label><em style=" color: red;">*</em>
                                                <input class="form-control" type="text" id="petOwner_fname" name="petOwner_fname" placeholder="First Name"/>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Last Name</label><em style=" color: red;">*</em>
                                                <input class="form-control" type="text" id="petOwner_lname" name="petOwner_lname" placeholder="Last Name"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Gender</label><em style=" color: red;">*</em>
                                                <div class="radio" style="margin-top: -1%;">
                                                    <span id="spryradio1">
                                                        <label><input type="radio" name="petOwner_gender" id="RadioGroup1_0" value="Male" class="" /> Male</label><br/>
                                                        <label><input type="radio" name="petOwner_gender" id="RadioGroup1_1" value="Female" class=""/> Female</label><br/>
                                                        <label for="petOwner_gender" class="error" style="margin-left: -20px;"></label>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Number of Pets</label><em style=" color: red;">*</em>
                                                <input class="form-control" type="text" id="petOwner_Numb_of_pets" name="petOwner_Numb_of_pets" placeholder="Number of Pets"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="petOwner_email" style="color: #5f5f5f; font: bold 14px sans-serif;">Email</label><em style="color: red;">*</em>
                                                <input type="email" class="form-control" id="petOwner_email" name="petOwner_email" placeholder="abc@gmail.com" />
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label for="petOwner_nic" style="color: #5f5f5f; font: bold 14px sans-serif;">NIC</label><em style=" color: red;">*</em>
                                                <input type="text" class=" gur new-empty form-control" id="petOwner_nic" name="petOwner_nic" placeholder="123456789V" maxlength="10" pattern="([0-9]{9}[VXvx])" title="Insert a Valid NIC" required="required" />
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <div class="form-group">
                                                <label for="petOwner_address" style="color: #5f5f5f; font: bold 14px sans-serif;">Address</label><em style=" color: red;">*</em>
                                                <textarea class="form-control" rows="5" id="petOwner_address" name="petOwner_address" placeholder="Enter the Address" required="required" ></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">City</label><em style=" color: red;">*</em>
                                                <input class="form-control" type="text" id="petOwner_city" name="petOwner_city" placeholder="City" />
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Mobile Number</label><em style=" color: red;">*</em>
                                                <input class="form-control" type="text" id="petOwner_mobile" name="petOwner_mobile" placeholder="Mobile" />
                                            </div>
                                            <div class="form-group">
                                                <label style="color: #5f5f5f; font: bold 14px sans-serif;">Telephone Number</label><em style=" color: red;">*</em>
                                                <input class="form-control" type="text" id="petOwner_tele" name="petOwner_tele" placeholder="Telephone" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#petOwnerRegModal">
                                                Register
                                            </button>
                                        </div>
                                        <div class="col-md-1">
                                            <input type="reset" class="btn btn-warning btn-sm" value="Reset" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Modal -->
                        <!--                        <div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                                <h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
                                                            </div>
                                                        </div> /.modal-content
                                                    </div> /.modal-dialog
                                                </div> /.modal -->


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

</body>
</html>