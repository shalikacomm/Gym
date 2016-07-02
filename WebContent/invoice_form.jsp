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

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

				<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<header>
							<div class="icons">
								<i class="icon-glass"></i>
							</div>
							<h5>Invoice Header Details</h5>
							</header>

							<form id="invoiceForm" class="form-horizontal" align="center"
								novalidate>


								</br>
								<div class="row">
									<div class="form-group">
										<label class="control-label col-md-4">Customer Type</label>

										<div class="col-md-8">
											<div class="checkbox">
												<label> <input class="uniform cus_type" type="radio"
													name="cus_type" value="rg" /> Registered User
												</label> <label> <input class="uniform cus_type"
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
												placeholder="Selling Price" class="form-control" />

										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div>
												<input style="left: 80%; width: 15%;" id="btn_save"
													value="Save" class="btn btn-success btn-lg " type="submit">
												<input id="btn_reset" value="Reset"
													class="btn btn-warning btn-lg " type="reset" /> <a
													class="btn btn-primary btn-lg"
													href="ProductCon?action=list">Cancel</a>
											</div>

										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<header>
							<div class="icons">
								<i class="icon-glass"></i>
							</div>
							<h5>Invoice Item Details</h5>
							</header>

							<form id="invoiceForm" class="form-horizontal" align="center"
								novalidate>
								<div class="row">
									<div class="col-md-2 text-center">
										<strong>Item</strong>
									</div>
									<div class="col-md-2 text-center">
										<strong>Std. Price</strong>
									</div>
									<div class="col-md-2 text-center">
										<strong>Unit</strong>
									</div>
									<div class="col-md-2 text-center">
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
									<div class="row inv_row">
										<div class="col-md-2 text-center">
											<select id="inv_item0" class="form-control chzn-select inv_item">
								
											</select>
										</div>
										<div class="col-md-2 text-center">
											<input readonly id="inv_price0" class="form-control inv_price" type="text" />
										</div>
										<div class="col-md-2 text-center">
											<input readonly id="inv_unit0" class="form-control inv_unit" type="text" />
										</div>
										<div class="col-md-2 text-center">
											<input class="form-control inv_qty" type="text" />
										</div>
										<div class="col-md-2 text-center">
											<input class="form-control inv_sub_total" type="text" />
										</div>
										<div class="col-md-2 text-center">
											<button id="kmk" class="btn btn-danger  item_remove" type="button">Remove</button>
										</div>
									</div><br />
									

								</div>

								<div class="row">
									<div class="col-sm-10"></div>
									<div class="col-sm-2 pull-right">
										<button id="add-item" class="btn btn-primary" type="button">Add</button>
									</div>
								</div>
								<br />

							</form>
						</div>
					</div>
				</div>



			</div>
		</div>

		<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>

	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script>
		$(function() {
			formValidation();
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
											//	$('#user_id').removeAttr('readonly','readonly');
											//	$(".chzn-select").trigger('chosen:updated').chosen();
											$(".chzn-select").prop('disabled',
													false).trigger(
													'chosen:updated');
											// $(this).prop('disabled',false).trigger('chosen:updated');
											dropdownList(
													"InvoiceCon?action=users",
													"#user_id");

										} else {
											$("#user_id").empty();
											$(".chzn-select").prop('disabled',
													true).trigger(
													'chosen:updated');
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
							var index=1;
							$("#add-item")
									.click(
											function(e) {
												e.preventDefault();
											

												var inv_row = $('<div  class="row inv_row">'
														+ '<div class="col-md-2 text-center">'
														+ '<select id="inv_item'+index+'"  class="form-control chzn-select inv_item">'
														+ '<option></option>'
														+ '</select>'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input readonly class="form-control" id="inv_price'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input readonly class="form-control"  id ="inv_unit'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input class="form-control" id = "inv_qty'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input class="form-control" id="inv_sub_total'+index+'" type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<button  class="btn btn-danger item_remove" id = "kmk" type="button">Remove</button>'
														+ '</div>' + '</div><br />');
												$(".inv_body").append(inv_row);

												$.ajax({
													type : "GET",
													url : "InvoiceCon?action=products",
													dataType : "json",
													beforeSend : function(xhr) {
														$("#inv_item"+index).empty();
													},
													success : function(data) {
														var div_data = "<option></option>";
														$(div_data).appendTo("#inv_item"+index);
														$.each(data.record, function(i, obj) {
															div_data = "<option value=" + obj.productID + ">"
																	+ obj.description + "</option>";
															$(div_data).appendTo("#inv_item"+index);
														});
													
														$("#inv_item"+index).chosen().trigger("chosen:updated");
														index ++;
													}
													
												});
							
										

											});//END (add-item)


							$('.inv_body').on('click', '#kmk', function() {
								this.closest(".inv_row").remove();
								/* 	$(this).remove();
								 e.preventDefault(); */
							});
								
											$("body").on('change',".inv_item",function(){
												var id= this.id;
												var product_id=this.value;
												var current_id=id.replace("inv_item","");
											
											
													jQuery.ajax({
														method : 'GET',
														url : 'ProductCon?action=products&product_id=' + product_id,
														success : function(data, status) {
															console.log(data.record);
															var product = data.record;
															$("#inv_price"+current_id).val(product.sellingPrice);
															$("#inv_unit"+current_id).val(product.measuringUnit);
														
														}
													});

												
												
												
											});
																						
						});
	</script>
</body>
</html>