<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
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


						<h2>User List</h2>



					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								User List<a class="pull-right"
									href="UserCon?action=insert"><button
										class="btn btn-primary" style="margin-top: -9%;">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th style="width: 10%;">ID</th>
												<th style="width: 20%;">Name</th>
												<th style="width: 40%;">Email</th>
												<th style="width: 15%;">Status</th>
												<th style="width: 15%;">Action</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${users}" var="temp">
												<tr class="odd gradeX">
													<td><c:out value="${temp.user_id}" /></td>
													<td><c:out value="${temp.first_name}" /></td>
													<td><c:out value="${temp.email}" /></td>
													<td>
													<c:if test="${temp.status ==1 }">
														<lable class=" label btn-success">Active</lable>
														</c:if> 
														<c:if test="${temp.status ==0 }">
														<lable class=" label btn-danger">Deactive</lable>
														</c:if>
													
													</td>
													<td><a
														href="UserCon?action=edit&user_id=<c:out value="${temp.user_id}"/>" class="btn btn-default btn-grad btn-sm" ><span ><i class="icon-edit" style="color:#455862;"></i></span></a>
														<c:if test="${temp.status ==1 }">
															<a
																href="UserCon?action=deactive&user_id=<c:out value="${temp.user_id}"/>" class="navg status btn btn-default btn-grad btn-sm"><span><i class="icon-trash" style="color:#455862;"></i></span></a>
														</c:if> <c:if test="${temp.status ==0 }">
															<a
																href="UserCon?action=active&user_id=<c:out value="${temp.user_id}"/>" class="status btn btn-default btn-grad btn-sm"><span><i class="icon-ok " style="color:#455862;"></i></span></a>
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
												swal("User Updated!", "You clicked the button!", "success");
												window.location="UserCon?action=list";
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