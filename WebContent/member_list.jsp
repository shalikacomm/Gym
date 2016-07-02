<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member List</title>
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


						<h2>Member List</h2>



					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Member List <a class="pull-right"
									href="MemberCon?action=insert"><button
										class=" btn-primary">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Member ID</th>
												<th>User ID</th>
												<th>Height</th>
												<th>Weight</th>
												<th>BMI</th>
												<th>Goal Weight</th>
												<th>Bicep</th>
												<th>Chest</th>
												<th>Hip</th>
												<th>Thigh</th>
												<th>Shoulder Length</th>
												<th>Action</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${members}" var="temp">
												<tr class="odd gradeX">
													<td><c:out value="${temp.member_id}" /></td>
													<td><c:out value="${temp.user_id}" /></td>
													<td><c:out value="${temp.height}" /></td>
													<td><c:out value="${temp.weight}" /></td>
													<td><c:out value="${temp.bmi}" /></td>
													<td><c:out value="${temp.goal_weight}" /></td>
													<td><c:out value="${temp.bicep}" /></td>
													<td><c:out value="${temp.chest}" /></td>
													<td><c:out value="${temp.hip}" /></td>
													<td><c:out value="${temp.thigh}" /></td>
													<td><c:out value="${temp.shoulder_length}" /></td>
													<td><a
														href="MemberCon?action=edit&member_id=<c:out value="${temp.member_id}"/>"><span class="btn btn-primary">Edit</span></a>
														<c:if test="${temp.status ==1 }">
															<a
																href="MemberCon?action=deactive&member_id=<c:out value="${temp.member_id}"/>">
																<span class="btn btn-danger">Deactivate</span></a>
														</c:if> <c:if test="${temp.status ==0 }">
															<a href="MemberCon?action=active&member_id=<c:out value="${temp.member_id}"/>">
															<span class="btn btn-success">Activate</span>
															</a>
														
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