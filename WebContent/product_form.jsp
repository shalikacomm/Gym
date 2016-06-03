<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter your Product</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="assets/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->
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
							<h5>Enter Product Details</h5>
							</header>

							<form class="form-horizontal" align="center" action="ProductCon"
								method="POST">


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
											<input type="text" id="text1" name="desc"
												placeholder="Product description" class="form-control"
												value="<c:out value="${productobj.description}" />" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
<div class="col-md-4">
										<label for="text1" class="control-label col-md-5" style="float: right;" >Purchase
											Price</label>
</div>
										<div class="col-md-4">
											<input type="text" id="text1" name="p_price"
												placeholder="Purchase Price" class="form-control"
												value="<c:out value="${productobj.purchasePrice}" />" />
										</div>


									</div>
								</div>
								<div class="row">
									<div class="form-group">
									<div class="col-md-4">
										<label for="text1" class="control-label col-md-5" style="float: right;">Selling
											Price</label>
</div>
										<div class="col-md-4">
											<input type="text" id="text1" name="s_price"
												placeholder="Selling Price" class="form-control"
												value="<c:out value="${productobj.sellingPrice}" />" />

										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
									<div class="col-md-4">
										<label class="control-label col-md-5 style="float: right;" style="float: right;">Measuring Unit</label>
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
										<label for="text1" class="control-label col-md-5 style=" style="float: right;">Re-order
											Level</label>
</div>
										<div class="col-md-4">
											<input type="text" id="text1" placeholder="Re-order Level"
												name="r_level" class="form-control"
												value="${r_level}<c:out value="${productobj.reorderLevel}" />" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-actions no-margin-bottom"
										style="text-align: center;">
										<div class="col-sm-6">
										<input style="position: relative; left: 563px;" id="btn_save" value="Save" class="btn btn-primary btn-lg " type="submit">
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
	</div>
	<%@include file="footer.jsp"%>


	<!-- PAGE LEVEL SCRIPT-->
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script
		src="assets/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script src="assets/plugins/validVal/js/jquery.validVal.min.js"></script>
	<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
	<script
		src="assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>
	<script src="assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
	<script src="assets/js/formsInit.js"></script>
	<script>
		$(function() {
			formInit();
		});
	</script>

	<!--END PAGE LEVEL SCRIPT-->

</body>
</html>