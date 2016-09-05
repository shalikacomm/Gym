<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Fee Payment</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/modal.css" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
				<div class="panel panel-default">
					<div class="panel-heading">Member Fee Payment</div>
					<div class="panel-body">

						<form id="memPaymentForm" class="form-horizontal" method="post"
							action="MemberCon" novalidate />
						</br>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label class="control-label col-md-5" style="float: right;">Payment
										ID</label>
								</div>
								<div class="col-md-2">
									<input class="form-control" name="payment_id" value="${fee_id}"
										readonly="readonly" />

								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label class="control-label col-md-5" style="float: right;">Select
										Member</label>
								</div>
								<div class="col-md-4">
									<select name="user_id" class="form-control chzn-select"
										id="mem_id">
										<option></option>
									</select>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Current Status</label>
								</div>
								<div class="col-md-2">
									<br />
									<div id="lbl_status"></div>
								</div>
							</div>
						</div>
							<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Last Active Date</label>
								</div>
								<div class="col-md-2">
									<input type="text" id="act_date" name="act_date"
										readonly="readonly" class="form-control"
										style="text-align: right;" value="" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Due Supplement Payments</label>
								</div>
								<div class="col-md-2">
									<input type="text" id="due_payment" name="due_payment"
										readonly="readonly" class="form-control"
										style="text-align: right;" value=0 />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Active Until</label>
								</div>
								<div class="col-md-2 text-center">
									<div id="sandbox-container">
										<div class="input-group date">
											<input type="text" placeholder="YYYY-MM-DD" name="activeUntil"
												id="date" class="all form-control my_date"><span
												class="input-group-addon"><li
												class="glyphicon glyphicon-th"></li></span>
										</div>
										<label for="dob" class="error"></label>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Paying months</label>
								</div>
								<div class="col-md-2">
								<div class="form-group">
									
									<div class="col-md-6">
										<select class="form-control" id="fee_mnul">
											<option value = "0">0</option>
											<option value = "1">1</option>
											<option value = "2">2</option>
											<option value = "3">3</option>
											<option value = "4">4</option>
											<option value = "5">5</option>
											<option value = "6">6</option>
											<option value = "7">7</option>
											<option value = "8">8</option>
											<option value = "9">9</option>
											<option value = "10">10</option>
											<option value = "11">11</option>
											<option value = "12">12</option>
											<option value = "13">13</option>
											<option value = "14">14</option>
											<option value = "15">15</option>
											<option value = "16">16</option>
											<option value = "17">17</option>
											<option value = "18">18</option>
											<option value = "19">19</option>
											<option value = "20">21</option>
											<option value = "22">22</option>
											<option value = "23">23</option>
											<option value = "24">24</option>
											<option value = "25">25</option>
											<option value = "26">26</option>
											<option value = "27">27</option>
											<option value = "28">28</option>
											<option value = "29">29</option>
											<option value = "30">30</option>
											<option value = "31">31</option>
											<option value = "32">32</option>
											<option value = "33">33</option>
											<option value = "34">34</option>
											<option value = "35">35</option>
											<option value = "36">36</option>
										
										</select>
									</div>
									<em style="color: blue;">X</em>
								</div>
							
								</div>
								
								<div class="col-md-2">
									<input type="text" id="monthly_payment" name="monthly_payment"
										readonly="readonly" class="form-control"
										style="text-align: right;" value="${monthly_fee.monthly_fee}" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Gross Payment<em style="color: red;">(Rs.)</em></label>
								</div>
								<div class="col-md-2">
									<input type="text" id="gross_payment" name="gross_payment"
										class="form-control" style="text-align: right;" value="" />
								</div>
							</div>
						</div>
							<div class="row ">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Discount<span>%</span></label>
										</div>
										<div class="col-md-2">
											<div class="input-group pull-right discount">
												<input class="form-control discount" type="text" data-mask="99" id="disc" 
													name="disc" value =0 />
													  <span class="input-group-addon">99%</span>
											</div>
										</div>
									</div>
								</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Total Payment <em style="color: red;">(Rs.)</em></label>
								</div>
								<div class="col-md-2">
									<input type="text" id="total_payment" name="total_payment"
										class="form-control" style="text-align: right;" value="" />
										
								</div>
										</div>
						</div>

						<div class="col-md-6"></div>
						<div class="col-md-6">
							<button class="btn btn-primary prcd" data-toggle="modal"
								data-target="#formModal">Proceed to Payments</button>
						</div>

						<!-- 	Payment modal  -->
						<div class="col-md-12">
							<div class="modal fade" id="formModal" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- 	<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title" id="H2">Payment Select</h4>
													</div> -->
										<div class="modal-body">
											<!-- 	// starts here  -->

											<!-- 	<h1>
															id of selected tab: <span id="idDisplay">cash</span>
														</h1> -->

											<div id="tabs" style="border: 0px solid #ffffff;">
												<ul style="background: #d9edf7">
													<li><a href="#cash">Cash</a></li>
													<li><a href="#credit">Credit Card</a></li>
												</ul>
												<div id="cash">

													<input readonly placeholder="Total" type="text"
														id="pay_total" style="text-align: right;"
														class="form-control">

												</div>
												<div id="credit">
													<div class="row">
														<div class="col-md-4">
															<div class="checkbox">
																<label> <input class="uniform" type="radio"
																	value="amex" name="card" checked="checked" /> <img
																	src="${pageContext.request.contextPath}/logo/amex.gif" />
																</label>
															</div>
														</div>
														<div class="col-md-4">
															<div class="checkbox">
																<label> <input class="uniform" type="radio"
																	value="visa" name="card" /> <img
																	src="${pageContext.request.contextPath}/logo/visa.gif" />
																</label>
															</div>
														</div>
														<div class="col-md-4">
															<div class="checkbox">
																<label> <input class="uniform" type="radio"
																	value="master" name="card" /> <img
																	src="${pageContext.request.contextPath}/logo/master.gif" />
																</label>
															</div>
														</div>
													</div>
													</br>
													<div class="row">
														<div class="col-md-12">
															<div class="col-md-2">
																<span class="label label-info">First 4 No</span>
															</div>
															<div class="col-md-4">
																<input class="form-control autotab f4"
																	style="margin-left: 23%" type="text" maxlength="4"
																	value="0000" placeholder="Card No" name="f4"
																	tabindex="11" />
															</div>
															<div class="col-md-2">
																<span class="label label-info">Last 4 No</span>
															</div>
															<div class="col-md-4">
																<input class="form-control autotab l4"
																	style="margin-left: 23%" type="text" maxlength="4"
																	placeholder="Card No" value="1111" name="l4"
																	tabindex="12" />
															</div>


														</div>
													</div>
													</br>
													<div class="form-group">
														<div class = "row">
														<div class="col-md-7" style="margin-left: 13%; float:left;">
															<select style="width: 60%;"
																data-placeholder="Your Favorite Type of Bear"
																class="form-control select-picker bank_drop"
																data-live-search="true" tabindex="-1" name="bank_name">
																<option selected="selected">Commercial Bank</option>
																<option>Sampath Bank</option>
																<option>HSBC Bank</option>
																<option>Nations Trust Bank</option>
																<option>HNB Bank</option>

															</select>
														</div>
														<div class="col-md-3">
														<input type="text" id="chk_payment" name="chk_payment" readonly="readonly"
														class="form-control" style="text-align: right;" value="" />
														</div>
														</div>
													</div>
												</div>

											</div>


											<!-- 	// ends here  -->
											<div class="body"></div>
										</div>

										<div class="modal-footer">
											<input type="hidden" id="payment_type" value="cash"
												name="payment_type" />

											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button class="btn btn-primary " type="submit">Check
												Out</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End payment modal -->

						</form>
					</div>

				</div>
			</div>


		</div>
	</div>




	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/js/modal_verticle.js"></script>
	<script src="assets/js/bootstrap-inputmask.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
	<script src="assets/js/validationInit.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
		$(function() {
			/*----------- BEGIN chosen CODE -------------------------*/

			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : false

			});
			/*----------- END chosen CODE -------------------------*/
		});
	</script>
	
	<!-- cal gross payment -->
	<script>
	$(document).ready(function(){
		calGrossPayment();
	function calGrossPayment(){
	$('#fee_mnul').on ('change',function(){
		
		months = $('#fee_mnul').val();
		var stat = ${monthly_fee.monthly_fee};
		var stuff = Number($('#due_payment').val());
			var monthly_fee = Number(months*stat);
			var gross_fee = monthly_fee+stuff ;
		$('#gross_payment').val((gross_fee).toFixed(2));
		//var tot_pay = $('#total_payment').val();
		//alert(tot_pay);
		//$('#total_payment').val(tot_pay);
		
	});
	
	}
	
	function calDiscount() {

		var total = $('#gross_payment').val();

		var disc_rate = parseInt($("#disc").val());
		// $('#disc').val(disc_rate)

		if(isNaN(disc_rate)) {
		var disc_rate = 0;
		}
		discounted_val = total * (1 - disc_rate / 100);

		$('#total_payment').val(
				discounted_val.toFixed(2));

	}
	
	
		/* End cal gross payment  */
		/*  cal Discount */
	
		
			$('.discount').on('keyup change', '#disc',function() {
				
				calGrossPayment();
				calDiscount();
				
			});
			$('#fee_mnul').on('change',function() {
				
				calGrossPayment();
				calDiscount();
				
			});
			$('.prcd').on('click', function() {
				total = $('#total_payment').val();
				$('#pay_total').val(total);
				$('#chk_payment').val(total);
			
				
			});
			
	});
				</script>
		
		
	<script>
		$(document).ready(function() {

							dropdownList("MemberCon?action=members", "#mem_id");

							function dropdownList(url, id) {
										$.ajax({
											type : "GET",
											url : "" + url + "",
											dataType : "json",
											beforeSend : function(xhr) {
												$(id).empty();
											},
											success : function(data) {
												var div_data = "<option></option>";

												$(div_data).appendTo(id);

												$
														.each(
																data.record,
																function(i, obj) {
																	div_data = "<option value=" + obj.user_id + ">"
																			+ obj.user_id
																			+ " "
																			+ obj.first_name
																			+ "</option>";
																	$(div_data)
																			.appendTo(
																					id);
																});
												$(id).chosen().trigger(
														"chosen:updated");
											}
										});
							}

							$("#mem_id").on('change',function() {
												var mem_id = $("#mem_id").val();
												$.ajax({type : 'GET',
														url : 'MemberFeeCon?action=mem_status&user_id='+ mem_id,
															success : function(
																	data) {
																var member_status = data.record;
																if (member_status.status == 0) {
																	$(
																			"#lbl_status")
																			.empty()
																			.append(
																					"<span class='label label-danger'>Inactive</span>");
																} else if (member_status.status == 1) {
																	$("#lbl_status").empty().append(
																					"<span class='label label-success'>Active</span>");
																} else if (member_status.status == 2) {
																	$(
																			"#lbl_status")
																			.empty()
																			.append(
																					"<span class='label label-warning'>Pending</span>");

																}
															}

														});

											});
							$("#mem_id").on('change',function() {
												var mem_id = $("#mem_id").val();
												$
														.ajax({
															type : 'GET',
															url : 'MemberFeeCon?action=getSubs&user_id='
																	+ mem_id,
															success : function(
																	data) {
																var member_subs = data;
																$(
																		'#due_payment')
																		.val(
																				member_subs);
															}

														});
											});
							
							$("#mem_id").on('change',function() {
								var mem_id = $("#mem_id").val();
								$
										.ajax({
											type : 'GET',
											url : 'MemberFeeCon?action=getActiveDate&user_id='
													+ mem_id,
											success : function(
													data) {
												var lastAct = data.record;
												$('#act_date').val(lastAct.active_period);
												
											}

										});
							});
			
							
			
							
							$('#total_payment').on('keyup', function() {

								var dot = $('#total_payment');
								$(('#total_payment').val(dot).toFixed(2));
							});

							/* 		Select the payment mode tab */

							function getSelectedTabId() {
								return $("#tabs .ui-tabs-panel:visible").attr(
										"id");
							}

							$(function() {

								$("#tabs").tabs();

								//update the display of the selected id 
								$("#tabs").click(function(e) {
									$("#idDisplay").text(getSelectedTabId());
									var test = getSelectedTabId();
									//$('#payment_type').val("cash");
									$('#payment_type').val(test);
								});

								//initalize the selected id display    
								//	$("#tabs").click();

							});
							/* 	end 	Select the payment mode tab */

						});
	</script>
	<script>
		$(document).ready(function() {
			/* Bootstrap Datepicker Validation */
			// $('.page').animate('fadeIn').show('slow',true);
			//	$('.page').hide('slow').fadeIn({queue: false, duration: 'slow'}).show('slow');
			$('#sandbox-container .input-group.date .my_date').datepicker({
				format : "yyyy-mm-dd",
				weekStart : 1,
				todayBtn : false,
				clearBtn : true,
				forceParse : false,
				autoclose : true,
				todayHighlight : false,
				startDate : 'today'
			});
		});
	</script>
<script>
		$(document).ready(function() {
							$(function() {
								formValidation();
							});
							$("#memPaymentForm").submit(function(e) {
												e.preventDefault();
											/* 	if (!$("#memPaymentForm").valid())
													return false;
 */
												swal(
														{
															title : "Are you sure?",
															text : "You will not be able to recover this imaginary file!",
															type : "warning",
															showCancelButton : true,
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "Yes, Proceed!",
															cancelButtonText : "No, cancel!",
															closeOnConfirm : false,
															closeOnCancel : false
														},
														function(isConfirm) {
															if (isConfirm) {
																$.ajax({
																			type : "POST",
																			url : "MemberFeeCon",
																			data : $("#memPaymentForm").serialize(),
																			success : function(
																					data) {
																				if (data == true) {
																					swal(
																							{
																								title : "Transacion Completed!",
																								text : "You completed a selling cycle",
																								type : "success",
																								showCancelButton : false,
																								confirmButtonColor : "#DD6B55",
																								confirmButtonText : "OK!",
																								closeOnConfirm : true
																							},
																							function() {
																							//	 window.location = "InvoiceCon?action=invoice_list";
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
</html>