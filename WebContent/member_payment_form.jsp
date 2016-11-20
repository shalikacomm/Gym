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
			<div class="inner" style="min-height: 700px; margin-top:1%;">
					<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="MemberFeeCon?action=insert">Member Fee Payment</a></li>
    </ul>
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
								<div class="col-md-2">
									<input class="form-control statSupp" name="stat" value="" type="hidden" id="statSupport"
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
								<div class="col-md-2">
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
									
									<div id="lbl_status" style="margin-top: 6%; "></div>
								</div>
							</div>
						</div>
							<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Active Until</label>
								</div>
								<div class="col-md-2">
									<input type="text" id="act_date" name="act_date"
										readonly="readonly" class="form-control"
										style="text-align: right;" value="" />
										<label for="limiter" class="control-label"
										style="float: left; color: red;"><var>Is active until shown date</var>
</label>
								</div>
								<div class="col-md-4">
									
								</div>
							</div>
						</div>
						<div class="row" id="suppliment">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-8"
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
							<div class="col-md-4" >
									<label for="limiter" class="control-label col-md-5"
										style="float: right;">Paying months</label>
								</div>
								<div class="col-md-4">
								<div class="form-group">
									
									<div class="col-md-6" style="">
										<select class="form-control chzn-select" id="fee_mnul">
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
									<label for="limiter" class="control-label"
										style="float: right;"><var> per month</var><em style="color: red;">(Rs.)</em>
</label>
									
								</div>
							
								</div>
								<div class="col-md-4"></div>
								
								<div class="col-md-1">
									<input type="text" id="monthly_payment" name="monthly_payment"
										readonly="readonly" class="form-control" 
										style="text-align: left;" value="${master_fee.monthly_fee}" />
								</div>
							</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class="control-label col-md-7"
										style="float: right;">Last Deactivation Date</label>
								</div>
								<div class="col-md-2 text-center">
									<div id="sandbox-container">
										<div class="input-group date">
											<input type="text" placeholder="YYYY-MM-DD" name="activeUntil"  readonly="readonly"
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
									<label for="limiter" class=" col-md-6"
										style="float: right;">Gross Payment <em style="color: red;">(Rs.)</em></label>
								</div>
								<div class="col-md-2">
									<input type="text" id="gross_payment" name="gross_payment" readonly=""
										class="form-control" style="text-align: right;" value="" />
								</div>
							</div>
						</div>
							<div class="row ">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="col-md-5"
												style="float: right;">Discount<span>%</span></label>
										</div>
										<div class="col-md-2">
										
										 <div class="input-group pull-right discount">
												<input class="form-control child" type="number" id="disc"
													name="disc" value="0"/>
											</div> 
										
										</div>
									</div>
								</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-4">
									<label for="limiter" class=" col-md-5"
										style="float: right;">Total Payment <em style="color: red;">(Rs.)</em></label>
								</div>
								<div class="col-md-2">
									<input type="text" id="total_payment" name="total_payment" readonly="readonly"
										class="form-control" style="text-align: right;" value="" />
										
								</div>
										</div>
						</div>

						<div class="col-md-6"></div>
						<div class="col-md-6">
							<a data-toggle="modal" class="prcd btn btn-primary btn-md" style="border-radius: 6px;" id="" href="#payment_modal">Proceed to Payments</a>
						</div>

						<!-- 	Payment modal  -->
						<div class="row" style="margin-top: 1%;">
                                    <div class="col-md-12">
                                        <div class="col-md-7"></div>
                                        <div class="col-md-5">
                                            <div>
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    

                                                    <div class="col-lg-12">
                                                        <div class="modal fade" id="payment_modal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                                                            <div class="modal-dialog modal-lg">
                                                                <!--<div class="modal-content">-->
                                                                <div class="panel with-nav-tabs panel-info modal-content">
                                                                    <div class="panel-heading modal-header" id="filter-bar">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                        <ul class="nav nav-tabs">
                                                                            <li class="active"><a href="#cash" class="TabLink" data-toggle="tab">Cash Payment</a></li>
                                                                            <li><a href="#credit" class="TabLink" data-toggle="tab">Credit Payment</a></li>
                                                                            <!--<li><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>-->
                                                                        </ul>                           
                                                                    </div>
                                                                    <div class="panel-body modal-body">
                                                                        <div class="tab-content">
                                                                            <div class="tab-pane fade in active" id="cash">
                                                                                <div class="row">
                                                                                    <div class=" col-md-12 col-lg-12 "><br/>
                                                                                        <div class="row">
                                                                                            <div class="col-lg-5 col-md-5 col-sm-5" style="padding-bottom: 10px;">
                                                                                                <label>Full Amount(Rs.):</label>
                                                                                            </div>
                                                                                            <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                                                                                <input class="form-control" value="" id="total_cash_payment" style="text-align: right;" name="total_cash_payment" type="text" readonly />
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div style="float:right; margin-right:11%;">
                                                                                                <input type="submit" id="stdce" class="btn btn-primary" value="Pay Now" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="tab-pane fade" id="credit">
                                                                                <div class="row">
                                                                                    <div class="col-lg-12">
                                                                                        <div class="modal-body" style="padding: 5px;">
                                                                                            <div class="row">
                                                                                                <div class="col-md-4">
                                                                                                    <div class="checkbox">
                                                                                                        <label> <input class="uniform" type="radio" value="visa" name="card" checked="checked" />
                                                                                                            <img style="width: 70%;" src="${pageContext.request.contextPath}/logo/visa.gif"alt=""/>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-4">
                                                                                                    <div class="checkbox">
                                                                                                        <label> <input class="uniform" type="radio" value="master" name="card" />
                                                                                                            <img style="width: 70%;" src="${pageContext.request.contextPath}/logo/master.gif"alt=""/>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-md-4">
                                                                                                    <div class="checkbox">
                                                                                                        <label> <input class="uniform" type="radio" value="amex" name="card" />
                                                                                                            <img style="width: 70%;" src="${pageContext.request.contextPath}/logo/amex.gif" alt=""/>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div><br/>
                                                                                           
                                                                                            <div class="row">
                                                                                                <div class="col-lg-5 col-md-5 col-sm-5" style="margin-top:1%;">
                                                                                                    <span class="label label-success" style="padding: 6px;">First 4 Digits last 4 digits of the Card</span>  
                                                                                                </div>
                                                                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                                                                    <div class="col-md-6" style="margin-top: -3%;margin-left: -6%;"">
                           																		 <input class="form-control" type="text" maxlength="4" name="f4" value= "1111"/>
                       																																				 </div>
                                                                                                    <div class="col-md-6" style="margin-top: -3%;">
                           																		 <input class="form-control" type="text" maxlength="4" name = "l4"/ value="0000">
                       																																				 </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="row" style="margin-top: 4%;">
                                                                                                <div class="col-lg-5 col-md-5 col-sm-5" style="margin-top:1%;" >
                                                                                                    <label>Choose a Bank:</label> 
                                                                                                </div>
                                                                                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                                                                                    <select style="width: 100%;" data-placeholder="Your Favorite Type of Bear" class="form-control select-picker bank_drop" data-live-search="true" tabindex="-1" name="bank_name">
                                                                                                        <option>Commercial Bank</option>
                                                                                                        <option>Sampath Bank</option>
                                                                                                        <option>HSBC Bank</option>
                                                                                                        <option>Nations Trust Bank</option>
                                                                                                        <option>HNB Bank</option>

                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                              <div class="row" style="margin-top:4%;">
                                                                                                <div class="col-lg-5 col-md-5 col-sm-5" style="padding-bottom: 10px;">
                                                                                                    <label>Full Amount(Rs.):</label>
                                                                                                </div>
                                                                                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                                                                                    <input class="form-control" value="" id="total_credit_payment" name="total_credit_payment" style="text-align: right;" type="text" readonly />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div style="float:right; margin-right:12%;">
                                                                                                <input type="submit" id="stdce" class="btn-sm btn-primary" value="Pay Now" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <div class=" modal-footer">
                                                                            <div class="col-md-5" hidden>
                                                                                <input class="form-control" value="cash" id="payment_type" name="payment_type" type="text" placeholder="Payment Type" readonly=""/>
                                                                            </div>
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--</div>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--<button type="submit" class="btn btn-info btn-md" style=" border-radius: 6px; background: #27C3BB;">Proceed to Payments</button>-->
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

			$(".chzn-select ").chosen();
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
		var stat = ${master_fee.monthly_fee};
		var stuff = Number($('#due_payment').val());
		var downpayment = Number($('#down_payment').val());
		if(isNaN(downpayment)) {
			var downpayment = 0;
			}
			var monthly_fee = Number(months*stat);
			var gross_fee = monthly_fee+stuff+downpayment ;
		$('#gross_payment').val((gross_fee).toFixed(2));
		//var tot_pay = $('#total_payment').val();
		//alert(tot_pay);
		//$('#total_payment').val(tot_pay);
		
	});
	
	}
	$('#disc').on('keyup',function(){
		 var disc_val = $('#disc').val();
		
	});
	
	
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
				$(function() {
					formValidation();
				});
				if (!$("#memPaymentForm").valid())
					return false;
				total = $('#total_payment').val();
				$('#total_cash_payment').val(total);
				$('#total_credit_payment').val(total);
			 
				$(".TabLink").click(function () {
	                $('#payment_type').val($(this).prop("href").split('#')[1]);
	            });
				
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

												$.each(data.record,function(i, obj) {
																	div_data = "<option value=" + obj.user_id + ">"
																			+ obj.user_id
																			+ " "
																			+ obj.first_name
																			+ "</option>";
																	$(div_data).appendTo(id);
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
															success : function(data) {
																var member_status = data[0].record;
																if (member_status.status == 0) {
																	$(".down").empty();
																	$("#lbl_status").empty().append("<span class='label label-danger '>Inactive</span>");
																	
																} else if (member_status.status == 1) {
																	$(".down").empty();
																	$("#lbl_status").empty().append(
																					"<span class='label label-success'>Active</span>");
																} else if (member_status.status == 2) {
																	$(".down").empty();
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
																	$(".down").empty();
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
							
							$("#mem_id").on('change',function() {
												var mem_id = $("#mem_id").val();
												$
														.ajax({
															type : 'GET',
															url : 'MemberFeeCon?action=getSubs&user_id='
																	+ mem_id,
															success : function(data) {
																var member_subs = data;
																									
																$('#due_payment').val(member_subs);
																		}

														});
											});
						/* 	
							$("#mem_id").on('change',function() {
								var mem_id = $("#mem_id").val();
								$.ajax({
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
			 */
							
			
							
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
			  
/* 			$(' .input-group.date .my_date').datepicker({
			
				
				format : "yyyy-mm-dd",
				weekStart : 1,
				todayBtn : false,
				clearBtn : true,
				forceParse : false,
				autoclose : true,
				todayHighlight : false,
				startDate : 'today'
			}); */
			
			$('#fee_mnul').on('change',function(){
				$('#date').addClass('show');
			var multiNo =$('#fee_mnul').val();
			var lastActive = $('#act_date').val();
			if(lastActive == ""){
				var beginDate = new Date();
			}else{
				
				var currentStatus = $('#statSupport').val();
				if(currentStatus == (0 || 2 || 3)){
					var beginDate = new Date();
				}else{
					var beginDate = new Date(lastActive);
				}
				
			}
				
		//	var beginDate = new Date();
	        var month = (parseInt(beginDate.getMonth()) + parseInt(multiNo)) % 12;
	        var year = (parseInt(beginDate.getMonth()) + parseInt(multiNo)) / 12;
	        beginDate.setMonth(month);
	        beginDate.setFullYear(parseInt(beginDate.getFullYear()) + year );
	        var twoDigitMonth = ((beginDate.getMonth().length+1) === 1)? "0"+(beginDate.getMonth()+1) : (beginDate.getMonth()+1);
 			var currentDate = beginDate.getFullYear() + "-" + twoDigitMonth + "-" + beginDate.getDate();
				console.log(currentDate);
	     //   $('#monthly_payment').val(currentDate);
	   //     $('#date').val(currentDate);
	     //   $(".my_date").datepicker("update",currentDate);
	       
	       // $('.my_date').datepicker("setDate", currentDate);
$('#date').val(currentDate);
	       
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
</html>