<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule Form</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />

<link rel="stylesheet" href="assets/css/sweetalert.css" />
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="SheduleCon?action=insert">Add Schedule</a></li>
    </ul>
				<div class="panel panel-default style="margin-top:-1%;">
					<div class="panel-heading">
					Add Member Shedules
			</div>
					<div class="panel-body">
						<form action="SheduleCon" id="sheduleForm" method="POST"
							enctype="multipart/form-data">


							<div class="row">
								<div class="form-group">
									<div class="col-md-12">
										<div class="col-md-3">
											<label> Shedule ID </label> <input class="form-control"
												name="shedule_id" value="${shedule_id}" readonly="readonly" />
										</div>
										<div class="col-md-3">
											<label> Instructor Name</label> <input class="form-control" style="margin-left: 2%;"
												name="ins_name" value=${currentSessionUser.first_name }
												readonly="readonly" />
										</div>
									</div>
								</div>
								

							</div>
							</br> 
						<!-- 	<div class="row">
								<div class="col-sm-2">
									<div class="form-group"></div>
								</div>
							</div> -->
							<div class="row inv_row" id="row" style="margin-left: 0%;">
								<div class="col-md-3">
									<select name="user_id" class="form-control chzn-select"
										id="user_id">
										<option></option>
									</select>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<input id="first_name" readonly="readonly"
											class="form-control" name="first_name"
											placeholder="First Name" />

									</div>
								</div>
								<div class="col-md-3 text-center">
									<input id="last_name" readonly="readonly" class="form-control"
										name="last_name" placeholder="Last Name" />
								</div>
								<div class="col-md-3 text-center">
									<input id="email" readonly="readonly" name="email"
										class="form-control" placeholder="Email" />
								</div>

							<div class="form-group">
									<div class="row">
																	<div class="col-md-8" style="margin-left: 13%;" >
																	<label for="text2" class="control-label col-md-3" style="margin-left: -20%;">Workchart Name</label>
																	</div>
																	</div>
																	<div class="row">
																	<div class="col-md-3" style="margin-left: 1%;">
																		<select
																			data-placeholder="Your Favorite Type of Bear"
																			class="form-control chzn-select bank_drop" id="drop2"
																			data-live-search="true" tabindex="-1"
																			name="bank_name">
																			<option></option>
																			<option></option>
																			<option></option>
																			<option></option>
																			<option></option>

																		</select>
																		</div>
																		</div>
																	
																</div>

							</div>
							<hr />
							<div class="col-md-1">
							</div>
							<div class="row">
								<div class="col-md-4 text-center">
									<strong>Exercise ID</strong>
								</div>

								<div class="col-md-2 text-center">
									<strong>Sets per rep</strong>
								</div>

								<div class="col-md-2 text-center">
									<strong>No of Reps</strong>
								</div>
								<div class="col-md-2 text-center">
									<strong></strong>
								</div>
							</div>
							
							<div class="inv_body">
							
								<div class="row inv_row" id="exer">
								<div class="col-md-1">
							</div>
									<div class="col-md-4 text-center" style="margin-left: 1%;">
										<select id="exercise0" name="exercise"
											class="form-control chzn-select inv_item keep">

										</select>
									</div>
									<div class="col-md-2 text-center">
										<input id="set_per_rep0" style="text-align: right;"
											class="form-control inv_price" name="set_per_rep" type="text" />
									</div>

									<div class="col-md-2 text-center">
										<input class="form-control" name="no_of_rep" id="no_of_rep0"
											type="text" style="text-align: right;" />
									</div>
									<div class="col-md-1 text-center">
										<button id="kmk" class="btn btn-danger  item_remove"
											type="button">
											<i class="icon-minus-sign"></i>
										</button>
									</div>
								</div>



							</div>

							<br />
							<div class="row">
								<div class="col-md-6"></div>

								<div class="col-md-3 pull-right">
									<button id="add-item" class="btn btn-info" type="button">
										<i class="icon-plus-sign"></i>
									</button>
								</div>
							</div>
							<br />


							<div class="row">
								<div class="form-actions no-margin-bottom"
									style="text-align: center;">
									<div class="col-sm-3"></div>
									<div class="col-sm-6">
										<div style="margin-left: -16%;">
											<%
												String role = currentUser.getRole();

												if (role.equals("administrator")) {
											%>
											<button type="submit" class="btn-sm btn-success">Save</button>
											<%
												} else if (role.equals("instructor")) {
											%>
											<button type="submit" class="btn-sm btn-success">Save</button>
											<%
												}
											%>
											<input id="btn_reset" value="Reset"
												class="btn btn-warning btn-sm" type="reset" /> <a
												class="btn btn-primary btn-sm" href="ProductCon?action=list">Cancel</a>
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


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>

	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/sweetalert.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
	<script src="assets/js/validationInit.js"></script>
	<!--END PAGE LEVEL SCRIPT-->



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
$(document).ready(function(){
	$.ajax({
		type : "GET",
		url : "SheduleCon?action=getWorkOutNames",
		dataType : "json",
		beforeSend : function(xhr) {
			$("#drop2").empty();
		},
		success : function(data) {
			var div_data = "<option></option>";
			$(div_data).appendTo("#drop2");
			$.each(data.record, function(i, obj) {
				div_data = "<option value=" + obj.workout_id + ">"
						+ obj.workout_name + "</option>";
				$(div_data).appendTo("#drop2");
			});
			$("#drop2").chosen().trigger("chosen:updated");
		}
	});
	
});
</script>
<script>
$(document).ready(function(){
	$.ajax({
		type : "GET",
		url : "SheduleCon?action=exercises",
		dataType : "json",
		beforeSend : function(xhr) {
			$("#exercise0").empty();
		},
		success : function(data) {
			var div_data = "<option></option>";
			$(div_data).appendTo("#exercise0");
			$.each(data.record, function(i, obj) {
				div_data = "<option value=" + obj.exercise_id + ">"
						+ obj.description + "</option>";
				$(div_data).appendTo("#exercise0");
			});
			$("#exercise0").chosen().trigger("chosen:updated");
		}
	});
})
</script>
	<script>
		$(document).ready(function() {
		//	$('.bank_drop').selectpicker();
			
			$("#drop2").on('change',function(){
				var work_id= $('#drop2').val();
								
					$.ajax({
					type:'GET',
					url:"SheduleCon?action=getOneWorkout&work_id="+work_id,
					success:function(data){
						
						$.each(data.record,function(i,obj){
							var row='<div class="row inv_row" id="exer">'+
								'<div class="col-md-1"></div><div class="col-md-4 text-center" style="margin-left: 1%;">'+
							'<select id="exercise0" name="exercise" value="'+obj.workout_name+'" class="form-control chzn-select inv_item keep">'
							+'</select>'
						+'</div>'
						+'<div class="col-md-2 text-center">'
						+	'<input id="set_per_rep0" style="text-align: right;"'
						+		'class="form-control inv_price" name="set_per_rep" value="'+obj.sets_per_rep+'" type="text" />'
						+'</div>'
						+'<div class="col-md-2 text-center">'
						+	'<input class="form-control" name="no_of_rep" value="'+obj.no_of_reps+'" id="no_of_rep0"'
						+		'type="text" style="text-align: right;" />'
						+'</div>'
						+'<div class="col-md-1 text-center">'
						+	'<button id="kmk" class="btn btn-danger  item_remove"'
						+		'type="button">'
						+		'<i class="icon-minus-sign"></i>'
						+	'</button>'
						+'</div>'
						+'</div>';
					
						$('.inv_body').append(row);
						$(".keep").chosen().trigger("chosen:updated");
						});
						
					}
					
				});
			});
		});
		
		
	</script>
	<script>
		$(document).ready(function() {

							dropdownList("SheduleCon?action=users", "#user_id");

							$("#user_id").on('change',function() {
												var user_id = $("#user_id").val();
												$.ajax({
															type : 'GET',
															url : 'InvoiceCon?action=user_details&user_id='
																	+ user_id,
															success : function(
																	data) {
																var user = data.record;
																$('#first_name')
																		.val(user.first_name);
																$('#email')
																		.val(user.email);
																$('#last_name')
																		.val(user.last_name);
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
			url : "SheduleCon?action=exercises",
			dataType : "json",
			beforeSend : function(xhr) {
				$("#exercise0").empty();
			},
			success : function(data) {
				var div_data = "<option></option>";
				$(div_data).appendTo("#exercise0");
				$.each(data.record, function(i, obj) {
					div_data = "<option value=" + obj.exercise_id + ">"
							+ obj.description + "</option>";
					$(div_data).appendTo("#exercise0");
				});
				$("#exercise0").chosen().trigger("chosen:updated");
			}
		});
		$(document)
				.ready(
						function() {
							$(".chzn-select").prop('disabled', false).trigger('chosen:updated');
							var index = 1;
							$("#add-item").click(function(e) {
												e.preventDefault();

												var inv_row = $('<div class="row inv_row" id="exer_row'+index+'">'
														+ '<div class="col-md-1"></div><div class="col-md-4 text-center" style="margin-left:1%;">'
														+ '<select id="exer'+index+'" name="exercise"'
												+ 'class="form-control chzn-select keep">'
														+ '</select>'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input id="set_per_rep'+index+'"'
												+'class="form-control" style="text-align: right;" name="set_per_rep"'
												+' type="text" />'
														+ '</div>'
														+ '<div class="col-md-2 text-center">'
														+ '<input class="form-control" name="no_of_rep"'
												+'id="no_of_rep'+index+'" style="text-align: right;" type="text"'
												+'style="text-align: right;" />'
														+ '</div>'
														+ '<div class="col-md-1 text-center">'
														+ '<button id="kmk" class="btn btn-danger  item_remove"'
												+'type="button"><i class="icon-minus-sign"></i></button>'
														+ '</div>' + '</div>');
												$(".inv_body").append(inv_row)
														.show('slow');

												$
														.ajax({
															type : "GET",
															url : "SheduleCon?action=exercises",
															dataType : "json",
															beforeSend : function(
																	xhr) {
																$("#exer"+ index).empty();
															},
															success : function(
																	data) {
																var div_data = "<option></option>";
																$(div_data)
																		.appendTo("#exer"+ index);
																$.each(data.record,function(i,obj) {
																					div_data = "<option value=" + obj.exercise_id + ">"
																							+ obj.description
																							+ "</option>";
																					$(
																							div_data).appendTo("#exer"+ index);
																				});

																$("#exer"+ index).chosen().trigger("chosen:updated");
																index++;
															}

														});

											});//END (add-item)

							/* $("body").on('change',".inv_item",function() {
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

							}); */

							$('.inv_body').on('click', '#kmk', function() {
								this.closest(".inv_row").remove();

							});
							$('#exer0').on('change', function() {
								alert($('#exer0').val());

							});
						});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$(function() {
								formValidation();
							});
							$("#sheduleForm")
									.submit(
											function(e) {
												e.preventDefault();
												//alert("adad");
												if (!$("#sheduleForm").valid())
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
																			url : "SheduleCon",
																			data : $("#sheduleForm").serialize(),
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