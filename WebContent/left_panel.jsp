<%@page import="com.bit.entity.UserEntity"%>

<!-- MENU SECTION -->
<div id="left">
	<div class="media user-media well-small">
		<a class="user-link" href="#"> <img
			class="media-object img-thumbnail user-img" alt="User Picture"
			src="assets/img/user.gif" />
		</a> <br />
		<div class="media-body">
			<h5 class="media-heading">
			 <% UserEntity currentUser = (UserEntity) (session.getAttribute("currentSessionUser"));%>
                Hi, <span id="user"><%
                    if (currentUser == null) {
                        response.sendRedirect("errorLogin.jsp");
                    } else {%>
                    <%=currentUser.getFirst_name()%>
			<% } %></h5>
			<ul class="list-unstyled user-info">

				<li><a class="btn btn-success btn-xs btn-circle"
					style="width: 10px; height: 12px;"></a> Online</li>

			</ul>
		</div>
		<br />
	</div>

	<ul id="menu" class="collapse">


		<li class="panel "><a href="dashboard.jsp" data-parent="#menu"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#"> 
			<i class="glyphicon glyphicon-dashboard">&nbsp;
			
			</i>	Dashboard<span class="pull-right">
			</span> 
		</a>
			
			</li>
		<li class="panel "><a href="#" data-parent="#menu"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#register-nav"> 
			<i class="glyphicon glyphicon-user">&nbsp;</i>	Registration <span class="pull-right"> <i
					class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="register-nav">

				<li class=""><a href="MemberCon?action=insert"><i
						class="icon-angle-right"></i> Member</a></li>
				<li class=""><a href="InstructorController?action=list"><i
						class="icon-angle-right"></i> Instructor </a></li>
				<li class=""><a href="progress.html"><i
						class="icon-angle-right"></i> Operator</a></li>
			</ul></li>

		<li class="panel"><a href="#" data-parent="#menu"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#payment-nav"> <i class="glyphicon glyphicon-usd">&nbsp;</i> Payments Handling <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="payment-nav">
				<li><a href="pages_calendar.html"><i
						class="icon-angle-right"></i> Barcode Register </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> Member Status </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> Generate Reports </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> Send messages </a></li>
			</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#inventory-nav"> <i class="glyphicon glyphicon-wrench">&nbsp;</i> Master data <span class="pull-right">
			 <i class="icon-angle-down"></i>
			</span>
		</a>
			<ul class="collapse" id="inventory-nav">
				<li><a href="StockCon?action=insert"><i
						class="icon-angle-right"></i> Add Inventory </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> Product Images </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> News Updates </a></li>
				</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu"
			data-toggle="collapse" class="accordion-toggle"	data-target="#product-nav"> 
			<i class="glyphicon glyphicon-briefcase">&nbsp;</i> Product Items <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="product-nav">
				<li><a href="ProductCon?action=list"><i
						class="icon-angle-right"></i> Item List </a></li>
				<li><a href="ProductCon?action=insert"><i
						class="icon-angle-right"></i> New Item </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> Update Product </a></li>
				</ul>
			</li>
			
			<li class="panel"><a href="#" data-parent="#menu"
			data-toggle="collapse" class="accordion-toggle"	data-target="#report-nav"> 
			<i class="glyphicon glyphicon-print">&nbsp;</i> Generate Reports <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="report-nav">
				<li><a href="pages_calendar.html"><i
						class="icon-angle-right"></i> Unit Progress </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i> Growth Reports </a></li>
				<li><a href="pages_timeline.html"><i
						class="icon-angle-right"></i>  </a></li>
				</ul>
			</li>

		

	</ul>

</div>
<!--END MENU SECTION -->
