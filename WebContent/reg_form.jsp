<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="head_src.jsp"%>
 <link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css" />
 

 <!-- PAGE LEVEL SCRIPTS -->

  <script src="assets/plugins/validationengine/js/jquery.validationEngine.js"></script>
 <script src="assets/plugins/validationengine/js/languages/jquery.validationEngine-en.js"></script>
 <script src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
 <script src="assets/js/validationInit.js"></script>
 <script>
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

 </script>
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">
				<div class="inner">
					<div class="row">
						<div class="col-lg-12">
							<div class="box">

								<div id="collapseOne" class="accordion-body collapse in body">
									<form action="#" class="form-horizontal" id="block-validate">

										<div class="form-group">
											<label class="control-label col-lg-4">Student Name</label>
											<div class="col-lg-4">
												<input type="text" id="st_name" name="required2"
													class="form-control" />
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-lg-4">E-mail</label>

											<div class="col-lg-4">
												<input type="email" id="email" name="email2"
													class="form-control" />
											</div>
										</div>
								
										<div class="form-actions no-margin-bottom"
											style="text-align: center;">
											<input id="btn_save" type="button" value="Save"
												class="btn btn-primary btn-lg " />
										</div>

									</form>
								</div>

							</div>
						</div>
					</div>




				</div>


			</div>
		</div>

		<%@include file="right_panel.jsp"%>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>