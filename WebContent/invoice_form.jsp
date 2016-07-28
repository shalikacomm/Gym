<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<!-- new drodown select -->
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" " />
<link rel="stylesheet" href="assets/css/sweetalert.css" />

<style type="text/css">
.nav-tabs-dropdown {
	display: none;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.nav-tabs-dropdown:before {
	content: "\e114";
	font-family: 'Glyphicons Halflings';
	position: absolute;
	right: 30px;
}

@media screen and (min-width: 769px) {
	#nav-tabs-wrapper {
		display: block !important;
	}
}

@media screen and (max-width: 768px) {
	.nav-tabs-dropdown {
		display: block;
	}
	#nav-tabs-wrapper {
		display: none;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
		text-align: center;
	}
	.nav-tabs-horizontal {
		min-height: 20px;
		padding: 19px;
		margin-bottom: 20px;
		background-color: #f5f5f5;
		border: 1px solid #e3e3e3;
		border-radius: 4px;
		-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
	}
	.nav-tabs-horizontal>li {
		float: none;
	}
	.nav-tabs-horizontal>li+li {
		margin-left: 2px;
	}
	.nav-tabs-horizontal>li, .nav-tabs-horizontal>li>a {
		background: transparent;
		width: 100%;
	}
	.nav-tabs-horizontal>li>a {
		border-radius: 4px;
	}
	.nav-tabs-horizontal>li.active>a, .nav-tabs-horizontal>li.active>a:hover,
		.nav-tabs-horizontal>li.active>a:focus {
		color: #ffffff;
		background-color: #428bca;
	}
}
</style>

</head>
<body class="padTop53 ">

	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
				<form id="invoiceForm" class="form-horizontal" align="center"
					method="post" action="InvoiceCon" novalidate>
					<div class="row">
						<div class="col-lg-12">
							<div class="box dark">
								<header>
								<div class="icons">
									<i class="icon-glass"></i>
								</div>
								<h5>Invoice Header Details</h5>
								</header>



								</br>
								<div class="row">
									<div class="form-group">
										<label class="control-label col-md-4">Customer Type</label>

										<div class="col-md-8">
											<div class="checkbox">
												<label> <input class="uniform cus_type" type="radio"
													name="cus_type" value="rg" /> Registered User
												</label> &nbsp;<label> <input class="uniform cus_type"
													type="radio" name="cus_type" value="un_rg"
													checked="checked" /> Other
												</label>
											</div>


										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label style="float: right;"> User ID </label>
										</div>
										<div class="col-md-4">
											<select name="user_id" class="form-control chzn-select"
												id="user_id">
												<option></option>
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Name</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="b_name" name="b_name"
												placeholder="Buyers Name" class="form-control" value="" />
										</div>


									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">E-mail</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="email" name="email"
												placeholder="Enter contact e-mail" class="form-control" />

										</div>
									</div>
								</div>


							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="box dark staticParent">
								<header>
								<div class="icons">
									<i class="icon-glass"></i>
								</div>
								<div class="col-md-2 text-center">
									<input readonly id="invoice_id" class="form-control"
										name="invoice_id" value="${invoice_id}" id="inv_price0"
										type="text" />
								</div>
								</header>


								<div class="row">
									<div class="col-md-4 text-center">
										<strong>Item</strong>
									</div>
									<div class="col-md-1 text-center">
										<strong>Std. Price</strong>
									</div>
									<div class="col-md-2 text-center">
										<strong>Unit</strong>
									</div>
									<div class="col-md-1 text-center" id="">
										<strong>Qty</strong>
									</div>
									<div class="col-md-2 text-center">
										<strong>Sub total</strong>
									</div>
									<div class="col-md-2 text-center">
										<strong></strong>
									</div>
								</div>
								<div class="inv_body">
									<div class="row inv_row" id="inv_row0">
										<div class="col-md-4 text-center">
											<select id="inv_item0" name="inv_item"
												class="form-control chzn-select inv_item keep">

											</select>
										</div>
										<div class="col-md-1 text-center">
											<input readonly id="inv_price0"
												class="form-control inv_price" name="inv_price"
												id="inv_price0" type="text" />
										</div>
										<div class="col-md-2 text-center">
											<input readonly id="inv_unit0" class="form-control inv_unit"
												type="text" />
										</div>
										<div class="col-md-1 text-center ">
											<input class="form-control child" name="inv_qty"
												id="inv_qty0" type="text" />
										</div>
										<div class="col-md-2 text-center">
											<input class="form-control" name="inv_sub_total"
												id="inv_sub_total0" readonly="readonly" type="text"
												style="text-align: right;" />
										</div>
										<div class="col-md-2 text-center">
											<button id="kmk" class="btn btn-danger  item_remove"
												type="button">-</button>
										</div>
									</div>



								</div>

								<div class="row">
									<div class="col-md-6"></div>

									<div class="col-md-2 pull-right">
										<button id="add-item" class="btn btn-primary" type="button">
											<span>+</span>
										</button>
									</div>
								</div>


							</div>
						</div>
					</div>

					<!-- 	DIscount & Submitting form -->
					<div class="row">
						<div class="col-lg-12">
							<div class="box dark">
								<header>
								<div class="icons">
									<i class="icon-glass"></i>
								</div>
								<h5>Invoice Header Details</h5>
								</header>
								</br>
								<div class="row">
									<div class="form-group">
										<div class="col-md-8">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Total(RS)</label>

										</div>
										<div class="col-md-2 text-center">
											<input readonly placeholder="Total" type="text" id="total"
												style="text-align: right;" class="form-control">
										</div>
									</div>
								</div>

								<div class="row ">
									<div class="form-group">
										<div class="col-md-8">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Discount</label>
										</div>
										<div class="col-md-1">
											<div class="input-group pull-right discount">
												<input class="form-control " type="text" id="disc"
													data-mask="99%" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-8">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Vat%</label>
										</div>
										<div class="col-md-1 vatc">
											<div class="input-group pull-right vat">
												<input type="text" id="vat" name="vat" class="form-control"
													data-mask="99%" default />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-8">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Invoiced Total(RS)</label>

										</div>
										<div class="col-md-2 text-center">
											<input readonly placeholder="Invoiced Total" type="text"
												id="invoiced_total" style="text-align: right;"
												class="form-control">
										</div>
									</div>
								</div>


								<br />
								<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div>
												<input style="left: 80%; width: 10%;" id="btn_save"
													value="Save" class="btn btn-primary " type="submit">
												<input id="btn_reset" value="Reset" style="width: 10%;"
													class="btn btn-warning " type="reset" /> <a
													class="btn btn-success " style="width: 10%;"
													href="ProductCon?action=list">Cancel</a>
											</div>

										</div>
									</div>
								</div>
								<div class="row" style="text-align: center;">


									<div class="col-md-6"></div>
									<div class="col-md-6">
										<button class="btn-primary prcd" data-toggle="modal"
											data-target="#formModal">Proceed to Payments</button>
									</div>

									<!-- 	Payment modal  -->
									<div class="col-md-12">
										<div class="modal fade" id="formModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title" id="H2">Payemnt Select</h4>
													</div>
													<div class="modal-body">
														<div class="body">
															<div class="container">
																<div class="row">
																	<div class="col-md-3">
																		<a href="#"
																			class="nav-tabs-dropdown btn btn-block btn-primary">Tabs</a>
																		<ul id="nav-tabs-wrapper"
																			class="nav nav-tabs nav-pills nav-stacked well">
																			<li class="active"><a href="#vtab1"
																				data-toggle="tab">Cash</a></li>
																			<li><a href="#vtab2" data-toggle="tab">Credit</a></li>
																			<li><a href="#vtab3" data-toggle="tab">Monthly</a></li>
																		</ul>
																	</div>
																	<div class="col-md-9">
																		<div class="tab-content">
																			<div role="tabpanel" class="tab-pane fade in active"
																				id="vtab1">

																				<input readonly placeholder="Total" type="text"
																					id="pay_total" style="text-align: right;"
																					class="form-control">


																			</div>
																			<div role="tabpanel" class="tab-pane fade" id="vtab2">
																				<div class="row">
																					<div class="col-md-4">
																						<div class="checkbox">
																							<label> <input class="uniform"
																								type="radio" value="option1" name="card"
																								checked="checked" /> <img
																								src="${pageContext.request.contextPath}/logo/amex.gif" />
																							</label>
																						</div>
																					</div>
																					<div class="col-md-4">
																						<div class="checkbox">
																							<label> <input class="uniform"
																								type="radio" value="option2" name="card" /> <img
																								src="${pageContext.request.contextPath}/logo/visa.gif" />
																							</label>
																						</div>
																					</div>
																					<div class="col-md-4">
																						<div class="checkbox">
																							<label> <input class="uniform"
																								type="radio" value="option3" name="card" /> <img
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
																							<input class="form-control autotab"
																								style="margin-left: 23%" type="text"
																								maxlength="4" tabindex="11" />
																						</div>
																						<div class="col-md-2">
																							<span class="label label-info">Last 4 No</span>
																						</div>
																						<div class="col-md-4">
																							<input class="form-control autotab"
																								style="margin-left: 23%" type="text"
																								maxlength="4" tabindex="12" />
																						</div>


																					</div>
																				</div>
</br>
																				<div class="form-group">

																					<div class="col-md-8" style=" margin-left: 13%;">
																						<select style="width: 60%;"
																							data-placeholder="Your Favorite Type of Bear"
																							class="form-control select-picker bank_drop"
																							data-live-search="true" tabindex="-1">
																							<option selected="selected">Commercial Bank</option>
																							<option>Sampath Bank</option>
																							<option>HSBC Bank</option>
																							<option>Nations Trust Bank</option>
																							<option>HNB Bank</option>
																							
																						</select>
																					</div>
																				</div>
																			</div>
																			<div role="tabpanel" class="tab-pane fade in"
																				id="vtab3">
																				<h3>Tab 3</h3>
																				<p>Your Payment will be added to your mobthly payment</p>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary">Save
															changes</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- End payment modal -->
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>

		<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>
	<script src="assets/js/bootstrap-inputmask.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/jquery.tagsinput.min.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script>
		$(function() {
			formValidation();
			noLetter();
		});

		$(function() {
			/*----------- BEGIN chosen CODE -------------------------*/

			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : false
			});
			/*----------- END chosen CODE -------------------------*/
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.bank_drop').selectpicker();
		});
	</script>

	<script src="assets/js/modal_verticle.js"></script>
	<script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- dropdown js -->
	<script src="assets/js/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
	<script src="assets/js/validationInit.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(".cus_type").on(
									"change",
									function() {
										var cus_type = this.value;

										if (cus_type == "rg") {
											$('#b_name').attr('readonly',
													'readonly');
											$('#email').attr('readonly',
													'readonly');
											$("#user_id").prop('disabled',
													false).trigger(
													'chosen:updated');
											dropdownList(
													"InvoiceCon?action=users",
													"#user_id");

										} else {
											$("#user_id").empty();
											$(".chzn-select").prop('disabled',
													true).trigger(
													'chosen:updated');
											$('.keep').closest(".chzn-select")
													.prop('disabled', false)
													.trigger('chosen:updated');

											//$('#user_id').attr('disabled', 'disabled');
											$('#b_name').removeAttr('readonly',
													'readonly');
											$('#email').removeAttr('readonly',
													'readonly');
											//	$(".chzn-select").trigger('chosen:updated').chosen();
										}

									});

							$("#user_id")
									.on(
											'change',
											function() {
												var user_id = $("#user_id")
														.val();
												$
														.ajax({
															type : 'GET',
															url : 'InvoiceCon?action=user_details&user_id='
																	+ user_id,
															success : function(
																	data) {
																var user = data.record;
																$('#b_name')
																		.val(
																				user.first_name);
																$('#email')
																		.val(
																				user.email);
															}

														});
											});

							function dropdownList(url, id) {
								$
										.ajax({
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
						});
	</script>

	<script>
		$.ajax({
			type : "GET",
			url : "InvoiceCon?action=products",
			dataType : "json",
			beforeSend : function(xhr) {
				$("#inv_item0").empty();
			},
			success : function(data) {
				var div_data = "<option></option>";
				$(div_data).appendTo("#inv_item0");
				$.each(data.record, function(i, obj) {
					div_data = "<option value=" + obj.productID + ">"
							+ obj.description + "</option>";
					$(div_data).appendTo("#inv_item0");
				});
				$("#inv_item0").chosen().trigger("chosen:updated");
			}
		});
		$(document)
				.ready(
						function() {
							$(".chzn-select").prop('disabled', false).trigger(
									'chosen:updated');
							var index = 1;
							$("#add-item")
									.click(
											function(e) {
												e.preventDefault();

												var inv_row = $('<div id="inv_row'+index+'"  class="row inv_row" style="margin-top:8px">'
														+ '<div class="col-md-4 text-center">'
														+ '<select id="inv_item'+index+'" name="inv_item"  class=" keep form-control chzn-select inv_item">'
														+ '<option></option>'
														+ '</select>'
														+ '</div>'
														+ '<div class="col-md-1 text-center">'
														+ '<input readonly class="form-control t_row" name="inv_price" id="inv_price'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input readonly class="form-control" name="inv_unit" id ="inv_unit'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-1 text-center">'
														+ '<input class="form-control child" name="inv_qty" id = "inv_qty'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input class="form-control" readonly="readonly" name="inv_sub_total" id="inv_sub_total'+index+'" type="text" style="text-align: right;" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<button  class="btn btn-danger item_remove" id = "kmk" type="button"> - </button>'
														+ '</div>' + '</div>');
												$(".inv_body").append(inv_row);

												$
														.ajax({
															type : "GET",
															url : "InvoiceCon?action=products",
															dataType : "json",
															beforeSend : function(
																	xhr) {
																$(
																		"#inv_item"
																				+ index)
																		.empty();
															},
															success : function(
																	data) {
																var div_data = "<option></option>";
																$(div_data)
																		.appendTo(
																				"#inv_item"
																						+ index);
																$
																		.each(
																				data.record,
																				function(
																						i,
																						obj) {
																					div_data = "<option value=" + obj.productID + ">"
																							+ obj.description
																							+ "</option>";
																					$(
																							div_data)
																							.appendTo(
																									"#inv_item"
																											+ index);
																				});

																$(
																		"#inv_item"
																				+ index)
																		.chosen()
																		.trigger(
																				"chosen:updated");
																index++;
															}

														});

											});//END (add-item)

							$('.inv_body').on('click', '#kmk', function() {
								this.closest(".inv_row").remove();
								totalCal();

							});

							$("body")
									.on(
											'change',
											".inv_item",
											function() {
												var id = this.id;
												
												var product_id = this.value;
												
												var current_id = id.replace(
														"inv_item", "");
													
												$
														.ajax({
															method : 'GET',
															url : 'ProductCon?action=products&product_id='
																	+ product_id,
															success : function(
																	data,
																	status) {
																console
																		.log(data.record);
																var product = data.record;
																
																$(
																		"#inv_price"
																				+ current_id)
																		.val(
																				product.sellingPrice);
																$(
																		"#inv_unit"
																				+ current_id)
																		.val(
																				product.measuringUnit);

															}
														});

											});

							//SUubTotal calcuation

							$("body").on(
									"keyup",
									"[id^='inv_qty']",
									function() {
										elementID = this.id.replace("inv_qty",
												"");

										/* alert($("#inv_qty"+elementID).val()); */
										qty = $("#inv_qty" + elementID).val();
										price = +($("#inv_price" + elementID)
												.val());
										subtotal = qty * price;
										$("#inv_sub_total" + elementID).val(
												subtotal.toFixed(2));
										totalCal();

									});
							//		Calcuate Grand total 
							function totalCal() {
								var count = Number($("[id^='inv_sub_total']")
										.last().attr('id').replace(
												"inv_sub_total", ""));

								var total = 0;
								for (i = 0; i <= count; i++) {
									var inv_sub_total = $("#inv_sub_total" + i)
											.val();

									if (inv_sub_total !== undefined) {
										var sub_total = Number(inv_sub_total);
										total = total + sub_total;
									}
								}

								$('#total').val(total.toFixed(2));

								discountCal();
							}

							// Calculate Discount	

							function discountCal() {

								var total = $('#total').val();
								var disc_rate = parseInt($("#disc").val());

								discounted_val = total * (1 - disc_rate / 100);

								$('#invoiced_total').val(discounted_val.toFixed(2));

							}
							$('.discount').on('keyup change', '#disc',
									function() {
										discountCal();
									});

							// Clculate Vat%

							function vatCal() {

								var vat_perc = $('#vat').val();

							}
							$('.prcd').on('click', function() {

								var tot = $('#invoiced_total').val();
								$('#pay_total').val(tot).toFixed(2);

							});

							/* 
							$("[id^='inv_row']").each(function(){
								var id =  this.id;
								ElementID=this.id.replace("inv_row","");
							alert(this.id);
							 */
							//a=$("#inv_price"+ElementID).val();
							/* 	}); */

							/* $(this).on('keyup click',"div[id^='inv_row_']" ,function() {
								var id =  this.id;
								ElementID=this.id.replace("inv_row_","");
								a=$("#inv_price"+ElementID).val();
								//var price = $(id).closest('.t_row').find('#inv_price').val();
								alert(a);
							});
							 */

							/* 		function sub_cal() {
										var unit_price = Number($("#inv_qty'+index+'").val());
										var qty = Number($("#inv_qty'+index+'").val());

										sub_totalt =  unit_price* qty;

										$("#inv_sub_total'+index+'").val(sub_totalt.toFixed(2));
									} */

						});
	</script>
	<script>
	$(document)
	.ready(
			function() {
				$(function() {
					formValidation();
				});
				$("#invoiceForm").submit(
								function(e) {
									e.preventDefault();
									//alert("adad");
									if (!$("#invoiceForm").valid())
										return false;
									
									swal({
										  title: "Are you sure?",
										  text: "You will not be able to recover this imaginary file!",
										  type: "warning",
										  showCancelButton: true,
										  confirmButtonColor: "#DD6B55",
										  confirmButtonText: "Yes, delete it!",
										  cancelButtonText: "No, cancel plx!",
										  closeOnConfirm: false,
										  closeOnCancel: false
										},
										function(isConfirm){
										  if (isConfirm) {
												$.ajax({
													type : "POST",
													url : "InvoiceCon",
													data : $(
															"#invoiceForm")
															.serialize(),
													success : function(
															data) {
														if (data == 'true') {
															swal(
																	{
																		title : "Good job!",
																		text : "You created a product!",
																		type : "success",
																		showCancelButton : false,
																		confirmButtonColor : "#DD6B55",
																		confirmButtonText : "OK!",
																		closeOnConfirm : false
																	},
																	function() {
																		window.location = "ProductCon?action=list";
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
											    swal("Cancelled", "Your imaginary file is safe :)", "error");
										  }
										});
									
									
									
							
								});
			});
	
	</script>
</body>
</html>