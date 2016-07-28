<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
							<h5>Instructor header</h5>
							</header>

							<form id="instructorForm" class="form-horizontal" align="center"
								novalidate>


								</br>
						
									<div class="row">
									<div class="form-group">
										<label class="control-label col-md-4">Instructor Type</label>

										<div class="col-md-8">
											<div class="checkbox">
												<label> <input class="uniform ins_type" type="radio"
													name="ins_type" value="rg" /> Registered User
												</label> <label> <input class="uniform ins_type"
													type="radio" name="ins_type" value="un_rg"
													checked="checked" /> Other
												</label>
											</div>


										</div>
									</div>
								</div>
									<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label style="float: right;"> Instructor ID </label>
										</div>
										<div class="col-md-4">
											<select name="ins_id" class="form-control chzn-select keep"
												id="ins_id">
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
											<input type="text" id="ins_name" name="ins_name"
												placeholder="Instructor Name" class="form-control" value="" />
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
												placeholder="E-mail" class="form-control" />

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
								<div  class="inv_row" id="inv_row0">
									<div class="col-md-2 text-center">
										<select id = "inv_item0" class="form-control chzn-select inv_item">
											<option></option>
										</select>
									</div>
									<div class="col-md-2 text-center">
										<input class="form-control inv_price" name="inv_price" id= "inv_price0" type="text" name="inv_price" />
									</div>
									<div class="col-md-2 text-center">
										<input class="form-control inv_unit" name="inv_unit" id= "inv_unit0" type="text" />
									</div>
									<div class="col-md-2 text-center">
										<input class="form-control inv_qty" name="inv_qty" id= "inv_qty0"type="text" />
									</div>
									<div class="col-md-2 text-center">
										<input class="form-control inv_sub_total" name="inv_sub_total" id= "inv_sub_total0"type="text" />
									</div>
									<div class="col-md-2 text-center">
										<button  class="btn btn-danger item_remove" id = "kmk" type="button">Remove</button>
									</div>
								</div>
									<br />
								
								</div>
							
								<div class="row">
									<div class="col-sm-10"></div>
									<div class="col-sm-2 pull-right">
										<button id="add-item" class="btn btn-primary"
											type="button">Add</button>
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
	
	$('.ins_type').on('change',function(){
		var cus_type = $(this).val();
		if(cus_type== "rg"){
			$('#ins_name').attr('readonly','readonly');
			$('#email').attr('readonly','readonly');
			
			$('#ins_id').prop('disabled',false).trigger('chosen:update');
			dropdownList("InsCon2?action=users",'#ins_id');
		}else{
			$('#ins_id').empty();
			$('#ins_id').prop('disabled',true).trigger('chosen:update');
			
			$('.keep').closest(".chzn-select").prop('disabled', false).trigger('chosen:updated');
			
			$('#ins_name').removeAttr('readonly',
			'readonly');
	$('#email').removeAttr('readonly',
			'readonly');
		}
	
	});
	
	$('#ins_id').on('change',function(){
		var ins_id  = $(this).val();
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'InsCon2?action=user_details&ins_id=' + ins_id,
					success : function(data){
						var ins_rst = data.record;
						
						$('#ins_name').val(ins_rst.ins_name);
						$('#email').val(ins_rst.ins_email);
						
					}
					
		});
		
	});
/* 	$('#ins_id').on('change',function(){
		var ins_id = $(this).val();
			$.ajax({
			type : 'GET',
			dataType: 'json',
			url : 'InsCon2?action=user_details&ins_id='+ ins_id,
					success: function(data){
						var users  = data.record;
					
						$('#ins_name').val(users.ins_name);
						$('#email').val(users.ins_email);
						
						
					}
		});
		
	}); */
	
	function dropdownList(url,id){
		
		$.ajax({
			type: 'GET',
			url : "" + url + "",
			dataType: 'json',
			beforeSend: function(){
				$(id).empty();
			},
			success : function(data){
			var div_data  = "<option></option>"
			$(div_data).appendTo(id);
			$.each(data.record,function(i,obj){
				div_data = "<option value=" + obj.ins_id + ">"
				
				+ obj.ins_id
				+ " "
				+ obj.ins_name
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
	type : 'GET',
	url: 'InvoiceCon?action=products',
			dataType: 'json',
			beforeSend : function(xhr){
				$('inv_item0').empty();
			},
			success : function(data){
				var div_data = "<option></option>";
				$(div_data).appendTo('#inv_item0');
				$.each(data.record,function(i,obj){
					div_data = "<option value = " +obj.productID+ ">"
					+ obj.description + "</option>";
					$(div_data).appendTo('#inv_item0');
				});
				$('#inv_item0').chosen().trigger("chosen:updated");
			}
});

</script>
<script>

$(document).ready(function(){
	
	$(".chzn-select").prop('disabled', false).trigger(
	'chosen:updated');
	
	var index = 1;
	$('#add-item').click(function(e){
		e.preventDefault();
		
		var inv_row = $('<div  class="inv_row '+index+' ">'
				+'<div class="col-md-2 text-center">'
				+'<select  class=" inv_item form-control chzn-select " id="inv_item'+index+'" name="inv_item">'
				+	'<option></option>'
				+'</select>'
			+'</div>'
			+'<div class="col-md-2 text-center">'
				+'<input class="form-control inv_price '+index+'" type="text" />'
			+'</div>'
			+'<div class="col-md-2 text-center">'
				+'<input class="form-control inv_unit'+index+'" type="text" />'
			+'</div>'
			+'<div class="col-md-2 text-center">'
				+'<input class="form-control inv_qty'+index+'" type="text" />'
			+'</div>'
			+'<div class="col-md-2 text-center">'
				+'<input class="form-control inv_sub_total'+index+'" type="text" />'
			+'</div>'
			+'<div class="col-md-2 text-center">'
				+'<button  class="btn btn-danger item_remove" id = "kmk" type="button">Remove</button>'
			+'</div>'
	+	'</div>');
		$('.inv_body').append(inv_row);
		
		$.ajax({
			type : "GET",
			url : 'InvoiceCon?action=products',
					dataType : 'json',
					beforeSend : function(xhr){
						
						$('.inv_item'+index).empty();
						
					},
					success : function(data){
						var div_data = "<option></option>";
						/* $(div_data).appendTo('#inv_item' + index); */
						$.each(data.record,function(i,obj){
							div_data = "<option value ="+ obj.description +">"
							+obj.description
							+"</option>";
							$(div_data).appendTo('#inv_item' + index);
							
						});
						$('#inv_item'+index).chosen().trigger("chosen:updated");
						index++;
					}
		});
		
		
		
		
		
	});

	$('.inv_body').on('click', '#kmk', function() {
		this.closest(".inv_row").remove();
		totalCal();
	});
	$('body').on('change','.inv_item',function(){
		
		var id = this.id;
		var product_id = this.value;
		alert(product_id);
		var current_id = id.replace('inv_item',"");
		$.ajax({
			method : 'GET',
			url: 'ProductCon?action=products&product_id='
				+ product_id,
				success : function(data,status){
					console.log(data.record);
					var product = data.record;
					
					$('#inv_price' + current_id).val(product.sellingPrice);
					$(
							"#inv_unit"
									+ current_id)
							.val(
									product.measuringUnit);
				}
		});
		
	});
});
</script>
</body>
</html>