<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shedule List</title>
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
						<h2>Shedule List</h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								Shedule List <a class="pull-right"
									href="SheduleCon?action=insert"><button style="margin-top: -9%;"
										class="btn btn-primary">Add New</button></a>
							</div>
							<div class="panel-body">

								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>User ID</th>
												<th>Instructor Name</th>
												<th>Date Added</th>
												<th>Workout No</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${shedule}" var="temp">
												<tr class="odd gradeX">
													<td style="width: 10%;"><c:out value="${temp.user_id}" /></td>
													<td style="width: 30%;"><c:out value="${temp.instructor_name}" /></td>
													<td style="width: 30%;"><c:out value="${temp.instructor_name}" /></td>
													<td align="left" style="width: 15%;"><c:out value="${temp.date_created}" /></td>
													<td align="right" style="width: 15%;"><c:out value="${temp.workout_no}" /></td>
													<td style="width: 15%;">
													<c:if test="${temp.status ==1 }">
														<lable class=" label btn-success">Active</lable>
														</c:if> 
														<c:if test="${temp.status ==0 }">
														<lable class=" label btn-danger">Deactive</lable>
														</c:if>
													</td>
													<td style="width: 15%;">
													
													 <a data-toggle="modal" class="view_item btn btn-default btn-grad btn-sm " class="bs-example" data-toggle="popover" title="View" id="<?php echo $rows->item_id; ?>" href="#view_item_modal"><i class=" icon-list" style="color:#455862;"></i></a>&nbsp;
													<%-- <a href="SheduleCon?action=edit&shedule_id=<c:out value="${temp.shedule_id}"  />" class="btn btn-default btn-grad btn-sm" ><span ><i class="icon-edit" style="color:#455862;"></i></span></a> --%>
														<c:if test="${temp.status ==1 }">
														
														<a
															 href="SheduleCon?action=deactivate&shedule_id=<c:out value="${temp.shedule_id}"/>" class="navg status btn btn-default btn-grad btn-sm"><span><i class="icon-trash" style="color:#455862;"></i></span></a>
														</c:if> 
														
														<c:if test="${temp.status ==0 }">
															<a
																href="SheduleCon?action=activate&shedule_id=<c:out value="${temp.shedule_id}"/>" class="status btn btn-default btn-grad btn-sm"><span><i class="icon-ok " style="color:#455862;"></i></span></a>
														</c:if></td>
												</tr>
											</c:forEach>
											<!-- Start modal -->





											<!-- Start modal -->
											
											
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- START Modal -->
				<div class="col-lg-12">
    <div class="modal fade" id="view_item_modal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <!--<div class="modal-content">-->
            <div class="panel with-nav-tabs panel-info modal-content">
                <div class="panel-heading modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#pharmacy_info" data-toggle="tab">Pharmacy Item Details</a></li>
                        <li><a href="#tab2info" data-toggle="tab">Send Email</a></li>
                        <li><a href="#tab3info" data-toggle="tab">Notification</a></li>
                        <!--<li><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>-->
                    </ul>                           
                </div>
                <div class="panel-body modal-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="pharmacy_info">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center" id="pItem_img">
                                    <!-- loading the image from the AJAx call  -->
                                </div>
                                <div class=" col-md-9 col-lg-9 ">
                                    <table class="table table-user-information">
                                        <tbody id="pharmacy_detail">
                                            <!-- loading the pet owner details from the AJAX call  -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab2info">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="email_form" action="<?php echo base_url(); ?>index.php/pet_owner/sendEmailCustomEmail" method="post" accept-charset="utf-8">
                                        <div class="modal-body" style="padding: 5px;">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col col-md-6 col-sm-6 hide" id="divmessage_modal">
                                                                <div style=" width: 100%; padding: 10px;" id="spnmessage_modal" class="alert alert-success" role="alert">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row hide" id="processing_img">
                                                <div style="margin-left: 30%; margin-top: -7%;">
                                                    <img src="<?php echo base_url(); ?>admin_assets/img/processing.gif" alt=""/>
                                                </div>                                                                   
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                                    <label>Pet owner Name</label>
                                                    <input class="form-control" value="" id="petOwner_name" name="petOwner_name" type="text" readonly />
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                                    <label>Pet owner Email</label>
                                                    <input class="form-control" value="" id="petOwner_email" name="petOwner_email" type="text" readonly />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">                                           
                                                    <label>Email-Subject</label>
                                                    <input class="form-control" id="email_subject" name="email_subject" placeholder="Subject" type="text" required />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <label>Message</label>
                                                    <textarea style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" id="email_message" name="email_message" required></textarea>
                                                </div>
                                            </div>
                                        </div> 
                                        <input type="submit" id="stdce" class="btn btn-success" value="Send" />
                                            <span class="glyphicon glyphicon-ok"></span>
                                        <input type="button" class="clear btn btn-danger" value="Clear" />                                    

                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="tab3info">
                            Notification Form
                        </div>
                        <div>
                            <hr>
                        </div>
                        <div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--</div>-->
        </div>
    </div>
</div>
<!--END Modal  -->


			</div>

			<%@include file="right_panel.jsp"%>
		</div>
		<%@include file="footer.jsp"%>

		<!-- PAGE LEVEL SCRIPTS -->
			<script src="assets/js/sweetalert.min.js"></script>
		
				<script>
	/* 	
		function test(x){
			swal({
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then(function(isConfirm) {
				  if (isConfirm) {
					  url: "ProductCon?action=deactivate&" + x
				    swal(
				    		
				      'Deleted!',
				      'Your file has been deleted.',
				      'success'
				    );
				  }
				})
		} */
			
		
				
				</script>
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
											if(data== true){
												swal("Shedule updated!", "You clicked the button!", "success");
												window.location="SheduleCon?action=list";
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