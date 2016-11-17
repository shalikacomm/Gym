<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print Barcodes</title>
<%@include file="head_src.jsp"%>
<!-- PAGE LEVEL STYLES -->
<link href="assets/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
<link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />
<!-- END PAGE LEVEL  STYLES -->
	<style>
.popover-title {
    background-color: #df6262;
    color: #FFFFFF;
    font-size: 12px;
    text-align:;
}
		</style>
</head>

<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner">
			<ul class="breadcrumb" style="margin-top:1%;">
  <li><a href="dashboard.jsp">Dashboard</a></li>
  <li><a href="BarcodeCon?action=insert">Print Barcodes</a></li>
    </ul>
				<div class="row">
					<div class="col-lg-12">


				


					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Barcode Print
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th style="width: 10%;">ID</th>
												<th style="width: 20%;">Name</th>
												<th style="width: 25%;">Email</th>
												<th style="width: 15%;">Role</th>
												<th style="width: 15%;">Status</th>
												<th style="width: 15%;">Action</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${users}" var="temp">
												<tr class="odd gradeX">
													<td id=""><c:out value="${temp.user_id}" /></td>
													<td id="name${temp.user_id}"><c:out
															value="${temp.first_name}" /></td>
													<td id="email${temp.user_id}"><c:out
															value="${temp.email}" /></td>
													<td><lable class=" label btn-primary">
														<c:out value="${temp.role}" /></lable></td>
													<td><c:if test="${temp.status ==1 }">
															<lable class=" label btn-success">Active</lable>
														</c:if> <c:if test="${temp.status ==0 }">
															<lable class=" label btn-danger">Deactive</lable>
														</c:if>
														<c:if test="${temp.status ==2 }">
															<lable class=" label btn-warning">Pending</lable>
														</c:if>
														<c:if test="${temp.status ==3 }">
															<lable class=" label btn-info">Fresh</lable>
														</c:if>
														</td>
													<td>
													<a data-toggle="modal" class="btn-info btn-sm img_btn"
														id="${temp.user_id}" data-toggle="modal"
														 href="#imageup">upload image</a>
													
													<a href ="" target="_blank"
													 id="${temp.user_id}"
														class="btn-primary btn-sm print">print ID</a> 
														 	<%-- <a
																href="UserCon?action=deactive&user_id=<c:out value="${temp.user_id}"/>"
																class="btn-info btn-sm">Print ID<span><i
																	style="color: #455862;"></i></span></a> --%>
													
																
																
																
															<!-- 	<a data-toggle="modal" class="btn-md"
											style="border-radius: 6px; background: #27C3BB;" id=""
											href="#imageup">Upload Image</a> -->
																
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

				<%@include file="right_panel.jsp"%>
			</div>
			<%@include file="footer.jsp"%>
			
					<!-- modal start  image-->


							<div class="col-lg-12">
								<div class="modal fade" id="imageup" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true"
									data-keyboard="false" data-backdrop="static">
									<div class="modal-dialog modal-lg">
										<!--<div class="modal-content">-->
										<div class="panel with-nav-tabs panel-info modal-content">
											<div class="panel-heading modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<ul class="nav nav-tabs">
													<li class="active"><a href="#doctor_info"
														data-toggle="tab">Select Your Image</a></li>

													<!--<li><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>-->
												</ul>
											</div>
											<div class="panel-body modal-body">
											<form id="imageForm" action="MemberCon" method="POST">
												<div class="tab-content">
												
													<div class="tab-pane fade in active" id="doctor_info">
													<div class="row">
													<div class="col-sm-3"></div>
													<div class="col-sm-6"><input id="img_user" type="hidden" readonly class="form-control" name="user_id">
													</div>
													<div class="col-sm-3"></div>
													</div>
														<div class="row">
															<div class="col-md-6 " align="center" id="doc_img">
																<img id="past_img" width="134" height="179" src="" >
															</div>
															<div class=" col-md-6 ">
																					
																			<div class="form-group">
																				<label>Member Photo</label><em style="color: red;">*</em>
																				
																				<div class="fileupload fileupload-new"
																					data-provides="fileupload">
																					<div class="fileupload-preview thumbnail"
																						style="width: 200px; height: 150px;"></div>
																					<div>
																						<span class="btn btn-file btn-success"><span
																							class="fileupload-new">Select image</span><span
																							class="fileupload-exists">Change</span> <input
																							type="file" name="img_path" /></span> <a href="#"
																							class="btn btn-danger fileupload-exists"
																							data-dismiss="fileupload">Remove</a>
																					</div>
																				</div>
																			</div>
																		
																		<div class=col-lg-4></div>
																
															</div>
														</div>
													</div>
													<div>
														<hr>
													</div>
													<div class="row">
													<div>
													<div class="col-sm-2">
													<div class="form-group">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
													</div>
													</div>
													<div class="col-sm-2">
													<div class="form-group">
												<button type="submit" class="btn btn-success saveImg"
														style="background: #27C3BB">Save Image</button>
												</div>
												</div>
												</div>
												</div>
												</form>
											</div>
										</div>
										<!--</div>-->
									</div>
								</div>
							</div>
							<!-- modal end -->

			<!-- PAGE LEVEL SCRIPTS -->
			<script src="assets/js/sweetalert.min.js"></script>
			<script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
			<script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
		<script src="assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
		  <script>
        $(document).ready(function(){
            $(".img_btn").click(function(){
                var id=this.id;
                $("#img_user").val(id);
                //alert("${pageContext.request.contextPath}");
            $("#past_img").attr("src","${pageContext.request.contextPath}/uploads/"+id+".jpg");
               
            });
           
            $("#imageForm").submit(function(e) {
                e.preventDefault();
                var formData = new FormData($("#imageForm")[0]); // change form id
                var val = $("#img_user").val();
                if (!(/\.(gif|jpg|jpeg|png)$/i).test(val)) {              
                    alert('You must select an image file only');               
                    }
                else{
                $.ajax({
                    url : 'MemberCon',
                    type : 'POST',
                    data : formData,
                    async : false,
                    cache : false,
                    contentType : false,
                    enctype : 'multipart/form-data',
                    processData : false,
                    success : function(response) {
                        if (response == 'true') {
                            swal("", "This image will used as ur ID image!", "success")
                             window.location = "BarcodeCon?action=insert";
                             window.location = "BarcodeCon?action=insert";

                        } else {
                            sweetAlert("", "Something went wrong!", "error");
                        }

                    }
                });
                }
            });
           
        });
       
       
        </script>
		<script>
		$('#dataTables-example').dataTable();
		$(".print").click(function(){
			var id=this.id;
			
			$("#img_user").val(id);
			//alert("${pageContext.request.contextPath}");
		$(".print").attr("href","UserCon?action=barcode&user_id="+id);
			
		});
		
		</script>
		
		<!-- 	<script>
				$(document).ready(function() {

									$('.cont').click(function() {
												var name = $('#name' + this.id).text();
												$('#fname').val(name);
												var email = $('#email' + this.id).text();
												$('#femail').val(email);
												//alert(this.id);
											});

									

									$("#dataTables-example")
											.on('click','.status',
													function(e) {
														e.preventDefault();
														var url = this.href;

														swal(
																{
																	title : "Are you sure?",
																	text : "You will not be able to recover this imaginary file!",
																	type : "warning",
																	showCancelButton : true,
																	confirmButtonColor : "#DD6B55",
																	confirmButtonText : "Yes, delete it!",
																	cancelButtonText : "No, cancel plx!",
																	closeOnConfirm : true,
																	closeOnCancel : true
																},
																function(
																		isConfirm) {
																	if (isConfirm) {
																		$.ajax({
																					method : 'GET',
																					url : url,
																					success : function(
																							data) {
																						if (data == true) {
																							swal(
																									"User Updated!",
																									"You clicked the button!",
																									"success");
																							window.location = "UserCon?action=list";
																						} else {

																						}
																					}
																				});
																	} else {
																		swal(
																				"Cancelled",
																				"Your imaginary file is safe :)",
																				"error");
																	}
																});

													});//end

								});
			</script> -->
			<script>
				$(document).ready(function() {
					// click on button submit

					$("#emailSend").on('click', function() {
						var email = $('#femail').val();
						var subject = $('#subjectModal').val();
						var first_name = $('#fname').val();
						var message_body = $('#messageModal').val();

	                    $("#processing_img").removeAttr("class", "hide");
	                    $("#processing_img").attr("class", "row");
						
						$.ajax({
							type : "GET", // type of action POST || GET
							data : {
								email : email,
								subject : subject,
								message_body : message_body,
								first_name : first_name
							}, // post data || get data
							url : 'UserCon?action=sendEmail', // url where to submit the request
							dataType: 'json',
							success : function(res) {
								 $("#processing_img").attr("class", "hide");
	                                $("#spnmessage_modal").removeAttr("class", "alert alert-danger");
	                                $("#spnmessage_modal").attr("class", "alert alert-success");
	                                $("#spnmessage_modal").html('<p><strong>Successfully Send the Email</strong></p>');
	                                $("#divmessage_modal").removeAttr("class", "hide");
	                                $("#divmessage_modal").fadeIn(1500);
	                                $("#divmessage_modal").delay(2500).fadeOut(1500);
								console.log(res);
							},
							error : function() {
								  $("#processing_img").attr("class", "hide");
	                                $("#spnmessage_modal").removeAttr("class", "alert alert-success");
	                                $("#spnmessage_modal").attr("class", "alert alert-danger");
	                                $("#spnmessage_modal").html('<p><strong>Email not send check your internet connection </strong></p>');
	                                $("#divmessage_modal").removeAttr("class", "hide");
	                                $("#divmessage_modal").fadeIn(1500);
	                                $("#divmessage_modal").delay(2500).fadeOut(1500);
							}
						})
					});
				});
			</script>
			<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>