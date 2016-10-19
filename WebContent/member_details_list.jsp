<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/login.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

<div class="panel panel-default">
					<div class="panel-heading">Member Progress Check </div>
					<div class="panel-body">
						<form action="MemberDCon" method="POST" id="memDetailList">

							<div class="row">
								<div class="col-sm-2">

									<div class="form-group">
										<label> User ID </label> <select name="user_id"
											class="form-control chzn-select" id="users">

											<option value="<c:out value="${memObject.user_id}" />">${memObject.user_id}</option>
											<option></option>
											<c:forEach items="${users}" var="temp">
												<option value="<c:out value= "${temp.user_id}" />">${temp.user_id}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label> First Name</label><em style="color: red;">*</em> <input
											id="first_name" readonly="readonly" class="form-control" />

									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Last Name</label><em style="color: red;">*</em> <input
											id="last_name" readonly="readonly" class="form-control" />
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<label> NIC</label><em style="color: red;">*</em> <input
											id="nic" readonly="readonly" class="form-control" />
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label> Email</label><em style="color: red;">*</em> <input
											id="email" readonly="readonly" class="form-control" />
									</div>
								</div>
							</div>
							<hr />
							sadasdads asd 
</form></div></div>


	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>

	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/login.js"></script>
		<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
		
		
	<script>
		$(function() {
			/*----------- BEGIN chosen CODE -------------------------*/

			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});
			/*----------- END chosen CODE -------------------------*/
		});
	</script>
	<script>
	$(document).ready(function(){
		

		$("#users").on('change', function() {
			var userID = $("#users").val();
			$.ajax({
				method : 'GET',
				url : 'MemberCon?action=user_details&user_id=' + userID,
				success : function(data, status) {
					console.log(data.record);
					var users = data.record;
					$("#first_name").val(users.first_name);
					$("#last_name").val(users.last_name);
					$("#nic").val(users.nic);
					$("#email").val(users.email);
				}
			});

		});
		
	
		
	});
	
	
	</script>
</body>
</html>