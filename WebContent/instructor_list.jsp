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
						<h2>Instructor List</h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Instructor List <a class="pull-right"
									href="InstructorController?action=insert"><button
										class="btn btn-primary">Add New</button></a>
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
											<c:forEach items="${instructors}" var="temp">
												<tr class="odd gradeX">
													<td><c:out value="${temp.ins_id}" /></td>
													<td><c:out value="${temp.ins_name}" /></td>
													<td><c:out value="${temp.ins_email}" /></td>
													<td>
														<c:if test="${temp.status ==1 }">
														<lable class=" label btn-success">Active</lable>
														</c:if> 
														<c:if test="${temp.status ==0 }">
														<lable class=" label btn-danger">Deactive</lable>
														</c:if>
												
													</td>
													<td><a
														href="InstructorController?action=edit&ins_id=	<c:out value="${temp.ins_id}"/>" class="btn btn-default btn-grad btn-sm" ><span ><i class="icon-edit" style="color:#455862;"></i></span></a>
														
														<c:if test="${temp.status ==1 }">
															<a
																href="InstructorController?action=deactive&ins_id=<c:out value="${temp.ins_id}"/>" class="navg status btn btn-default btn-grad btn-sm"><span><i class="icon-trash" style="color:#455862;"></i></span></a>
														</c:if> 
														<c:if test="${temp.status ==0 }">
															<a
																href="InstructorController?action=active&ins_id=<c:out value="${temp.ins_id}"/>" class="status btn btn-default btn-grad btn-sm"><span><i class="icon-ok " style="color:#455862;"></i></span></a>
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