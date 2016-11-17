<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stock</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
	<link rel="stylesheet" href="assets/css/sweetalert.css" />
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="margin-top:1%;">
			<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="StockCon?action=insert">Add Inventory</a></li>
    </ul>
<form id="stockForm" class="form-horizontal" align="center"
					method="post" action="StockCon" novalidate>

				<div class="row page">
					<div class="col-lg-12">
						<div class="box dark staticParent">
						
							<div class="row">
							<div class="col-md-1 text-center">
	<span style="font-size:154px; font-family: Calibri; color:#455862; border-color:#DCFFFF; background-color:#DCFFFF;"><input readonly id="series_id" class="form-control hidden"
										name="series_id" value="${series_id}" id="inv_price0"
										type="text" /></span></div></div>
							<br />
							<div class="row">
								<div class="col-md-4 text-center">
									<strong>Item</strong>
								</div>
								<div class="col-md-2 text-center">
									<strong>Expire Date</strong>
								</div>
								<div class="col-md-2 text-center">
									<strong>Batch No</strong>
								</div>
								<div class="col-md-1 text-center" id="">
									<strong>Qty</strong>
								</div>
							
								<div class="col-md-2 text-center">
									<strong></strong>
								</div>
							</div>
							<div class="inv_body">
								<div class="row inv_row" id="inv_row0">
									<div class="col-md-4 text-center" style="margin-left: 1%;">
										<select id="inv_item0" name="inv_item"
											class="form-control chzn-select inv_item keep">

										</select>
									</div>
									<div class="col-md-2 text-center">
											<div id="sandbox-container">
											<div class="input-group date">
												<input type="text" placeholder="YYYY-MM-DD" name="dob"
													id="dob0" class="all form-control my_date"><span
													class="input-group-addon"><li class= "glyphicon glyphicon-th"></li></span>
											</div>
											<label for="dob" class="error"></label>
										</div>
									</div>
									<div class="col-md-2 text-center">
										<input readonly id="batch_no0" class="form-control"
											name="batch_no" type="text" />
									</div>
									<div class="col-md-1 form-group text-center "style="margin-left: 0%;">
										<input class="form-control child" name="qty" id="qty0"
											type="text" />
									</div>
							
									<div class="col-md-1 text-center" style="margin-left: 1.2%;">
										<button id="kmk" class="btn btn-danger  item_remove"
											type="button">
											<i class="icon-minus-sign"></i>
										</button>
									</div>

							</div>
					
						</div>
						
							<div class="row">
								<div class="col-md-6"></div>

								<div class="col-md-2 pull-right">
									<button id="add-item" class="btn btn-info" type="button">
										<i class="icon-plus-sign"></i>
									</button>
								</div>
							</div>
								<div class="modal-footer">
													
														<button class="btn btn-primary " type="submit">Add Stock</button>
													</div>
					
					</div>
				</div>





			</div>
				</form>
		</div>

	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>.
		<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
				<script src="assets/js/sweetalert.min.js"></script>
			<script src="assets/js/validationInit.js"></script>
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

$.ajax({
	type : "GET",
	url : "StockCon?action=products",
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


</script>
<script>
$(document).ready(function(){
	$(".chzn-select").prop('disabled', false).trigger('chosen:updated');

	var index = 1;
	$('#add-item').click(function(e){
		e.preventDefault();
		
		var inv_row = $('<div class="row inv_row" id="inv_row'+index+'">'
				+'<div class="col-md-4 text-center" style="margin-left: 1%;">'
				+ '<select id="inv_item'+index+'" name="inv_item"'
				+	'class="form-control chzn-select inv_item keep">'
				+'</select>'
				+'</div>'
			    +'<div class="col-md-2 text-center">'
				+	'<div id="sandbox-container">'
				+	'<div class="input-group date">'
				+		'<input type="text" placeholder="YYYY-MM-DD" name="dob"'
				+			'id="dob'+index+'" class="all form-control my_date"><span class="input-group-addon"><li class= "glyphicon glyphicon-th"></li></span>'
				+'	</div>'
				+	'<label for="dob" class="error"></label>'
				+'</div>'
				+'</div>'
				+'<div class="col-md-2 text-center">'
				+'<input readonly id="batch_no'+index+'" class="form-control"'
				+'name="batch_no" type="text" />'
			+'</div>'
			+'<div class="col-md-1 text-center ">'
				+'<input class="form-control child" name="qty" id="qty'+index+'"'
					+'type="text" />'
			+'</div>'
			+'<div class="col-md-1 text-center">'
				+'<button id="kmk" class="btn btn-danger  item_remove"'
					+'type="button">'
					+'<i class="icon-minus-sign"></i>'
				+'</button>'
			+'</div>'

	+'</div>');
		$(".inv_body").append(inv_row);
		
	/* 	add date picker  */
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
		
		/* end	add date picker  */
		$.ajax({
			type : "GET",
			url : "StockCon?action=products",
			dataType : "json",
			beforeSend : function(xhr) {
				$("#inv_item"+ index).empty();
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
				index++;
			}
		});
	});
	
	
	$('.inv_body').on('click', '#kmk', function() {
		this.closest(".inv_row").remove();
		
	});
	
	// get the top most batch number.
 	 $(".inv_body").on('changeDate','input[id^="dob"]',function() {

 		
		var id = this.id;
		// alert(id);
		var current_id = id.replace("dob","");
		//alert(current_id);
		var date = $(('#dob')+current_id).val();
		console.log(date);
	
		
		var product_id = $('#inv_item'+current_id).val();
		
		console.log(product_id);
		$.ajax({
					method : 'GET',
					 url : 'StockCon?action=getBatch&prd_id='+ product_id+'&date='+ date,
					 success : function(data,status) {
							console.log(data);
							var batch = data;

							$("#batch_no"+ current_id).val(batch);
											}
						//$("#inv_price"+ current_id)
						//		.val(product.sellingPrice);
						//$("#inv_unit"+ current_id).val(product.measuringUnit);

					
				}); 

	}); 
	
  
 	
 	

/*  	$(".inv_body").on('click','button[id^="add"]',function() {

 		
		var id = this.id;
		// alert(id);
		var current_id = id.replace("add","");
		//alert(current_id);
		var addButton = $(('#add')+current_id).val();
		var prd_id  = $(('#inv_item')+current_id).val();
		var date = $(('#dob')+current_id).val();
		var batch_no = $("#batch_no"+ current_id).val();
		var qty = $("#qty"+current_id).val();
		$.ajax({
					method : 'POST',
					 url : 'StockCon',
				     data : "{'productID':'" + prd_id+ "', 'date':'" + date+ "', 'batchNo':'" + batch_no+ "','quantity':'" + qty+ "'}",
					 success : function(data,status) {
							console.log(data);
							var batch = data;

							$("#batch_no"+ current_id).val(batch); 
							
					

					
						//$("#inv_price"+ current_id)
						//		.val(product.sellingPrice);
						//$("#inv_unit"+ current_id).val(product.measuringUnit);
						}
		
	});
	
}); */

});

</script>

<script type="text/javascript">
		$(document).ready(function() {
							/* $(function() {
									$('#dp3').datepicker();
								});  */
							$(function() {
								formValidation();
							});
 
							$("#stockForm").submit(function(e) {
												e.preventDefault();

												 if (!$("#stockForm").valid())
													return false; 

												$.ajax({
															type : "POST",
															url : "StockCon",
															data : $("#stockForm").serialize(),

															success : function(result) {

																if (result == 'true') {

																	swal(
																			{
																				title : "Stock Added !",
																				text : "You Added a new Stock Series!",
																				type : "success",
																				showCancelButton : false,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "OK!",
																				closeOnConfirm : true
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

											});
						});
	</script>

</body>
</html>