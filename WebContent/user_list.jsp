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
								Instructor List <a class="pull-right"
									href="UserCon?action=insert"><button
										class="btn-primary">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>Email</th>
												<th>Action</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${users}" var="temp">
												<tr class="odd gradeX">
													<td><c:out value="${temp.user_id}" /></td>
													<td><c:out value="${temp.first_name}" /></td>
													<td><c:out value="${temp.email}" /></td>
													<td><a
														href="UserController?action=edit&ins_id=<c:out value="${temp.user_id}"/>">Update</a>
														<c:if test="${temp.status ==1 }">
															<a
																href="UserController?action=deactive&ins_id=<c:out value="${temp.user_id}"/>">Deactivate</a>
														</c:if> <c:if test="${temp.status ==0 }">
															<a
																href="UserController?action=active&ins_id=<c:out value="${temp.user_id}"/>">Activate</a>
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