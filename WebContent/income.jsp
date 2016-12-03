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
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
	<link rel="stylesheet" href="assets/css/sweetalert.css" />
	
	
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

				<ul class="breadcrumb" style="margin-top: 2%;">
					<li><a href="dashboard.jsp">Dashboard</a></li>
					<li><a href="income.jsp">Income Reports</a></li>
				</ul>
				
				<div class="row">
					<div class="col-lg-12"></div>
				</div>

				<hr />

				<div class="row">
					<div class="col-lg-12">

						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<br />
									<form method="POST" id="income_form" action="ReportCon" target="_blank">
										<div class="row">
											<div class="col-md-3">

												<div class="form-group">
													<label style="margin-left: 0%;" for="date_of_birth">Start
														Date</label><em style="color: red;">*</em>
													<div id="sandbox-container">
														<div class="input-group date">
															<input value="" type="text" class="all form-control"
																id="start_date" name="start_date"
																placeholder="YYYY-MM-DD"><span
																class="input-group-addon"><i
																class="glyphicon glyphicon-th"></i></span>
														</div>
														<label id="pet_bday-error" class="error" for="pet_bday"></label>
													</div>
												</div>
											</div>
											<div class="col-md-3">

												<div class="form-group">
													<label style="margin-left: 0%;" for="date_of_birth">End
														Date</label><em style="color: red;">*</em>
													<div id="sandbox-container">
														<div class="input-group date">
															<input value="" type="text" class="all form-control"
																id="end_date" name="end_date" placeholder="YYYY-MM-DD"><span
																class="input-group-addon"><i
																class="glyphicon glyphicon-th"></i></span>
														</div>
														<label id="pet_bday-error" class="error" for="pet_bday"></label>
													</div>
												</div>
											</div>
								     <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Income Type</label>

                                                        <select class="form-control selectpicker" data-live-search="true"  id="incoem_type" name="income_type">
                                                            <option value="suppliment">Supplement Income</option>                                                             
                                                            <option value="subscription">Monthly Subscription Income</option>                                                             
                                                         
                                                        </select>
                                                    </div>
                                                </div>
										
										</div>

								
										<div class="row" style="margin-left: 0.3%;">
											<input type="submit" value="Search" 
												class="btn btn-primary btn-md" id="search"
												style="padding: 0.4em 0.7em 0.4em;" />
										</div>
									</form>

									<br /> <br />
									
								</div>
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
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/js/sweetalert.min.js"></script>
	
 	<script>
		$(document).ready(function() {
			/* Bootstrap Datepicker Validation */
			
			$('#sandbox-container .input-group.date').datepicker({
				format : "yyyy-mm-dd",
				weekStart : 1,
				todayBtn : false,
				clearBtn : true,
				forceParse : false,
				autoclose : true,
				todayHighlight : false,
				endDate : ''
			});
		});
		
	
	</script>
	<script>
		$(document).ready(function() {

			$('#dataTables-example').dataTable();

		});//end
	</script>
	<script>
	$(document).ready(function() {
		$("#Search").on('submit', function(e) {
		
			
						$.ajax({
					type : "POST", // type of action POST || GET
				/* 	data : {
						instructor : instructor,
						first_name : name,
						email : email,
						shedule_id : shedule_id
						
					}, */ // post data || get data
					url : 'ReportCon', // url where to submit the request
					data : $("#income_form").serialize(),
					dataType: 'json',
					success : function(res) {
					
					},
					error : function() {
					
					}
				})
			});
		
	});
	</script>
	
</body>
</html>