
<!doctype html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><html lang="en" class="no-js"> <![endif]-->
<html lang="en">
<head>

<!-- Basic -->
<title>FIT & FUN HEALTH CLUB | Home</title>

<!-- Define Charset -->
<meta charset="utf-8">

<!-- Responsive etatag -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Page Description and Author -->
<meta name="description" content="Margo - Responsive HTML5 Template">
<meta name="author" content="iThemesLab">


<%@include file="head_src_front.jsp"%>

<style>
.video-js  {
    top: -2px;
}

.video-js {
    overflow: hidden;
}
</style>

</head>
<body>

	<!-- Container -->
	<div id="container">

		<%@include file="header_front.jsp"%>
		<!-- Start Content -->

		<%-- <input value="<%=currentUser.getUser_id()%>"> --%>
		<section id="home">
			<!-- Carousel -->
			<div id="main-slide" class="carousel slide" data-ride="carousel">

				<!-- Carousel inner -->
				<div class="carousel-inner">
					<div class="item active">
						<!-- <img class="img-responsive"
							src="assets_front/images/slider/bg1.jpg" alt="slider" style="max-height: 800px; max-width: 1600px;"> -->
						
						<video autoplay="autoplay" lool="loop" muted="muted" width="100%">
							<source  class="video-js"
								src="${pageContext.request.contextPath}/assets_front/images/What Is GymCube.mp4#t=7,40"
								type="video/mp4"></source>
						</video>

						<div class="slider-content">
							<div class="col-md-12 text-center">
								<h2 class="animated2"
									style="color: white; margin-top: -12%; text-transform: none;">
									<span><strong>Lose Fat, Tone Up, Get Up<br />
											<br />Your Online Gym
									</strong> </span>
								</h2>
								<!-- <h3 class="animated3">
									<span>The ultimate aim of your business</span>
								</h3> -->
								<p class="animated4"
									style="margin-top: 20%; text-transform: none;">
									<a href="FRegisterCon?action=insert" class="slider btn btn-system btn-large"
										style="border-radius: 25px; ">Start Your
										Journey&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right "
										style="font-size: 30px;"></i>
									</a>
								</p>
							</div>
						</div>
					</div>

				</div>
				<!-- Carousel inner end-->


			</div>
			<!-- /carousel -->
		</section>
		<div class="row bg_img" >
			<div class="col-md-6 service-box service-center"
				style="background-image: url('${pageContext.request.contextPath}/assets_front/images/img1.jpg'); height:600px; opacity:0.65; background-repeat: no-repeat;">
				<div class="service-content" style=""><br/><br/>
					<p style="color: #fff; font-size: 40px;">Joining FITnFUN! Gives
						You..</p>

					<ul style="list-style-type: disc;">
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 12%;">Diet
							advice, recipes and knowledge</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">Help
							to build your perfect diet</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">Access
							to members only community</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">Help
							to build your perfect diet</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">Access
							to members only community</li>
					</ul>
					<a href="FRegisterCon?action=insert" class="slider btn btn-system btn-large"
										style="border-radius: 25px;  background-color:#fff; color:orange; border-color:orange;">Join the Team n Get Results!&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right "
										style="font-size: 30px;"></i>
									</a>

				</div>
			</div>
			<div class="col-md-6 service-box service-center"
				style="background-image: url('${pageContext.request.contextPath}/assets_front/images/img2.jpg'); height:650px; opacity:0.65; background-repeat: no-repeat;">
				<div class="service-content" style=""><br/><br/>
					<p style="color: #fff; font-size: 40px;">Select from 3 Membership Options</p>

					<ul style="list-style-type: disc;">
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 12%;">£7.95 Billed Monthly</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">ONLY 26p a day!</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">ENJOY 10 days FREE trial</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">ONLY 19p a day!t</li>
						<li
							style="color: #fff; font-size: 20px; font-family: 'helvetica_neueregular', Arial, sans-serif; margin-top: 5%;">ENJOY 30 days FREE trial</li>
					</ul>
					<a href="exercise_front.jsp" class="slider btn btn-system btn-large"
										style="border-radius: 25px; background-color:#fff; color:orange; border-color:orange;">Energized With Us!&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right "
										style="font-size: 30px;"></i>
									</a>

				</div>
			</div>
		</div>

		<p style="color:#f36510; font-size:36px; margin-bottom:5%; font-face: Trebutch Ms; text-align:center;"><i>Forget 'diets'. Begin your nutrition journey and learn what's right for you, as an individual,<br/><br/> for life.. Make the change.</i></p>
		

		<!-- Start Purchase Section -->
		<div class="section purchase">
			<div class="container">

				<!-- Start Video Section Content -->
				<div class="section-video-content text-center">

					<!-- Start Animations Text -->
					<h1 class="fittext wite-text uppercase tlt">
						<span class="texts"> <span>Energetic</span> <span>No
								give up</span> <span>Courage</span> <span>Health</span> <span>Wealth</span>
						</span> Fit & Fun is Ready for <br />HealthCare, Gym <strong>or</strong>
						Physical Service Station
					</h1>
					<!-- End Animations Text -->


					<!-- Start Buttons -->
					<a href="contact_front.jsp" class="btn-system btn-large"><i class="fa fa-tasks"></i>
						Check Out Features</a> 
						<a href="login.jsp" class="btn-system btn-large btn-wite">Login to Get Work out Schedules</a>

				</div>
				<!-- End Section Content -->

			</div>
			<!-- .container -->
		</div>
		<!-- End Purchase Section -->


		<!-- Start Portfolio Section -->
		<div class="section full-width-portfolio"
			style="border-top: 0; border-bottom: 0; background: #fff;">

			<!-- Start Big Heading -->
			<div class="big-title text-center" data-animation="fadeInDown"
				data-animation-delay="01">
				<p style="color:orange; font-size:30px;">
					This is Our Latest <strong>Work</strong>
				</p>
			</div>
			<!-- End Big Heading -->

			<p class="text-center" style="font-size:18px; font-face:Trebutch MS; color:#f36510;">
				Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore <br />veritatis et quasi architecto beatae
				vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
				sit aspernatur aut odit aut fugit.
			</p>


			<!-- Start Recent Projects Carousel -->
			<ul id="portfolio-list" data-animated="fadeIn">
				<li>
				<img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img1.jpg" alt="" />
					<div class="portfolio-item-content">
					<div style="margin-top:20%;">
						<span class="header">FITnFUN NEW YEAR FESTIVAL</span>
						<p class="body">Moments</p>
						</div>
					</div> 
					</li>
				<li><img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img2.jpg" alt="" />
					<div class="portfolio-item-content">
					<div style="margin-top:20%;">
						<span class="header">GRAND PRIX Bodybuilding n FItness</span>
						<p class="body">@ Dhmotiko Theatro Strovolou Theater</p>
						</div>
					</div> 
					</li>
				<li>
				<img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img3.jpg" alt="" />
					<div class="portfolio-item-content">
					<div style="margin-top:20%;">
						<span class="header">Mr.colombo..</span>
						<p class="body">Welcome Moments</p>
						</div>
					</div> 
					
					</li>
				<li>
				<img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img4.jpg" alt="" />
					<div class="portfolio-item-content">
					<div style="margin-top:20%;">
						<span class="header">Mr.colombo..</span>
						<p class="body">fit n fun 2015.10.03</p>
						</div>
					</div> 
					
					</li>
				<li>
				<img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img5.jpg" alt="" />
					<div class="portfolio-item-content">
						<div style="margin-top:20%;">
						<span class="header">Majesty express vol. 01</span>
						<p class="body">web develpment, design</p>
						</div>
					</div> 
					</li>
				<li>
				<img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img6.jpg" alt="" />
					<div class="portfolio-item-content">
						<div style="margin-top:20%;">
						<span class="header">GRAND PRIX Bodybuilding n FItness</span>
						<p class="body">@ Dhmotiko Theatro Strovolou Theater</p>
						</div>
					</div> 
					
					</li>
				<li><img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img7.jpg" alt="" />
					<div class="portfolio-item-content">
					<div style="margin-top:20%;">
						<span class="header">GRAND PRIX Bodybuilding n FItness</span>
						<p class="body">@ Dhmotiko Theatro Strovolou Theater</p>
						</div>
					</div>
					 
					 </li>
				<li>
				<img src="${pageContext.request.contextPath}/assets_front/images/latest_work/img8.jpg" alt="" />
					<div class="portfolio-item-content">
						<span class="header">Western Province Bodybuilding Championship</span>
						<p class="body">Chaminda Peiris Wins Western Province Bodybuilding Championship</p>
					</div> 
					<a href="http://sportstoday.lk/sports.php?id=1029&cat=SportsStories&title=Chaminda+Peiris+Wins+Western+Province+Bodybuilding+Championship"  target="_blank"><i class="more">+</i></a>
					</li>
				<li>
			</ul>
			<!-- End Recent Projects Carousel -->
		</div>
		<!-- End Portfolio Section -->

		<!-- Start Testimonials Section -->
		<div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<!-- Start Recent Posts Carousel -->
						<div class="latest-posts">
							<h3 class="classic-title">
								<span>Latest News</span>
							</h3>
							<div class="latest-posts-classic custom-carousel touch-carousel"
								data-appeared-items="2">

								<!-- Posts 1 -->
								<div class="post-row item">
									<div class="left-meta-post">
										<div class="post-date">
											<span class="day">01</span><span class="month">Dec</span>
										</div>
										<div class="post-type">
											<i class="fa fa-picture-o"></i>
										</div>
									</div>
									<h3 class="post-title"   style="color:#f36510;">
										<a href="#">This Christmas Offer</a>
									</h3>
									<div class="post-content">
										<p style="font-size:14px; font-face:Trebutch MS; color:#f36510;">
											You can register with FIT & FUN health club with in this December 
										and have a 12% discount on one year Subscription. Hurry this offer is valid only
										on December Registration. Conditions Applied.
										</p>
									</div>
								</div>

								<!-- Posts 2 -->
								<div class="post-row item">
									<div class="left-meta-post">
										<div class="post-date">
											<span class="day">25</span><span class="month">April</span>
										</div>
										<div class="post-type">
											<i class="fa fa-picture-o"></i>
										</div>
									</div>
									<h3 class="post-title" style="color:#f36510;">
										<a href="#">Donations for Flood</a>
									</h3>
									<div class="post-content">
										<p style="font-size:14px; font-face:Trebutch MS; color:#f36510;">
										Your Collected dry foods and Healthcare items has been successfully distributed to refugee camps, families,
										Thanks for being with us on this.
										FIT & FUN Administration.
										</p>
									</div>
								</div>

								<!-- Posts 3 -->
								<div class="post-row item">
									<div class="left-meta-post">
										<div class="post-date">
											<span class="day">26</span><span class="month">Dec</span>
										</div>
										<div class="post-type">
											<i class="fa fa-picture-o"></i>
										</div>
									</div>
									<h3 class="post-title" style="color:#f36510;">
										<a href="#">Iframe Video Post</a>
									</h3>
									<div class="post-content">
										<p style="font-size:14px; font-face:Trebutch MS; color:#f36510;">
											Duis aute irure dolor in reprehenderit in voluptate velit
											esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
											occaecat cupidatat non proident, sunt in culpa qui officia
											deserunt mollit. <a class="read-more" href="#">Read
												More...</a>
										</p>
									</div>
								</div>

								<!-- Posts 4 -->
								<div class="post-row item">
									<div class="left-meta-post">
										<div class="post-date">
											<span class="day">26</span><span class="month">Dec</span>
										</div>
										<div class="post-type">
											<i class="fa fa-picture-o"></i>
										</div>
									</div>
									<h3 class="post-title">
										<a href="#">Gallery Post</a>
									</h3>
									<div class="post-content">
										<p>
											Duis aute irure dolor in reprehenderit in voluptate velit
											esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
											occaecat cupidatat non proident, sunt in culpa qui officia
											deserunt mollit. <a class="read-more" href="#">Read
												More...</a>
										</p>
									</div>
								</div>

								<!-- Posts 5 -->
								<div class="post-row item">
									<div class="left-meta-post">
										<div class="post-date">
											<span class="day">26</span><span class="month">Dec</span>
										</div>
										<div class="post-type">
											<i class="fa fa-picture-o"></i>
										</div>
									</div>
									<h3 class="post-title">
										<a href="#">Standard Post without Image</a>
									</h3>
									<div class="post-content">
										<p>
											Duis aute irure dolor in reprehenderit in voluptate velit
											esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
											occaecat cupidatat non proident, sunt in culpa qui officia
											deserunt mollit. <a class="read-more" href="#">Read
												More...</a>
										</p>
									</div>
								</div>

								<!-- Posts 6 -->
								<div class="post-row item">
									<div class="left-meta-post">
										<div class="post-date">
											<span class="day">26</span><span class="month">Dec</span>
										</div>
										<div class="post-type">
											<i class="fa fa-picture-o"></i>
										</div>
									</div>
									<h3 class="post-title">
										<a href="#">Iframe Audio Post</a>
									</h3>
									<div class="post-content">
										<p>
											Duis aute irure dolor in reprehenderit in voluptate velit
											esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
											occaecat cupidatat non proident, sunt in culpa qui officia
											deserunt mollit. <a class="read-more" href="#">Read
												More...</a>
										</p>
									</div>
								</div>

							</div>
						</div>
						<!-- End Recent Posts Carousel -->

					</div><br/>

					<div class="col-md-6">

						<!-- Classic Heading -->
						<h3 class="classic-title">
							<span>Testimonials</span>
						</h3>

						<!-- Start Testimonials Carousel -->
						<div class="custom-carousel show-one-slide touch-carousel"
							data-appeared-items="1">
							<!-- Testimonial 1 -->
							<div class="classic-testimonials item">
								<div class="testimonial-content">
								 <p  style="font-size:14px; font-face:Trebutch MS;">Having never really been a member of a fitness center, I admit I found all the cardio and free weights a bit intimidating and confusing.  Fortunately for me, the staff and other members were very helpful and patient. Everyone really seemed to go out of their way to make me feel welcome..</p>

								</div>
								<div class="testimonial-author"  style="font-size:12px; font-face:Trebutch MS;">
									<span  style="color:#f36510;">Kasuni Senadeera</span> - Member
								</div>
							</div>
							<!-- Testimonial 2 -->
							<div class="classic-testimonials item">
								<div class="testimonial-content">
									<p>Excepteur sint occaecat cupidatat non proident, sunt in
										culpa qui officia deserunt mollit anim laborum. Lorem ipsum
										dolor sit amet, consectetur adipisicing elit.</p>
								</div>
								<div class="testimonial-author">
									<span>John Doe</span> - Customer
								</div>
							</div>
							<!-- Testimonial 3 -->
							<div class="classic-testimonials item">
								<div class="testimonial-content">
									<p>Having never really been a member of a fitness center, I admit I found all the cardio and free weights a bit intimidating and confusing.  Fortunately for me, the staff and other members were very helpful and patient. Everyone really seemed to go out of their way to make me feel welcome..</p>
								</div>
								<div class="testimonial-author">
									<span>Kasuni Senadeera</span> - Member
								</div>
							</div>
						</div>
						<!-- End Testimonials Carousel -->

					</div>
				</div>
			</div>
		</div><br/>
		<!-- End Testimonials Section -->

		<!-- Start Team Members -->
                    <div class="row">

                        <!-- Start Memebr 1 -->
                        <div class="col-md-3 col-sm-6 col-xs-12" data-animation="fadeIn" data-animation-delay="03">
                            <div class="team-member modern">
                                <!-- Memebr Photo, Name & Position -->
                                <div class="member-photo">
                                    <img alt="" src="${pageContext.request.contextPath}/assets_front/images/team_members/asoka.jpg"/>
                                    <div class="member-name">Asoka Kumara<span>Gym Instructor</span>
                                    </div>
                                </div>
                                <!-- Memebr Words -->
                                <div class="member-info">
                                    <p  style="font-size:12px; font-face:Trebutch MS;">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore fugiat.</p>
                                </div>
                              
                                <!-- Memebr Social Links -->
                                <div class="member-socail">
                         
                                   
                                </div>
                            </div>
                        </div>
                        <!-- End Memebr 1 -->

                        <!-- Start Memebr 2 -->
                        <div class="col-md-3 col-sm-6 col-xs-12" data-animation="fadeIn" data-animation-delay="04">
                            <div class="team-member modern">
                                <!-- Memebr Photo, Name & Position -->
                                <div class="member-photo">
                                    <img alt="" src="${pageContext.request.contextPath}/assets_front/images/team_members/instructor1.jpg" />
                                    <div class="member-name">Sangeeth Prasad <span>Gym Instructor</span>
                                    </div>
                                </div>
                                <!-- Memebr Words -->
                                <div class="member-info">
                                    <p  style="font-size:14px; font-face:Trebutch MS;">Hey, no one ever said getting an awesome, healthy body was easy—that's why the word work is in working out.</p>
                                </div>
                             
                                <!-- Memebr Social Links -->
                                <div class="member-socail">
                              
                                   
                                </div>
                            </div>
                        </div>
                        <!-- End Memebr 2 -->

                        <!-- Start Memebr 3 -->
                        <div class="col-md-3 col-sm-6 col-xs-12" data-animation="fadeIn" data-animation-delay="05">
                            <div class="team-member modern">
                                <!-- Memebr Photo, Name & Position -->
                                <div class="member-photo">
                                    <img alt="" src="${pageContext.request.contextPath}/assets_front/images/team_members/instructor2.jpg" />
                                    <div class="member-name">Sandun Salitha<span>Owner</span>
                                    </div>
                                </div>
                                <!-- Memebr Words -->
                                <div class="member-info">
                                    <p  style="font-size:14px; font-face:Trebutch MS;">The world is changing very fast. Big will not beat small anymore. It will be the fast beating the slow </p>
                                </div>
                    
                                <!-- Memebr Social Links -->
                                <div class="member-socail">
                                 
                                   
                                </div>
                            </div>
                        </div>
                        <!-- End Memebr 3 -->

                        <!-- Start Memebr 4 -->
                        <div class="col-md-3 col-sm-6 col-xs-12" data-animation="fadeIn" data-animation-delay="06">
                            <div class="team-member modern">
                                <!-- Memebr Photo, Name & Position -->
                                <div class="member-photo">
                                    <img alt="" src="${pageContext.request.contextPath}/assets_front/images/team_members/instructor0.jpg" />
                                    <div class="member-name">Chadun Salitha<span>Gym Instructor</span>
                                    </div>
                                </div>
                                <!-- Memebr Words -->
                                <div class="member-info">
                                    <p  style="font-size:14px; font-face:Trebutch MS;">Think of this while you're sweating it out and you won't be able to fight the laughter!.</p>
                                </div>
                                
                                <!-- Memebr Social Links -->
                                <div class="member-socail">
                                    
                                   
                                </div>
                            </div>
                        </div>
                        <!-- End Memebr 4 -->

                    </div>
                    <!-- End Team Members -->

            </div><!-- .container -->
        </div>
        <!-- End Team Member Section -->







		<!-- End Content -->




		<!-- Start Footer -->
		<footer>
			<%@include file="footer_front.jsp"%>
		</footer>
		<!-- End Footer -->

	</div>
	<!-- End Container -->

	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<div id="loader">
		<div class="spinner">
			<div class="dot1"></div>
			<div class="dot2"></div>
		</div>
	</div>

	<!-- Style Switcher -->
	<div class="switcher-box">
		<a href="#" class="open-switcher show-switcher"><i
			class="fa fa-cog fa-2x"></i></a>
		<h4>Style Switcher</h4>
		<span>12 Predefined Color Skins</span>
		<ul class="colors-list">
			<li><a onClick="setActiveStyleSheet('blue'); return false;"
				title="Blue" class="blue"></a></li>
			<li><a onClick="setActiveStyleSheet('sky-blue'); return false;"
				title="Sky Blue" class="sky-blue"></a></li>
			<li><a onClick="setActiveStyleSheet('cyan'); return false;"
				title="Cyan" class="cyan"></a></li>
			<li><a onClick="setActiveStyleSheet('jade'); return false;"
				title="Jade" class="jade"></a></li>
			<li><a onClick="setActiveStyleSheet('green'); return false;"
				title="Green" class="green"></a></li>
			<li><a onClick="setActiveStyleSheet('purple'); return false;"
				title="Purple" class="purple"></a></li>
			<li><a onClick="setActiveStyleSheet('pink'); return false;"
				title="Pink" class="pink"></a></li>
			<li><a onClick="setActiveStyleSheet('red'); return false;"
				title="Red" class="red"></a></li>
			<li><a onClick="setActiveStyleSheet('orange'); return false;"
				title="Orange" class="orange"></a></li>
			<li><a onClick="setActiveStyleSheet('yellow'); return false;"
				title="Yellow" class="yellow"></a></li>
			<li><a onClick="setActiveStyleSheet('peach'); return false;"
				title="Peach" class="peach"></a></li>
			<li><a onClick="setActiveStyleSheet('beige'); return false;"
				title="Biege" class="beige"></a></li>
		</ul>
		<span>Top Bar Color</span> <select id="topbar-style"
			class="topbar-style">
			<option value="1">Light (Default)</option>
			<option value="2">Dark</option>
			<option value="3">Color</option>
		</select> <span>Layout Style</span> <select id="layout-style"
			class="layout-style">
			<option value="1">Wide</option>
			<option value="2">Boxed</option>
		</select> <span>Patterns for Boxed Version</span>
		<ul class="bg-list">
			<li><a href="#" class="bg1"></a></li>
			<li><a href="#" class="bg2"></a></li>
			<li><a href="#" class="bg3"></a></li>
			<li><a href="#" class="bg4"></a></li>
			<li><a href="#" class="bg5"></a></li>
			<li><a href="#" class="bg6"></a></li>
			<li><a href="#" class="bg7"></a></li>
			<li><a href="#" class="bg8"></a></li>
			<li><a href="#" class="bg9"></a></li>
			<li><a href="#" class="bg10"></a></li>
			<li><a href="#" class="bg11"></a></li>
			<li><a href="#" class="bg12"></a></li>
			<li><a href="#" class="bg13"></a></li>
			<li><a href="#" class="bg14"></a></li>
		</ul>
	</div>

</body>
</html>