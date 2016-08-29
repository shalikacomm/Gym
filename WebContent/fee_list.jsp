<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monthly Fee List</title>
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
			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>Product List</h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Product List <a class="pull-right"
									href="FeeCon?action=insert"><button style="margin-top: -9%;"
										class="btn btn-primary">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Fee</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${feeList}" var="temp">
												<tr class="odd gradeX">
													<td><c:out value="${temp.fee_id}" /></td>
													<td><c:out value="${temp.fee}" /></td>
											
													<td>
													
													<a href="ProductCon?action=edit&prd_id=<c:out value="${temp.fee_id}"/>"><span class="btn btn btn-primary">Edit</span></a>
														<c:if test="${temp.status ==1 }">
														
														<a
															 href="ProductCon?action=deactivate&prd_id=<c:out value="${temp.fee_id}"/>" class="navg status"><span class="btn btn btn-success ">Activated</span></a>
														</c:if> 
														
														<c:if test="${temp.status ==0 }">
															<a
																href="ProductCon?action=activate&prd_id=<c:out value="${temp.fee_id}"/>" class="status"><span class="btn btn btn-danger ">Deactivated</span></a>
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
											if(data==true){
												swal("Good job!", "You clicked the button!", "success");
												window.location="FeeCon?action=list";
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