<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice Form</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<!-- new drodown select -->
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" " />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/modal.css" />


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

								<br/>
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
										<div class="col-md-4 text-center" style="margin-left:1%;">
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
												name="inv_unit" type="text" />
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
										<div class="col-md-1 text-center">
											<button id="kmk" class="btn btn-danger  item_remove"
												type="button"><i class="icon-minus-sign"></i></button>
										</div>
									</div>



								</div>
						
								<br/>
								<div class="row">
									<div class="col-md-6"></div>

									<div class="col-md-2 pull-right">
										<button id="add-item" class="btn btn-info" type="button">
											<i class="icon-plus-sign"></i>
										</button>
									</div>
								</div><br/>


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
												name="total" style="text-align: right;" class="form-control">
										</div>
									</div>
								</div>

								<div class="row ">
									<div class="form-group">
										<div class="col-md-8">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Discount<span>%</span></label>
										</div>
										<div class="col-md-1">
											<div class="input-group pull-right discount">
												<input class="form-control child" type="text" id="disc"
													name="disc" value="0" placeholder="Disc" />
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
												<input type="text" id="vat" name="vat" readonly="readonly"
													class="form-control" value="8" />
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
												name="invoiced_tot" id="invoiced_total"
												style="text-align: right;" class="form-control">
										</div>
									</div>
								</div>


								<br />
								<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<!-- <div>
												<input style="left: 80%; width: 10%;" id="btn_save"
													value="Save" class="btn btn-primary " type="submit">
												<input id="btn_reset" value="Reset" style="width: 10%;"
													class="btn btn-warning " type="reset" /> <a
													class="btn btn-success " style="width: 10%;"
													href="ProductCon?action=list">Cancel</a>
											</div> -->

										</div>
									</div>
								</div>
								<div class="row" style="text-align: center;">


									<div class="col-md-6"></div>
									<div class="col-md-6">
										<button class="btn btn-primary prcd" data-toggle="modal"
											data-target="#formModal">Proceed to Payments</button>
									</div>

									<!-- 	Payment modal  -->
									<div class="col-md-12">
										<div class="modal fade" id="formModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<!-- 	<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title" id="H2">Payment Select</h4>
													</div> -->
													<div class="modal-body">
														<!-- 	// starts here  -->

														<h1>
															id of selected tab: <span id="idDisplay">cash</span>
														</h1>

														<div id="tabs">
															<ul>
																<li><a href="#cash">Cash</a></li>
																<li><a href="#credit">Credit Card</a></li>
																<li class="three"><a href="#subs">Add to Subscription</a></li>
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
																				style="margin-left: 23%" type="text" maxlength="4" value ="0000" placeholder="Card No"
																				name="f4"  tabindex="11" />
																		</div>
																		<div class="col-md-2">
																			<span class="label label-info">Last 4 No</span>
																		</div>
																		<div class="col-md-4">
																			<input class="form-control autotab l4"
																				style="margin-left: 23%" type="text" maxlength="4"placeholder="Card No" value="1111" 
																				name="l4"  tabindex="12" />
																		</div>


																	</div>
																</div>
																</br>
																<div class="form-group">

																	<div class="col-md-8" style="margin-left: 13%;">
																		<select style="width: 60%;"
																			data-placeholder="Your Favorite Type of Bear"
																			class="form-control select-picker bank_drop"
																			data-live-search="true" tabindex="-1"
																			name="bank_name">
																			<option selected="selected">Commercial Bank</option>
																			<option>Sampath Bank</option>
																			<option>HSBC Bank</option>
																			<option>Nations Trust Bank</option>
																			<option>HNB Bank</option>

																		</select>
																	</div>
																</div>
															</div>
															<div id="subs">
																<div class="row">
																	<input readonly placeholder="Total" type="text"
																		id="pay_total" style="text-align: right;"
																		class="form-control">
																</div>
																<div class="row">
																	<input readonly placeholder="Total fee" type="text"
																		id="fee_total" style="text-align: right;"
																		name="fee_total" class="form-control">
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
														<button class="btn btn-primary " type="submit">Check Out</button>
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
	<script src="assets/js/jquery-ui.min.js"></script>
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
		$(document).ready(function() {
							$(".cus_type").on("change",function() {
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

											//$('#user_id').attr('disabled', false);
											$('#b_name').removeAttr('readonly',
													'readonly');
											$('#email').removeAttr('readonly',
													'readonly');
											//	$(".chzn-select").trigger('chosen:updated').chosen();
										}

									});

							$("#user_id").on('change',function() {
												var user_id = $("#user_id").val();
												$.ajax({
															type : 'GET',
															url : 'InvoiceCon?action=user_details&user_id='
																	+ user_id,
															success : function(
																	data) {
																var user = data.record;
																$('#b_name')
																		.val(user.first_name);
																$('#email')
																		.val(user.email);
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
						});
	</script>
	<script>
function onBlur(el) {
    if (el.value == '') {
        el.value = el.defaultValue;
    }
}
function onFocus(el) {
    if (el.value == el.defaultValue) {
        el.value = '';
    }
}
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
		$(document).ready(function() {
							$(".chzn-select").prop('disabled', false).trigger('chosen:updated');
							var index = 1;
							$("#add-item").click(function(e) {
												e.preventDefault();

												var inv_row = $('<div id="inv_row'+index+'"  class="row inv_row" style="margin-top:8px">'
														+ '<div class="col-md-4 text-center" style="margin-left:1%;">'
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
														+ '<div class="col-md-1 text-center">'
														+ '<button  class="btn btn-danger item_remove" id = "kmk" type="button"><i class="icon-minus-sign"></i></button>'
														+ '</div>' + '</div>');
												$(".inv_body").append(inv_row).show('slow');

												$.ajax({
															type : "GET",
															url : "InvoiceCon?action=products",
															dataType : "json",
															beforeSend : function(
																	xhr) {
																$("#inv_item"+ index).empty();
															},
															success : function(data) {
																var div_data = "<option></option>";
																$(div_data).appendTo("#inv_item"+ index);
																$.each(data.record,function(i,obj) {
																					div_data = "<option value=" + obj.productID + ">"
																							+ obj.description
																							+ "</option>";
																					$(div_data).appendTo("#inv_item"+ index);
																				});

																$("#inv_item"+ index).chosen().trigger("chosen:updated");
																index++;
															}

														});

											});//END (add-item)

							$('.inv_body').on('click', '#kmk', function() {
								this.closest(".inv_row").remove();
								totalCal();

							});
										// to hide sub non registered members	
											$('.prcd').on('click',function(){
												var cus_type;
												var res = $('input[name=cus_type]:checked').val();
												
												if(res == "un_rg"){
												$('li.three').hide();
												$('#user_id').val("1");
												
												} else if(res != "un_rg")
													$('li.three').show();
											
												
											});
										
											

							$("body").on('change',".inv_item",function() {
												var id = this.id;

												var product_id = this.value;

												var current_id = id.replace(
														"inv_item", "");
												
												$.ajax({
															method : 'GET',
															url : 'ProductCon?action=products&product_id='+ product_id,
															success : function(data,status) {
																console
																		.log(data.record);
																var product = data.record;

																$("#inv_price"+ current_id)
																		.val(product.sellingPrice);
																$("#inv_unit"+ current_id).val(product.measuringUnit);

															}
														});

											});

							//SUubTotal calcuation

							$("body").on("keyup","[id^='inv_qty']",function() {
										elementID = this.id.replace("inv_qty","");

										/* alert($("#inv_qty"+elementID).val()); */
										qty = $("#inv_qty" + elementID).val();
										price = +($("#inv_price" + elementID).val());
										subtotal = qty * price;
										$("#inv_sub_total" + elementID).val(
												subtotal.toFixed(2));
										totalCal();

									});
							//		Calcuate Grand total 
							function totalCal() {
								var count = Number($("[id^='inv_sub_total']")
										.last().attr('id').replace("inv_sub_total", ""));

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
								calVat();

							}

							// Clculate Vat%
							function calVat() {
								var vat = parseInt($('#vat').val());
								total = $('#total').val();
								vat_final = total * (1 + vat / 100);
								$('#invoiced_total').val(vat_final.toFixed(2));
							}
							// Calculate Discount	

							function discountCal() {

								var total = $('#invoiced_total').val();

								var disc_rate = parseInt($("#disc").val());
								// $('#disc').val(disc_rate)

								discounted_val = total * (1 - disc_rate / 100);

								$('#invoiced_total').val(
										discounted_val.toFixed(2));

							}
							$('.discount').on('keyup change', '#disc',
									function() {
										totalCal();
										discountCal();
									});

							$('.prcd').on('click', function() {
								total = $('#invoiced_total').val();
								$('#pay_total').val(total);
								$('#fee_total').val(total);
							
								
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
							$(function() {
								formValidation();
							});
							$("#invoiceForm").submit(function(e) {
												e.preventDefault();
												//alert("adad");
												if (!$("#invoiceForm").valid())
													return false;

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
																$
																		.ajax({
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