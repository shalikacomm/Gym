<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->
<link href="assets/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
<!-- END PAGE LEVEL  STYLES -->

</head>

<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="margin-top:1%;">
				
					<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="ProductCon?action=list">Product List</a></li>
    </ul>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Product List <a class="pull-right"
									href="ProductCon?action=insert"><button style="margin-top: -9%;"
										class="btn-sm btn-primary">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Description</th>
												<th>Purchase Price</th>
												<th>Selling Price</th>
												<th>Reorder Level</th>
												<th>Available Stock</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${product}" var="temp">
												<tr class="odd gradeX">
													<td style="width: 10%;"><c:out value="${temp.productID}" /></td>
													<td style="width: 25%;"><c:out value="${temp.description}" /></td>
													<td align="right" style="width: 12%;"><c:out value="${temp.purchasePrice}" /></td>
													<td align="right" style="width: 12%;"><c:out value="${temp.sellingPrice}" /></td>
													<td align="right" style="width: 10%;"><c:out value="${temp.reorderLevel}" /></td>
													<td align="right" style="width: 11%;"><c:out value="${temp.stock}" /></td>
													<td align="left" style="width: 5%;">
													<c:if test="${temp.status ==1 }">
														<lable class=" label btn-success">Active</lable>
														</c:if> 
														<c:if test="${temp.status ==0 }">
														<lable class=" label btn-danger">Deactive</lable>
														</c:if>
													</td>
													<td style="width: 15%;">
													
													<a href="ProductCon?action=edit&prd_id=<c:out value="${temp.productID}"  />" class="btn btn-default btn-grad btn-sm" ><span ><i class="icon-edit" style="color:#455862;"></i></span></a>
														<c:if test="${temp.status ==1 }">
														
														<a
															 href="ProductCon?action=deactivate&prd_id=<c:out value="${temp.productID}"/>" class="navg status btn btn-default btn-grad btn-sm"><span><i class="icon-trash" style="color:#455862;"></i></span></a>
														</c:if> 
														
														<c:if test="${temp.status ==0 }">
															<a
																href="ProductCon?action=activate&prd_id=<c:out value="${temp.productID}"/>" class="status btn btn-default btn-grad btn-sm"><span><i class="icon-ok " style="color:#455862;"></i></span></a>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>


			</div>

			<%@include file="right_panel.jsp"%>
		</div>
		<%@include file="footer.jsp"%>

		<!-- PAGE LEVEL SCRIPTS -->
			<script src="assets/js/sweetalert.min.js"></script>
		
				<script>
	/* 	
		function test(x){
			swal({
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then(function(isConfirm) {
				  if (isConfirm) {
					  url: "ProductCon?action=deactivate&" + x
				    swal(
				    		
				      'Deleted!',
				      'Your file has been deleted.',
				      'success'
				    );
				  }
				})
		} */
			
		
				
				</script>
		<script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
		<script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
		<script>
			$(document).ready(function() {
				$('#dataTables-example').dataTable();
				
				$("#dataTables-example").on('click','.status',function(e){
					e.preventDefault();
					var url=this.href;
					
					
					
					swal({
							  title: "Are you sure?",
							  text: "You will not be able to recover this imaginary file!",
							  type: "warning",
							  showCancelButton: true,
							  confirmButtonColor: "#DD6B55",
							  confirmButtonText: "Yes, delete it!",
							  cancelButtonText: "No, cancel plx!",
							  closeOnConfirm: true,
							  closeOnCancel: true
							},
							function(isConfirm){
							  if (isConfirm) {
								  $.ajax({
										method:'GET',
										url:url,
										success: function(data){
											if(data== true){
												swal("Product updated!", "You clicked the button!", "success");
												window.location="ProductCon?action=list";
											}else{
												
											}
										}
									});						 
								  } else {
								    swal("Cancelled", "Your imaginary file is safe :)", "error");
							  }
							}); 
							
				
		
				});//end
		
			});
		</script>
		<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>