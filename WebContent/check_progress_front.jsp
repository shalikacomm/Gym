
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
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
</head>
<body>

	<!-- Container -->
	<div id="container">

		<!-- Start Header -->	<%@include file="header_front.jsp" %>
		<!-- End Header -->
		  <!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>About Us</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="#">Home</a></li>
              <li>About Us</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->

		<!-- Start Content -->
<div class="panel panel-default">

					<div class="panel-body">
						<form action="MemberDCon" method="POST" id="memDetailList">

						<div class="row" type="hidden">
						<input id="user_data" value=${user_id}>
						</div>
							<div class="row col-md-8" id="inv_row">
											
							<div class="form-group col-md-3">
							<label>Plaese select body part</label>
							</div>
							<div class="form-group">
								<div class="text-center col-md-4" style="margin-left:1%;">
											<select id="body_item2" name="body_part" class="form-control item chzn-select">
											 <option value="empty"></option>
											 <option value="height">Height</option>
 											 <option value="weight">Weight</option>
  											<option value="goal_weight">Goal Weight</option>
	  										<option value="chest">Chest</option>
	  										<option value="hip">Hip</option>
	  										<option value="shoulder_length">Shoulder length</option>
	  										<option value="thigh">Thigh</option>
	  										<option value="bicep">Bicep</option>
	  										
												</select>
										</div>
										</div></div>
										<div class="row">
										<div class="col-md-3"></div>
										<div style="width:800px; margin-left: 22%;">
										<canvas id="myChart" width="800" height="500"></canvas>
										</div>
										
										</div>
							
							
</form></div></div>



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
	<script src="assets/chart/Chart.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	
	
	
	
		<script>
		$(function() {
			/*----------- BEGIN chosen CODE -------------------------*/

			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			/*----------- END chosen CODE -------------------------*/
		});
	</script>
	
	<script>
	var dataName= [];
	var dataValue=[];
	$(document).ready(function(){
		$('.item').on('change',function(){
			var item  = $(this).val();
		
	var user_id = $('#user_data').val();
		 $.ajax({
			 method:'GET',
			 url:'MemberDCon?action=body_part&userName='+user_id,
			 success: function(data){
				 console.log(data.record);
					$.each(data.record,function(i,obj) {
						 dataName.push(obj.date_added);
						
						 if(item=="weight"){
						dataValue.push(obj.weight);	
						 }else if(item=="height"){
						dataValue.push(obj.height);	
						 }
						 else if(item=="goal_weight"){
						dataValue.push(obj.goal_weight);	
						 }
						 else if(item=="chest"){
						dataValue.push(obj.chest);	
						 }
						 else if(item=="hip"){
						dataValue.push(obj.hip);	
						 }
						 else if(item=="shoulder_length"){
						dataValue.push(obj.shoulder_length);	
						 }
						 else if(item=="thigh"){
						dataValue.push(obj.thigh);	
						 }
						 else if(item=="bicep"){
						dataValue.push(obj.bicep);	
						 }
					
				});
			 
			 }		 
		 });
		});
		 
		 var ctx = $("#myChart");
		// console.log(ctx)

		 var myChart = new Chart(ctx, {
		   type: 'line',
		   data : {
		       labels: dataName,
		       datasets: [{
		           label: 'click here',
		           fill : false,
		           lineTension: 0.1,
		           data: [12, 19, 3, 5, 2, 3],
		           backgroundColor: 'rgba(255, 159, 64, 0.2)',
		           borderColor:'rgba(255, 159, 64, 1)',
		           borderCapStyle:'butt',
		           borderDash:[],
		           borderDashOffset:0.0,
		           borderJoinStyle: 'miter',
		           pointBorderColor:'rgba(75, 192, 64, 1)',
		           pointBackgroundColor:'#fff',
		           pointBorderWidth:1,
		           pointHoverRadius:5,
		           pointHoverBackgroundColor: 'rgba(255, 159, 64, 1)',
		           pointHoverBorderColor: 'rgba(220, 220, 220, 1)',
		           pointHoverBorderWidth: 2,
		           pointRadius:10,
		           data:dataValue,
		           
		       }]
		   },
		   options: {
		       scales: {
		           yAxes: [{
		               ticks: {
		                   beginAtZero:true
		               }
		           }]
		       }
		   }
		});
		
	});
	
	</script>
</body>
</html>