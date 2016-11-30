<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

			<ul class="breadcrumb" style="margin-top:2%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="AttenCon?action=mark">Mark Attendance</a></li>
  <li><a href="SelectCalenderUser.jsp">View Attendance</a></li>
    </ul>

                   <div class="row">
                        <div class="col-lg-12">

                            <div class="box">
                                <header style=" height: 50px;">
                                    <h5>Calendar</h5>
                                </header>
                                <div class="body">
                                <div class="row inv_row" id="row" style="margin-left: 0%;">
								<div class="col-md-3">
									<select name="user_id" class="form-control chzn-select"
										id="user_id">
										<option></option>
									</select>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<input id="first_name" readonly="readonly"
											class="form-control" name="first_name"
											placeholder="First Name" />

									</div>
								</div>
					<div class="col-md-3 text-center">
									<input id="last_name" readonly="readonly" class="form-control"
										name="last_name" placeholder="Last Name" />
								</div>
								<div class="col-md-3 text-center">
									<input id="email" readonly="readonly" name="email"
										class="form-control" placeholder="Email" />
								</div>
								</div>
                                <div class="row">
                             
                                <div class="col-md-8">
                                </div>
                               
                                <div class="col-md-3" style="margin-left: 87%;">
                                		<button class="btn btn-primary " type="submit" id="attendance">See Attendance</button>
										            </div>
                                
                                </div>
                                                       </div>


                            </div>

                        </div>
                    </div>

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
		$(document).ready(function() {

							dropdownList("SheduleCon?action=AllMemberUsers", "#user_id");

							$("#user_id").on('change',function() {
												var user_id = $("#user_id").val();
												$.ajax({
															type : 'GET',
															url : 'InvoiceCon?action=user_details&user_id='
																	+ user_id,
															success : function(
																	data) {
																var user = data.record;
																$('#first_name').val(user.first_name);
																$('#email').val(user.email);
																$('#last_name').val(user.last_name);
															}

														});
											});

							function dropdownList(url, id) {
								$
										.ajax({
											type : "GET",
											url : "" + url + "",
											dataType : "json",
											beforeSend : function(xhr) {
												$(id).empty();
											},
											success : function(data) {
												var div_data = "<option></option>";

												$(div_data).appendTo(id);

												$.each(data.record,function(i, obj) {
																	div_data = "<option value=" + obj.user_id + ">"
																			+ obj.user_id
																			+ " "
																			+ obj.first_name
																			+ "</option>";
																	$(div_data).appendTo(id);
																});
												$(id).chosen().trigger("chosen:updated");
											}
										});
							}
						});
	</script>
	<script>
	$(document).ready(function() {
		$('#attendance').on('click',function(){
			var user_id = $("#user_id").val();

				window.location='AttenCon?action=getCalendar&user_id='+user_id;
			
		});
		
	});
	</script>
</body>
</html>