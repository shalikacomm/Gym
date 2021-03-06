<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendence Form</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />

 <link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />

<!--for the horizontal tabs-->
<style>
.tabbable-panel {
	border: 0px solid #eee;
	padding: 10px;
	border-left-width: 3px;
}

/* Default mode */
.tabbable-line>.nav-tabs {
	border: none;
	margin: 0px;
}

.tabbable-line>.nav-tabs>li {
	margin-right: 2px;
}

.tabbable-line>.nav-tabs>li>a {
	border: 0;
	margin-right: 0;
	color: #737373;
}

.tabbable-line>.nav-tabs>li>a>i {
	color: #a6a6a6;
}

.tabbable-line>.nav-tabs>li.open, .tabbable-line>.nav-tabs>li:hover {
	border-bottom: 4px solid #fff;
}

.tabbable-line>.nav-tabs>li.open>a, .tabbable-line>.nav-tabs>li:hover>a
	{
	border: 0;
	background: none !important;
	color: #333333;
}

.tabbable-line>.nav-tabs>li.open>a>i, .tabbable-line>.nav-tabs>li:hover>a>i
	{
	color: #a6a6a6;
}

.tabbable-line>.nav-tabs>li.open .dropdown-menu, .tabbable-line>.nav-tabs>li:hover .dropdown-menu
	{
	margin-top: 0px;
}

.tabbable-line>.nav-tabs>li.active {
	border-bottom: 4px solid #333fff;
	position: relative;
}

.tabbable-line>.nav-tabs>li.active>a {
	border: 0;
	color: #333333;
	margin-bottom: 15px;
	color: primary;
	font-weight: 500;
	font-family: inherit;
	border-radius: 0px;
}

.tabbable-line>.nav-tabs>li.active>a>i {
	color: #404040;
	margin-bottom: 10px;
}

.tabbable-line>.tab-content {
	margin-top: -3px;
	background-color: #fff;
	border: 0;
	border-top: 1px solid #eee;
	padding: 15px 0;
}

.portlet .tabbable-line>.tab-content {
	padding-bottom: 0;
}
</style>
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px; margin-top: 1%;">

				<ul class="breadcrumb" style="margin-top: 1%;">
					<li><a href="dashboard.jsp">Dashboard</a></li>
					<li><a href="AttenCon?action=mark">Mark Attendance</a></li>
				</ul>
				<div class="row">
					<div class="col-lg-12">
						<div class="box dark style="margin-top:-1%;">
							<header>
							<div class="icons">Mark Attendance</div>

							</header>
							<div class="col-md-9" style="margin-top: 2.0%;">
								<div class="tabbable-panel">
									<div class="tabbable-line">
										<ul class="nav nav-tabs "
											style="border-radius: 0px; color: #333fff; border-bottom: 3px solid #333fff; font-family: inherit; font-weight: 500;">
											<li class="active"><a href="#tab_default_1"
												data-toggle="tab"> BARCODE</a></li>
											<li><a href="#tab_default_2" data-toggle="tab">
													MANUAL </a></li>
										</ul>
										<!--details tab content-->
										<div class="tab-content">
											<!--tab content of the ADD SERVICE tab-->
											<div class="tab-pane active" id="tab_default_1">
												<br />
												<div class="row">
													<form id="barcode_submit_form" method="get"
														action="AttenCon">
														<div class="row">
															<div class="col-md-6">
																<label
																	style="font-size: 20.5px; margin-left: 8%; margin-top: 5%">Mark
																	From Barcode</label> <small
																	class=" text-muted label label-warning">
																	${atten_id} </small>
															</div>
															<input type="hidden" id="atten_id" name="atten_id"
																readonly="readonly" class="form-control" style=""
																value="${atten_id}" />
														</div>
														<div class="col-md-9" style="margin-left: 8%;">
															<div class="row">
																<div class="form-group" style="margin-top: 8%;">
																	<div class="col-md-3">
																		<label style="font-size: 13.5px; margin-top: 3%">Barcode
																			ID</label>
																	</div>
																	<div class="col-md-4">
																		<div class="">
																			<input class="form-control" value="" type="text"
																				id="barcode_id" name="barcode_name" />
																		</div>
																	</div>
																</div>
															</div>
															<br />
														</div>
													</form>
												</div>
											</div>
											<div class="tab-pane" id="tab_default_2">
												<br />
												<div class="row">
													<form id="manual_submit_form" method="POST"
														action="AttenCon">
														<div class="row">
															<div class="col-md-6">
																<label
																	style="font-size: 20.5px; margin-left: 8%; margin-top: 5%">Mark
																	Manually</label>&nbsp;<small
																	class=" text-muted label label-warning">
																	${atten_id} </small>
															</div>
																<input type="hidden" id="atten_id" name="atten_id"
																readonly="readonly" class="form-control" style=""
																value="${atten_id}" />
														</div>
														<div class="col-md-9" style="margin-left: 8%;">
															<div class="row">

																<div class="row">
																	<div class="" style="margin-top: 3%;">
																		<div class="col-md-3">
																			<label style="font-size: 13.5px; margin-top: 2%;">Username ID</label>
																		</div>
																		<div class="col-md-4">
																			<input class="form-control" value="" type="text" readonly="readonly"
																				id="username_id" name="barcode_name" />
																		</div>
																	</div>
																</div>

																<br />
															</div>
															<br />
															<!--<hr style="margin-left: 15%; "/>-->
															<div class="row">
																<div class="form-actions no-margin-bottom"
																	style="text-align: center;">
																	<div class="col-sm-3"></div>
																	<div class="col-sm-6">
																		<div>
																			<input id="btn_save" value="Mark"
																				class="btn btn-primary btn-sm " type="submit">

																			<a data-toggle="modal" class="img_btn"
																				 data-toggle="modal"
																				href="#imageup"><input id="check_user"
																				value="Check" class="btn btn-warning btn-sm "
																				type="button" /></a>
																		</div>



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


						</div>
					</div>
				</div>









			</div>
		</div>

	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>

	<!-- modal start  image-->


	<div class="col-lg-12">
		<div class="modal fade" id="imageup" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			data-keyboard="false" data-backdrop="static">
			<div class="modal-dialog modal-lg">
				<!--<div class="modal-content">-->
				<div class="panel with-nav-tabs panel-info modal-content">
					<div class="panel-heading modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#doctor_info" data-toggle="tab">Enter
									user details</a></li>

							<!--<li><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>-->
						</ul>
					</div>
					<div class="panel-body modal-body">
						<form id="imageForm" action="MemberCon" method="POST">
							<div class="tab-content">

								<div class="tab-pane fade in active" id="doctor_info">


									<div class="row">
										<div class="col-md-5" style="margin-top: 1%;">
											<label>Select User ID:</label>
										</div>
										<div class="col-md-4">
											<select style="" id="userDetails"
												class="form-control chz" name="bank_name">
											</select>
										</div>
									</div>
								<div class="row">
										<div class="form-group">
											<div class="col-md-5" style="margin-top: 1%;">
												<label for="limiter" class="control-label"
													style="">Current Status</label>
											</div>
											<div class="col-md-4">

												<div id="lbl_status" style="margin-top: 6%;"></div>
											</div>
										</div>
									</div> 
											<div class="row">
											<div class="form-group">
											<div class="col-md-5" style="margin-top: 1%;">
												
											</div>
											</div>
										<div class="col-md-4" align="center" id="doc_img" style="margin-left: 41%;">
											<img id="past_img" width="134" height="179" src="" >
										</div>
									</div> 
									<hr>

									<div class="row">
											<div class="col-sm-2">
												<div class="form-group">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										
										<div class="col-sm-2">
											<div class="form-group">
													<button type="button" class="btn btn-success" id="mark_atten"
													>Mark</button>
												</div>
										</div>
									</div>
								</div>
						</form>
					</div>
				</div>
				<!--</div>-->
			</div>
		</div>
	</div>
	<!-- modal end -->


	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>

	<script>
	$(document).ready(function(){
    $("#userDetails").on('change',function(){
        var id= $(this).val();
        
      //  $("#img_user").val(id);
        //alert("${pageContext.request.contextPath}");
    $("#past_img").attr("src","${pageContext.request.contextPath}/uploads/"+id+".jpg");
    });
    });
	</script>

	<script>
		$(document).ready(function() {
							// alert(4566);
							$('#barcode_id').focus();
							$('#barcode_id').val("");
							$('#barcode_submit_form').on('submit',function(e) {
												e.preventDefault();

												$('#barcode_id').on('keyup',function(e) {
															var key = e.which;
															if (key == 13) // the enter key code
															{

															}
														}); 
												var user_id = $('#barcode_id').val();
												//alert(user_id);
												$
															.ajax({
															method : 'get',
															dataType : "json",
															url : 'AttenCon?action=check&user_id='+ user_id,
															success : function(data) {
																var result = data.record;

																if (result == true) {
																	swal({
																		title : "Welcome to FIT & FUN!",
																		text : "Work Hard play harder",
																		timer : 2000,
																		showConfirmButton : false
																	});
																	//alert("its activated");
																	window.location = "AttenCon?action=mark";
																} else if (result == false) {
																	sweetAlert(
																			"Your Access Denied",
																			"Please Contact Operator!",
																			"error");
																	$('#barcode_id').val("");
																}

															}

														});
											});
						});
	</script>
	<script>
		$(document).ready(function() {

							$('#check_user').on('click',function() {
								
												$.ajax({
															type : "GET",
															url : "AttenCon?action=users",
															dataType : "json",
															beforeSend : function(
																	xhr) {
																$("#userDetails").empty();
															},
															success : function(
																	data) {
																var div_data = "<option></option>";
																$(div_data).appendTo("#userDetails");
																$.each(data.record,function(i,obj) {
																					div_data = "<option value=" + obj.user_id + ">"
																							+ obj.first_name
																							+" "
																							+ obj.last_name
																							+" "
																							+ obj.user_id
																							+ "</option>";
																					$(div_data).appendTo("#userDetails");
																				});

																// $('.chz').trigger("chosen:updated").chosen();
															}
														});
											});
						});
	</script>
	<script>
	$(document).ready(function(){
		$('#lbl_status').empty();
		$("#userDetails").on('change',function() {
			var mem_id = $("#userDetails").val();
			$(".down").empty();
			$.ajax({type : 'GET',
					url : 'MemberFeeCon?action=mem_status&user_id='+ mem_id,
						success : function(data) {
							var member_status = data[0].record;
							if (member_status.status == 0) {
								
								$("#lbl_status").empty().append("<span class='label label-danger '>Inactive</span>");
								
							} else if (member_status.status == 1) {
							
								$("#lbl_status").empty().append(
												"<span class='label label-success'>Active</span>");
							} else if (member_status.status == 2) {
								
								$("#lbl_status").empty().append("<span class='label label-warning'>Pending</span>");
								$("#suppliment").append('	<div class="row" id="downpayment">'
										+	'		<div class="form-group down">'
										+	'<div class="col-md-4">'
										+	'	<label for="limiter" class="control-label col-md-5"'
										+	'		style="float: right;">Admission</label>'
										+	'</div>'
										+	'<div class="col-md-2">'
										+	'	<input type="text" id="down_payment" name="down_payment"'
										+	'		value="${downpay.value}" readonly="readonly" class="form-control"'
										+	'		style="text-align: right;" value=0 />'
										+	'</div>'
										+   ' </div>'
									+'</div>').hide().slideDown(1000);;	
							}
							else if (member_status.status == 3) {
							
								$("#lbl_status").empty().append("<span class='label label-info'>Fresh</span>");
								$("#suppliment").append('	<div class="row" id="downpayment">'
													+	'		<div class="form-group down">'
													+	'<div class="col-md-4">'
													+	'	<label for="limiter" class="control-label col-md-5"'
													+	'		style="float: right;">Admission</label>'
													+	'</div>'
													+	'<div class="col-md-2">'
													+	'	<input type="text" id="down_payment" name="down_payment"'
													+	'		value="${downpay.value}" readonly="readonly" class="form-control"'
													+	'		style="text-align: right;" />'
													+	'</div>'
													+   ' </div>'
												+'</div>').hide().slideDown(1000);;		
							}
							var love = (member_status.status);
							$('#statSupport').val(love);
							
					  		var last_pais_date = data[1].record1;
							$('#act_date').val(last_pais_date.active_period);  
							
						}
			
					});

		});
	});
	</script>
	<script>
	$('#mark_atten').on('click',function(){
		var user_id = $('#userDetails').val();
		$('#username_id').val(user_id);
		
	});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
	
			$("#barcode_submit_form").submit(function(e) {
				e.preventDefault();
				
				$.ajax({
					type : "POST",
					url : "AttenCon",
					data : $("#barcode_submit_form").serialize(),
					success : function(data) {
						if (data == 'true') {
						
							window.location = "AttenCon?action=mark";
						} else {

						}
					}

				});

			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
	
			$("#manual_submit_form").submit(function(e) {
				e.preventDefault();
				
				$.ajax({
					type : "POST",
					url : "AttenCon",
					data : $("#manual_submit_form").serialize(),
					success : function(data) {
						if (data == 'true') {
						
							window.location = "AttenCon?action=mark";
						} else {

						}
					}

				});

			});
		});
	</script>
 <!-- <script type="text/javascript">
		$(document).ready(function() {
			//$('#userDetails').chosen().trigger("chosen:updated");
			$("#manual_submit_form").submit(function(e) {
				e.preventDefault();
			
				$.ajax({
					type : "POST",
					url : "AttenCon",
					data : $("#manual_submit_form").serialize(),
					success : function(data) {
						if (data == 'true') {
						
						} else {

						}
					}

				});

			});
		});
	</script>  -->
</body>
</html>