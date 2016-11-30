<!-- Start Header -->
<%@page import="com.bit.entity.UserEntity"%>
<div class="hidden-header"></div>
<header class="clearfix">

	<!-- Start Top Bar -->
	<div class="top-bar">
		<div class="container" style="width:95%; ">
			<div class="row">
				<div class="col-md-6">
					<!-- Start Contact Info -->
					<ul class="contact-details">
						<li><a href="#"><i class="fa fa-map-marker"></i> No
								03,Sesatha Bulding,Kaduwela,Sri lanka</a></li>
						<li><a
							href="https://www.facebook.com/www.fitfunhc.lk/?fref=ts#"><i
								class="fa fa-envelope-o"></i>@www.fitfunhc.lk</a></li>
						<li><a href="#"><i class="fa fa-phone"></i> +94 71 284
								0229</a></li>
					</ul>
					<!-- End Contact Info -->
				</div>
				<div class="col-md-6">
					<!-- Start Social Links -->
					<ul class="social-list">
						<li><a class="facebook itl-tooltip" data-placement="bottom"
							title="Facebook" href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a class="twitter itl-tooltip" data-placement="bottom"
							title="Twitter" href="#"><i class="fa fa-twitter"></i></a></li>

						<li><a class="instgram itl-tooltip" data-placement="bottom"
							title="Instagram" href="#"><i class="fa fa-instagram"></i></a></li>
						<li><a class="vimeo itl-tooltip" data-placement="bottom"
							title="vimeo" href="#"><i class="fa fa-vimeo-square"></i></a></li>
						
					</ul>
					<!-- End Social Links -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Top Bar -->

	<!-- Start Header ( Logo & Naviagtion ) -->
	<div class="navbar navbar-default navbar-top" >
		<div class="container" style="width:95%; ">
			<div class="navbar-header">
				<!-- Stat Toggle Nav Link For Mobiles -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<i class="fa fa-bars"></i>
				</button>
				<!-- End Toggle Nav Link For Mobiles -->
				<a class="navbar-brand" href="index.html"><img alt=""
					src="assets_front/images/margo.png"
					style="width: 140px; margin-top: -27px; height: 67px;"></a>
			
				
			</div>
			<div class="navbar-collapse collapse" >
				<!-- Stat Search -->
				<div class="search-side">
					<a href="#" class="show-search"><i class="fa fa-search"></i></a>
					<div class="search-form">
						<form autocomplete="off" role="search" method="get"
							class="searchform" action="#">
							<input type="text" value="" name="s" id="s"
								placeholder="Search the site...">
						</form>
					</div>
				</div>
				<!-- End Search -->
				<!-- Start Navigation List -->
				<ul class="nav navbar-nav navbar-right">
					<li><a class="active" href="index_front.jsp">Home</a></li>
					<li><a href="exercise_front.jsp">Exercise</a></li>
					<li><a href="nutrition_front.jsp">Nutrition</a></li>
					<li><a href="blog.html">Team</a></li>
					<li><a href="">Member</a>
					<ul class="dropdown">
                                    <li><a href="FRegisterCon?action=insert">Member Register</a></li>
                                                               <%
					UserEntity currentUser = (UserEntity) (session.getAttribute("frontSessionUser"));
                                          
                                             %>
                                   <%	if (("member").equals(currentUser.getRole())) { %>
                                         <%--     <%if(currentUser.getRole().equals("member")){%> --%>
                                              <li>  
                                              <%  String user_id = currentUser.getUser_id();  %>                 
                    <a href="AttenCon?action=getCalendarFront&user_id=<%=user_id%>">Member Attendance</a></li> 
 										<%}else {%>
            <li><p><% System.out.println( "Evaluating date now "+currentUser.getRole() );  %>i hate you</p></li>      
         <%} %>
                                    <li>
                  
                           
					<%	if (currentUser == null) { %>
						<a href="login.jsp">Login</a> </li>
				 <%	} else {
					%><li><a href="LoginCon?action=logout"><i class="icon-signout"></i>
							Logout </a>
							</li>
					
					<%-- <%=currentUser.getFirst_name()%> --%> <%
 						}
						 %> 
                                   </ul>
                                   	</li>
					<li><a href="contact.html">Contact Us</a></li>
				</ul>
                                   
                                
				
				<!-- End Navigation List -->
			</div>
		</div>
	</div>
	<!-- End Header ( Logo & Naviagtion ) -->

</header>
<!-- End Header -->