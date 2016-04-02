<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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


						<h2>Data Tables</h2>



					</div>
				</div>

				<hr />


				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">DataTables Advanced Tables</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>E-Mail</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="tBody">
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
											</tr>

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
			//$(document).ready(
					//function() {

						$.ajax({
							type : 'GET',
							url : 'StudentController?action=list',
							dataType : 'json',
							success : function(data) {
								// alert(data);
								for (var i = 0; i <= data.length; i++) {

									var id = data[i]["st_id"];
									var name = data[i]["st_name"];
									var mail = data[i]["email"];
									//alert(name);

									var row_data = "<tr> <td>" + id
											+ "</td><td>" + name + "</td><td>"
											+ mail + "</td></tr>";
									$(row_data).prependTo("#tBody");
								}
								/* $(this).each(data, function (i, obj)
								            {
								                row_data = "<tr> <td>" + obj.id + "</td><td>" + obj.name + "</td><td>"+obj.email+"<td></tr>";
								                $(div_data).appendTo("#tBody");
								            });
								 */
							}
						});
setTimeout(function (){
	$('#dataTables-example').dataTable();
}, 1000);
					

				//	});
		</script>
		<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>