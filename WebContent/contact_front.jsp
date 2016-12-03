
<!doctype html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><html lang="en" class="no-js"> <![endif]-->
<html lang="en">
<head>

<!-- Basic -->
<title>FIT & FUN HEALTH CLUB | Nutrition</title>

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


<div id="container">

		<!-- Start Header -->
		<%@include file="header_front.jsp"%>
		<!-- End Header -->
		<!-- Start Page Banner -->
		 <div class="page-banner"
			style="padding: 40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
			<div class="container">
		    <div class="col-md-8" style="margin-top:-2%; margin-left:-3%; margin-bottom:1%;">
            <h2>Learn More About Us</h2>
             </div>
             <div class="col-md-4" style="margin-top:-3%;">
            <ul class="breadcrumbs">
             <li><a href="index_front.jsp">Home</a></li>
              <li><a href="contact_front.jsp">About Us</a></li>
            
            </ul>
          </div>
        <div class="row">
        
        <img src="${pageContext.request.contextPath}/assets_front/images/about_us.jpg" alt="" width="150%"  style="margin-left:-15%; margin-bottom:-4%; max-width: 130%; max-height:80%;"/>
        
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
			
			<div class="col-md-8">
				
				<!-- Classic Heading -->
				<h4 class="classic-title"><span>Contact Us</span></h4>
				
				<!-- Start Contact Form -->
    <form role="form" class="contact-form" id="contact-form" method="post">
    <div class="form-group">
    <div class="controls">
    <input type="text" placeholder="Name" name="name">
    </div>
    </div>
    <div class="form-group">
    <div class="controls">
    <input type="email" class="email" placeholder="Email" name="email">
    </div>
    </div>
    <div class="form-group">
    <div class="controls">
    <input type="text" class="requiredField" placeholder="Subject" name="subject">
    </div>
    </div>

    <div class="form-group">

    <div class="controls">
    <textarea rows="7"  placeholder="Message" name="message"></textarea>
    </div>
    </div>
    <button type="submit" id="submit" class="btn-system btn-large">Send</button><div id="success" style="color:#34495e;"></div>
    </form>
				<!-- End Contact Form -->
				
			</div>
			
			<div class="col-md-4">
				
				<!-- Classic Heading -->
				<h3 class="classic-title"><span>Information</span></h3>
				
				<!-- Some Info -->
				<p style="font-size:18px; font-face:Trebutch MS; color:#f36510;">The commen  of the Gym by Mr. Amarasekarage Don Sandun Salitha on 
09.11.2014.  FIT AND FUN HEALTH CLUB (pvt)  Ltd  located  in Kaduwela.  They 
operate in similar health clubs around Sri Lanka like Kotikawatta, Anuradhapura. 
Its main focus is to provide good health care practices to the society.
They have mainly 02 qualified Coaches at Kaduwela Health club, which they 
available at day and night to provide a good service to its community.</p>
				
				<!-- Divider -->
				<div class="hr1" style="margin-bottom:10px;"></div>
				
				<!-- Info - Icons List -->
				<ul class="icons-list">
					<li style="font-size:16px; font-face:Trebutch MS;"><i class="fa fa-globe">  </i> <strong>Address:</strong>  No 03,Sesatha Bulding,Kaduwela,Sri lanka.</li>
					<li style="font-size:16px; font-face:Trebutch MS;"><i class="fa fa-envelope-o"></i> <strong>Email:</strong> fitandfunmessenger@gmail.com</li>
					<li style="font-size:16px; font-face:Trebutch MS;"><i class="fa fa-mobile"></i> <strong>Phone:</strong>  +94 71 2840229</li>
				</ul>
				
				<!-- Divider -->
				<div class="hr1" style="margin-bottom:15px;"></div>
				
				<!-- Classic Heading -->
				<h4 class="classic-title"><span>Working Hours</span></h4>
				
				<!-- Info - List -->
				<ul class="list-unstyled">
					<li style="font-size:16px; font-face:Trebutch MS;"><strong>Monday - Friday[except on poya days]</strong>- 9am to 11pm</li>
					<li style="font-size:16px; font-face:Trebutch MS;"><strong>Saturday</strong> - 9am to 10pm</li>
					<li style="font-size:16px; font-face:Trebutch MS;"><strong>Sunday</strong> - 9am to 12pm</li>
				</ul>
				
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

	<!-- Container -->
	
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