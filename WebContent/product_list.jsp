<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->
<link href="assets/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link href ="assets/sweetalert2/sweetalert2.css" rel = "stylesheet" />
<link href ="assets/sweetalert2/sweetalert2.min.css" rel = "stylesheet" />
<script type="text/javascript" src="assets/sweetalert2/sweetalert2.min.js" ></script>
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
									href="ProductCon?action=insert"><button
										class="btn-primary">Add New</button></a>
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
												<th>Measuring Unit</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${product}" var="temp">
												<tr class="odd gradeX">
													<td><c:out value="${temp.productID}" /></td>
													<td><c:out value="${temp.description}" /></td>
													<td><c:out value="${temp.purchasePrice}" /></td>
													<td><c:out value="${temp.sellingPrice}" /></td>
													<td><c:out value="${temp.reorderLevel}" /></td>
													<td><c:out value="${temp.stock}" /></td>
													<td><c:out value="${temp.measuringUnit}" /></td>
													<td><a
														href="ProductCon?action=edit&prd_id=<c:out value="${temp.productID}"/>">Update</a>
														<c:if test="${temp.status ==1 }">
														
															<a
															 href="ProductCon?action=deactivate&prd_id=<c:out value="${temp.productID}"/>" class="navg">Deactivate</a>
														</c:if> <c:if test="${temp.status ==0 }">
															<a
																href="ProductCon?action=activate&prd_id=<c:out value="${temp.productID}"/>">Activate</a>
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
		<
				<script>
		
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
		}
			
		
				
				</script>
		<script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
		<script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
		<script>
			$(document).ready(function() {
				$('#dataTables-example').dataTable();

			});
		</script>
		<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>