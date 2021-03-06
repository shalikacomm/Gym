<%@page import="com.bit.entity.UserEntity"%>

<!-- MENU SECTION -->
<div id="left" style="margin-top:1%;">
	<div class="media user-media well-small" style="background-color: #219cd8;">
		<a class="user-link" href="#"> <img
			class="media-object img-thumbnail user-img" alt="User Picture"
			src="assets/img/admin.jpg" style="width:64px;height:64px;"/>
		</a> <br />
		<div class="media-body" style="color: #313331;">
			<h5 class="media-heading">
			 <% UserEntity currentUser = (UserEntity) (session.getAttribute("currentSessionUser"));%>
                <span id="user"><%
                    if (currentUser == null) {
                        response.sendRedirect("errorLogin.jsp");
                    } else {%>
                    <strong><%= currentUser.getRole() %></strong><br/>
                    <%= currentUser.getFirst_name()%>
			<% } %></h5>
			<ul class="list-unstyled user-info">

				<li><a class="btn btn-success btn-xs btn-circle"
					style="width: 10px; height: 12px;"></a> Online</li>

			</ul>
		</div>
		<br />
	</div>

	<ul id="menu" class="collapse" style="background-color: #219cd8;">
  							<% String role3=currentUser.getRole();
										if(role3.equals("administrator")) { %>
          

		<li class="panel "><a href="dashboard.jsp" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#"> 
			<i class="glyphicon glyphicon-dashboard">&nbsp;
			
			</i>	Dashboard<span class="pull-right">
			</span> 
		</a>
			
			</li>
		<li class="panel "><a href="UserCon?action=insert" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#register-nav"> 
			<i class="glyphicon glyphicon-user">&nbsp;</i>	Registration <span class="pull-right"> 
			</span> 
		</a>
			</li>

		<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#payment-nav"> <i class="glyphicon glyphicon-usd">&nbsp;</i> Payments Handling <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="payment-nav">
		
				<li><a href="MemberFeeCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Make Payments</a></li>
				<li><a href="UserCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Deactivated List </a></li>
				<li><a href="UserCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Send messages </a></li>
			</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#inventory-nav"> <i class="glyphicon glyphicon-wrench">&nbsp;</i> Master data <span class="pull-right">
			 <i class="icon-angle-down"></i>
			</span>
		</a>
			<ul class="collapse" id="inventory-nav">
				<li><a href="ProductCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Products </a></li>
				<li><a href="ExerciseCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Exercise </a></li>
				<li><a href="ExerciseCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Banks </a></li>
				<li><a href="SystemCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add System Settings </a></li>
				</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#product-nav"> 
			<i class="glyphicon glyphicon-briefcase">&nbsp;</i> Inventory handling <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="product-nav">
				<li><a href="StockCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add inventory </a></li>
				<li><a href="ProductCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> View inventory </a></li>
			
				</ul>
			</li>
			
			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#report-nav"> 
			<i class="glyphicon glyphicon-stats">&nbsp;</i> Generate Reports <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="report-nav">
				<li><a href="income.jsp" style="color: #fff;"><i
						class="icon-angle-right"></i> Income Reports</a></li>
				<li><a href="MemberDCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Growth Reports </a></li>
				<li><a href="AttenCon?action=getCalendar" style="color: #fff;"><i
						class="icon-angle-right"></i> Attendance Report </a></li>
				<li><a href="InvoiceCon?action=invoice_list" style="color: #fff;"><i
						class="icon-angle-right"></i> Supplement Receipts </a></li>
				<li><a href="MemberFeeCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Payment Receipts </a></li>
				<li><a href="AttenCon?action=getCalendar" style="color: #fff;"><i
						class="icon-angle-right"></i> Workout schedules </a></li>
			
				</ul>
			</li>
			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#barcode-nav"> 
			<i class="glyphicon glyphicon-barcode">&nbsp;</i> Generate Barcode <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="barcode-nav">
				<li><a href="BarcodeCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Create Barcodes </a></li>
				
				</ul>
			</li>

			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#shedule-nav"> 
			<i class="glyphicon glyphicon-road">&nbsp;</i> Member Shedules <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="shedule-nav">
				<li><a href="SheduleCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Member Shedules </a></li>
				<li><a href="SheduleCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Shedule List </a></li>
				
				</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#progress-nav"> 
			<i class="glyphicon glyphicon-send">&nbsp;</i> Check Progress <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="progress-nav">
				<li><a href="MemberDCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add performance details </a></li>
				<li><a href="MemberDCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Check progress </a></li>
				
				</ul>
			</li>
					<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#workout-nav"> 
			<i class="glyphicon glyphicon-picture">&nbsp;</i>Workout Charts<span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="workout-nav">
				<li><a href="BasicSheduleCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add WorkOut Charts </a></li>
				<li><a href="BasicSheduleCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Workout Chart Lits </a></li>
				
				</ul>
			</li>
			
			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#markAttendance-nav"> 
			<i class="glyphicon glyphicon-user">&nbsp;</i>Mark Attendance<span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="markAttendance-nav">
				<li><a href="AttenCon?action=mark" style="color: #fff;"><i
						class="icon-angle-right"></i> Mark Attendance</a></li>
				<li><a href="AttenCon?action=getCalendar" style="color: #fff;"><i
						class="icon-angle-right"></i> Check Member Attendance</a></li>
				
				</ul>
			</li>
<%}else if(role3.equals("operator")){ %>

<li class="panel "><a href="dashboard.jsp" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#"> 
			<i class="glyphicon glyphicon-dashboard">&nbsp;
			
			</i>	Dashboard<span class="pull-right">
			</span> 
		</a>
			
			</li>
		<li class="panel "><a href="UserCon?action=insert" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#register-nav"> 
			<i class="glyphicon glyphicon-user">&nbsp;</i>	Registration <span class="pull-right"> 
			</span> 
		</a>
			</li>

		<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#payment-nav"> <i class="glyphicon glyphicon-usd">&nbsp;</i> Payments Handling <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="payment-nav">
		
				<li><a href="MemberFeeCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Make Payments</a></li>
				<li><a href="UserCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Member List </a></li>
				<li><a href="UserCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Send messages </a></li>
			</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#inventory-nav"> <i class="glyphicon glyphicon-wrench">&nbsp;</i> Master data <span class="pull-right">
			 <i class="icon-angle-down"></i>
			</span>
		</a>
			<ul class="collapse" id="inventory-nav">
				<li><a href="ProductCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Products </a></li>
				<li><a href="ExerciseCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Exercise </a></li>
				<li><a href="ExerciseCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Banks </a></li>
	
				</ul>
			</li>

			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#barcode-nav"> 
			<i class="glyphicon glyphicon-barcode">&nbsp;</i> Generate Barcode <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="barcode-nav">
				<li><a href="BarcodeCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Create Barcodes </a></li>
				
				</ul>
			</li>

			
			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#markAttendance-nav"> 
			<i class="glyphicon glyphicon-user">&nbsp;</i>Mark Attendance<span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="markAttendance-nav">
				<li><a href="AttenCon?action=mark" style="color: #fff;"><i
						class="icon-angle-right"></i> Mark Attendance</a></li>
				<li><a href="AttenCon?action=getCalendar" style="color: #fff;"><i
						class="icon-angle-right"></i> Check Member Attendance</a></li>
				
				</ul>
			</li>

<%}else if(role3.equals("instructor")){ %>

		<li class="panel "><a href="dashboard.jsp" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"
			data-target="#"> 
			<i class="glyphicon glyphicon-dashboard">&nbsp;
			
			</i>	Dashboard<span class="pull-right">
			</span> 
		</a>
			
			</li>

			
			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#report-nav"> 
			<i class="glyphicon glyphicon-stats">&nbsp;</i> Generate Reports <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="report-nav">
				<li><a href="MemberDCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Growth Reports </a></li>
				<li><a href="AttenCon?action=getCalendar" style="color: #fff;"><i
						class="icon-angle-right"></i> Attendance Report </a></li>
				<li><a href="AttenCon?action=getCalendar" style="color: #fff;"><i
						class="icon-angle-right"></i> Workout schedules </a></li>
			
				</ul>
			</li>
	
			<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#shedule-nav"> 
			<i class="glyphicon glyphicon-road">&nbsp;</i> Member Shedules <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="shedule-nav">
				<li><a href="SheduleCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add Member Shedules </a></li>
				<li><a href="SheduleCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Shedule List </a></li>
				
				</ul>
			</li>
			
				<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#progress-nav"> 
			<i class="glyphicon glyphicon-send">&nbsp;</i> Check Progress <span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="progress-nav">
				<li><a href="MemberDCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add performance details </a></li>
				<li><a href="MemberDCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Check progress </a></li>
				
				</ul>
			</li>
					<li class="panel"><a href="#" data-parent="#menu" style="color: #fff; border-top: 0px solid #219cd8;"
			data-toggle="collapse" class="accordion-toggle"	data-target="#workout-nav"> 
			<i class="glyphicon glyphicon-picture">&nbsp;</i>Workout Charts<span class="pull-right"> 
			<i class="icon-angle-down"></i>
			</span> 
		</a>
			<ul class="collapse" id="workout-nav">
				<li><a href="BasicSheduleCon?action=insert" style="color: #fff;"><i
						class="icon-angle-right"></i> Add WorkOut Charts </a></li>
				<li><a href="BasicSheduleCon?action=list" style="color: #fff;"><i
						class="icon-angle-right"></i> Workout Chart Lits </a></li>
				
				</ul>
			</li>
	


<%} %>
	</ul>

</div>
<!--END MENU SECTION -->
