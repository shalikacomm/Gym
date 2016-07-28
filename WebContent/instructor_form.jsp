<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet"
	href="assets/plugins/validationengine/css/validationEngine.jquery.css" />


<!-- PAGE LEVEL SCRIPTS -->

<script
	src="assets/plugins/validationengine/js/jquery.validationEngine.js"></script>
<script
	src="assets/plugins/validationengine/js/languages/jquery.validationEngine-en.js"></script>
<script
	src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
<script src="assets/js/validationInit.js"></script>
<script>
	/*
	    $(function () { formValidation();});
	   
	    $(document).ready(function (){
	   
	   	 $("#btn_save").click(function (){
	   		 
	   		 var name=$("#st_name").val();
	       	 var email= $("#email").val();
	       	
	       	 $.ajax({
	       		 type: 'POST',
	       		 url:'St_Con',
	       		 data:{st_name:name, mail: email},
	       		 success: function(result){
	       			 alert(result);
	       		 }
	       	 });
	       	
	   		 
	   	 });
	   	
	    });
	 */
</script>

</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">

			<div class="panel panel-default">
				<div class="panel-heading">Instructor Registration</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<form action="InstructorController" method="post"
								class="form-horizontal" id="block-validate">

								<div class="row">
									<div class="form-group">
										<label class="control-label col-md-4">Instructor ID</label>
										<div class="col-md-4">
											<input type="text" id="ins_id" name="ins_id"
												readonly="readonly" class="form-control"
												value="${ins_id}<c:out value="${instructorObj.ins_id}" />" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label class="control-label col-md-4">Instructor Name</label>
										<div class="col-md-4">
											<input type="text" id="ins_name" name="ins_name"
												class="form-control"
												value="<c:out value="${instructorObj.ins_name}" />" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label class="control-label col-md-4">Instructor
											E-mail</label>

										<div class="col-md-4">
											<input type="email" id="email" name="ins_mail"
												class="form-control"
												value="<c:out value="${instructorObj.ins_email}" />" />
										</div>
								
								</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions no-margin-bottom"
							style="text-align: center;">
							<input id="btn_save" type="submit" value="Save"
								class="btn btn-primary btn-md " />
						</div>
						<div class="form-actions no-margin-bottom"
							style="text-align: center;">
							<form name="myForm">
								<input type="button" value="comment" onclick="showcommentform()">
								<div id="mylocation"></div>
							</form>
					
						</div>
						
					</div>

				
				</div>
			</div>
		</div>
	</div>
	


	</div>


	<%@include file="right_panel.jsp"%>

	<%@include file="footer.jsp"%>

</body>
</html>