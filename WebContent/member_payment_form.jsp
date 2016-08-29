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
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
				<form id="memPaymentForm" class="form-horizontal" align="center"
					method="post" action="MemberCon" novalidate>

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
								<br />
								
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label class="control-label col-md-5" style="float: right;">Select Member</label>
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
										<br/>
											<div id="lbl_status"></div>
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
											<input type="text" id="due_payment" name="due_payment" readonly="readonly"
											 class="form-control" style="text-align:right;"
												value="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="limiter" class="control-label col-md-5"
												style="float: right;">Activation Period</label>
										</div>
										<div class="col-md-2 text-center">
											<div id="sandbox-container">
											<div class="input-group date">
												<input type="text" placeholder="YYYY-MM-DD" name="date"
													id="date" class="all form-control my_date"><span
													class="input-group-addon"><li class= "glyphicon glyphicon-th"></li></span>
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
												style="float: right;">Total Payment</label>
										</div>
										<div class="col-md-2">
											<input type="text" id="total_payment" name="total_payment" 
											 class="form-control" style="text-align:right;"
												value="" />
										</div>
									</div>
								</div>

									<div class="col-md-6"></div>
									<div class="col-md-6">
										<button class="btn btn-primary" >Payment Done</button>
									</div>

							</div>
						</div>
					</div>

				</form>
			</div>
		</div>

	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>

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
<script>
$('document').ready(function(){
	dropdownList("MemberCon?action=members","#mem_id");

		
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
	
	$("#mem_id").on('change',function() {
		var mem_id = $("#mem_id").val();
		$.ajax({
					type : 'GET',
					url : 'MemberFeeCon?action=mem_status&user_id='
							+ mem_id,
					success : function(
							data) {
						var member_status = data.record;
						if (member_status.status == 0){
							$("#lbl_status").empty().append("<span class='label label-danger'>Inactive</span>");
						}else if(member_status.status == 1){
							$("#lbl_status").empty().append("<span class='label label-success'>Active</span>");
						}else if(member_status.status == 2){
							$("#lbl_status").empty().append("<span class='label label-warning'>Pending</span>");

						}
					}

				});
		
	});
	$("#mem_id").on('change',function() {
		var mem_id = $("#mem_id").val();
		$.ajax({
			type : 'GET',
			url : 'MemberFeeCon?action=getSubs&user_id='
					+ mem_id,
			success : function(
					data) {
				var member_subs = data;
				$('#due_payment').val(member_subs);
			}

		});
});
	$('#total_payment').on('keyup',function(){
		
	
	var dot = $('#total_payment');
	$(('#total_payment').val(dot).toFixed(2));
	});
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

</body>
</html>