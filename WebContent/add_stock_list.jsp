<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css" />
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;  margin-top:1%;">


				<div class="row">
					<div class="col-lg-12">
						<div class="box dark">
							<header>
							<div class="icons">
								<i class="icon-glass"></i>
							</div>
							<h5>Enter Product Details</h5>
							</header>

							<form id="productForm" class="form-horizontal" align="center"
								novalidate>


								</br>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label class="control-label col-md-5" style="float: right;">Product
												ID</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="prd_id" name="prd_id"
												readonly="readonly" class="form-control"
												value="${prd_id}<c:out value="${productobj.productID}" />" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="limiter" class="control-label col-md-5"
												style="float: right;">Description</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="desc" name="desc"
												placeholder="Product description" class="form-control"
												value="<c:out value="${productobj.description}" />" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Purchase Price</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="p_price" name="p_price"
												placeholder="Purchase Price" class="form-control"
												value="<c:out value="${productobj.purchasePrice}" />" />
										</div>


									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5"
												style="float: right;">Selling Price</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="s_price" name="s_price"
												placeholder="Selling Price" class="form-control"
												value="<c:out value="${productobj.sellingPrice}" />" />

										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label class="control-label col-md-5 style="
												style="float: right;">Measuring Unit</label>
										</div>
										<div class="col-md-4">
											<select name="unit_id"
												value="<c:out value ='${productobj.measuringUnit}'/>"
												class="form-control chzn-select" id="units">
												<option value="packet">packets</option>
												<option value="bottles">bottles</option>
												<option value="kg">kg</option>
												<option value="ml">ml</option>

											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-4">
											<label for="text1" class="control-label col-md-5 style="
												style="float: right;">Re-order Level</label>
										</div>
										<div class="col-md-4">
											<input type="text" id="r_level" placeholder="Re-order Level"
												name="r_level" class="form-control"
												value="${r_level}<c:out value="${productobj.reorderLevel}" />" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div>
												<input style="left: 118%; width: 15%;" id="btn_save"
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





			</div>
		</div>

	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
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
</body>
</html>