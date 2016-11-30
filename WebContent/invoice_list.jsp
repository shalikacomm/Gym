<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice List</title>
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


														<ul class="breadcrumb">
  <li><a href="dashboard.jsp">Home</a></li>
  <li><a href="InvoiceCon?action=insert">Sell Items</a></li>
  <li><a href="InvoiceCon?action=list">Receipt List</a></li>
    </ul>
		</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Invoice List <a class="pull-right"
									href="InvoiceCon?action=insert"><button
										class=" btn-primary btn-sm">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th style="width: 19%;">Invoice ID</th>
												<th style="width: 35%;">Name</th>
												<th style="width: 16%;">pay.Type</th>
												<th style="width: 15%;">Transaction Date</th>
												<th style="width: 15%;">Action</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${invoices}" var="temp">
											
												<tr class="odd gradeX">
													<td><c:out value="${temp.invoice_id}" /></td>
													<td><c:out value="${temp.customer_name}" /></td>
													<td><c:out value="${temp.payment_type}" /></td>
													<td><c:out value="${temp.date}" /></td>
											
													<td>
													<a
														href="InvoiceCon?action=recipt&inv_id=<c:out value="${temp.invoice_id}"/>" target="_blank"><span><img src="${pageContext.request.contextPath}/logo/pdf1.png" /></span></a>
														
													
													</td>
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