<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendence Form</title>
<%@include file="head_src.jsp"%>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/css/sweetalert.css" />
<!--for the horizontal tabs-->
        <style>
            .tabbable-panel {
                border:0px solid #eee;
                padding: 10px;
                border-left-width: 3px;
            }

            /* Default mode */
            .tabbable-line > .nav-tabs {
                border: none;
                margin: 0px;
            }
            .tabbable-line > .nav-tabs > li {
                margin-right: 2px;
            }
            .tabbable-line > .nav-tabs > li > a {
                border: 0;
                margin-right: 0;
                color: #737373;

            }
            .tabbable-line > .nav-tabs > li > a > i {
                color: #a6a6a6;
            }
            .tabbable-line > .nav-tabs > li.open, .tabbable-line > .nav-tabs > li:hover {
                border-bottom: 4px solid #fff;

            }
            .tabbable-line > .nav-tabs > li.open > a, .tabbable-line > .nav-tabs > li:hover > a {
                border: 0;
                background: none !important;
                color: #333333;
            }
            .tabbable-line > .nav-tabs > li.open > a > i, .tabbable-line > .nav-tabs > li:hover > a > i {
                color: #a6a6a6;
            }
            .tabbable-line > .nav-tabs > li.open .dropdown-menu, .tabbable-line > .nav-tabs > li:hover .dropdown-menu {
                margin-top: 0px;
            }
            .tabbable-line > .nav-tabs > li.active {
                border-bottom: 4px solid  #333fff ;
                position: relative;
            }
            .tabbable-line > .nav-tabs > li.active > a {
                border: 0;
                color: #333333;
                margin-bottom: 15px;
                color: primary;
                font-weight: 500;
                font-family: inherit;
                border-radius: 0px;
            }
            .tabbable-line > .nav-tabs > li.active > a > i {
                color: #404040;
                margin-bottom: 10px;
            }
            .tabbable-line > .tab-content {
                margin-top: -3px;
                background-color: #fff;
                border: 0;
                border-top: 1px solid #eee;
                padding: 15px 0;
            }
            .portlet .tabbable-line > .tab-content {
                padding-bottom: 0;
            }
        </style>
</head>
<body class="padTop53 ">
	<div id="wrap">
		<%@include file="header_panel.jsp"%>
		<%@include file="left_panel.jsp"%>
		<div id="content">
			<div class="inner" style="min-height: 700px;">

					<div class="row">
						<div class="col-lg-12">
							<div class="box dark">
								<header>
								<div class="icons">
									<i class="icon-glass"></i>
								</div>
								<h5>Attendance Mark Details</h5>
								</header>



								</br>
								
								<div class="col-md-9" style="margin-top: 2.0%;">
                        <div class="tabbable-panel">
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs "style="border-radius: 0px; color:  #333fff ; border-bottom: 3px solid  #333fff ; font-family: inherit; font-weight: 500;">
                                    <li class="active">
                                        <a href="#tab_default_1" data-toggle="tab">
                                           BARCODE</a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_2" data-toggle="tab">
                                            MANUAL </a>
                                    </li>
                                </ul>
                                <!--details tab content-->
                                <div class="tab-content">
                                    <!--tab content of the ADD SERVICE tab-->
                                    <div class="tab-pane active" id="tab_default_1"><br/>
                                        <div class="row">
                                            <form id="barcode_submit_form" method="get" action="AttenCon">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label style=" font-size: 20.5px; margin-left:8%; margin-top:5%">Mark From Barcode</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-9" style="margin-left:8%;">
                                                    <div class="row">
                                                        <div class="form-group" style="margin-top: 8%;">
                                                            <div class="col-md-3">
                                                                <label style="font-size: 13.5px; margin-top:3%">Barcode ID</label>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <input class="form-control barcode" value="" type="text" id="barcode_id" name="barcode_id" />
                                                            </div>
                                                        </div>
                                                    </div>
                                              <br/>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <button type="button" id ="barSub" class="btn btn-primary btn-sm" style=" border-radius: 6px; margin-left: 48%; background: primary; " >Submit</button>
                                                           
                                                        </div>
                                                    </div></div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab_default_2"><br/>
                                        <div class="row">
                                            <form id="manual_submit_form" method="get" action="AttenCon">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label style=" font-size: 20.5px; margin-left:8%; margin-top:5%">Add Sub-service</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-9" style="margin-left:8%;">
                                                    <div class="row">
                                                                                                           
                                                        <div class="row">
                                                            <div class="form-group" style="margin-top: 3%;">
                                                                <div class="col-md-3">
                                                                    <label style="font-size: 13.5px; margin-top: 2%;">Username ID</label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                <input class="form-control username" value="" type="text" id="username_id" name="username" />
                                                            </div>
                                                            </div>
                                                        </div>
                
                                                        <br/>
                                                    </div>
                                                    <br/>
                                                    <!--<hr style="margin-left: 15%; "/>-->
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <button type="button" class="btn btn-info btn-sm" style=" border-radius: 6px; margin-left: 48%; background: #27C3BB;">Submit</button>
                                                            <input type="reset" class="btn btn-default btn-sm" style="margin-left: 60%; margin-top: -7.5%; " value="Reset" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
		<script src="assets/js/sweetalert.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script>
/* 	$(document).ready(function(){
		$(".barcode").focus();
	}); */
	</script>
	
	<script>
	$(document).ready(function(){
		// alert(4566);
		$('#barSub').on('click',function(){
			
			$('#barcode_id').keypress(function (e) {
				alert(1235);
				 var key = e.which;
				 if(key == 13)  // the enter key code
				  {
				    $('#barSub').click();
				     
				  }
				}); 
			
			var user_id = $('#barcode_id').val();
			//alert(user_id);
			$.ajax({
				method: 'get',
				dataType : "json",
				url: 'AttenCon?action=check&user_id='+user_id,
				success: function(data){
					var result = data.record;
					if(result== true){
						swal("Product updated!", "You clicked the button!", "success");
						//alert("its activated");
						window.location="attendance_form.jsp";
					}else{
					alert("its not activated");
				}
			
		}
		
	});
	});
	});
	
	</script>
	
</body>
</html>