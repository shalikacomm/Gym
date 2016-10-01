
<!-- HEADER SECTION -->
<%
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
    response.addHeader("Pragma", "no-cache");
    response.addDateHeader("Expires", 0);
%>
<div id="top">

	<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: white; margin-top: -32px; padding-top: 34px;">
		<a data-original-title="Show/Hide Menu" data-placement="bottom"
			data-tooltip="tooltip"
			class="accordion-toggle btn btn-primary btn-sm visible-xs"
			data-toggle="collapse" href="#menu" id="menu-toggle"> <i
			class="icon-align-justify"></i>
		</a>
		<!-- LOGO SECTION -->
		<header class="navbar-header">

			 <img
				src="assets/img/logo.jpg" alt="" height="46" width="210" style="margin-left: -27% ; margin-top: -9px; padding-top: 10px;"/>

			
		</header>
		<!-- END LOGO SECTION -->
		
		<ul class="nav navbar-top-links navbar-right">

			<!--ADMIN chat bar SECTIONS -->

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="icon-user "></i>&nbsp;
					<i class="icon-chevron-down "></i>
			</a>

				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="icon-user"></i> User Profile </a></li>
					<li><a href="#"><i class="icon-gear"></i> Settings </a></li>
					<li class="divider"></li>
					<li><a href="LoginCon?action=logout"><i class="icon-signout"></i>
							Logout </a>
							</li>
				</ul>
			
				
				</li>
			<!--END chat bar SETTINGS -->
		</ul>
		
		<ul class="nav navbar-top-links navbar-right">

			<!--ADMIN chat bar SECTIONS -->

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><span class="label label-danger" id="count"></span> <i class="icon-globe"></i>&nbsp;
					<i class="icon-chevron-down "></i>
			</a>

				 <ul class="dropdown-menu dropdown-alerts" id="lowQty">
					<h4>Low Quantity</h4>
                           
                        </ul>
				
				
				</li>
			<!--END chat bar SETTINGS -->
		</ul>

	</nav>

</div>
<!-- END HEADER SECTION -->
<script>
$(document).ready(function(){
	
	$.ajax({
		type:'get',
		url:'ProductCon?action=lowQuantity',
		dataType:'json',
		success:function(data){
			$("#count").append(data.record.length);
			$.each(data.record,function(i,obj){
				html='<li><a href="ProductCon?action=list"><div><i class="icon-info" > </i>&nbsp;'+obj.description+'<span class="pull-right text-muted small">'+ obj.stock+
				'</span></div></a></li>';
				$("#lowQty").append(html);
			});
		}
	});
	
	
});
</script>