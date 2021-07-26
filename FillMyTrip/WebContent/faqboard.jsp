<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.io.PrintWriter"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="board.mytrip"%>
<%@ page import="board.review"%>
<%@ page import="java.util.*"%>
    <%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fill My Trip</title>

<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Go Travel</title>
		<link rel="icon" href="http://del-code.com/images/icon/favicon.png" type="image/png">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="del-code.com" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<!-- Animate.css -->
		<link rel="stylesheet" href="css/animate.css">
		<!-- Icomoon Icon Fonts-->
		<link rel="stylesheet" href="css/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Superfish -->
		<link rel="stylesheet" href="css/superfish.css">
		<!-- Magnific Popup -->
		<link rel="stylesheet" href="css/magnific-popup.css">
		<!-- Date Picker -->
		<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
		
		<!-- main css -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/media-query.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
		
		


	


	</head>
</head>
<body>
<div id="delcd-wrapper">
		<div id="delcd-page">

		<header id="delcd-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-delcd-nav-toggle delcd-nav-toggle dark"><i></i></a>
					<h1 id="delcd-logo"><a href="index.jsp"><img id="travel-icon" src="" alt="" /> Fill My Trip</a></h1>
					
					<!-- start navbar -->
					<nav id="delcd-menu-wrap">
						<ul class="sf-menu" id="delcd-primary-menu">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="areaSelect.jsp">Fill My Trip</a></li>
							<li><a href="tripboard.jsp">Travel Sharing</a></li>
							<li><a href="faqboard.jsp">FAQ</a></li>
							<li>
							<%if(session.getAttribute("id") == null) {
								%>
								<li><a href="login.jsp">Login</a></li>
								<%
								}else{
									%>
									<li><a href="#" class="delcd-sub-ddown">My Page</a>
									<ul class="delcd-sub-menu">
									<li><a href="login.jsp">My Page</a></li>
									<li><a href="logout.jsp">Logout</a></li>
								</ul>
								</li>
								<%} %>
							</li>
							
						</ul>
					</nav>
					<!-- end navbar -->
					
				</div>
			</div>
		</header>
		<!-- end:header-top -->
	
		<div class="delcd-hero">
			<div class="delcd-overlay"></div>
			
			<!-- header cover img -->
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/Q8rj5TB/faq3.jpg);">
				<div class="desc2">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>OUR TRIP BOARD</h2>
									<h3>Share Your Experience</h3>
								</div>
								<!-- end  header txt -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end header cover img -->
			
		</div>
		
		<!-- start blog section -->
		<div id="delcd-blog-section" class="delcd-section-gray">
			<div class="container">
			
				<!-- start subheading -->
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center heading-section">
						<h3>Our Blogs</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit est facilis maiores, perspiciatis accusamus asperiores sint consequuntur debitis.</p>
					</div>
				</div>
				<!-- end subheading -->
			
				<!-- start blog row -->
				<div class="row row-bottom-padded-md">
					
					
					
					<!-- blog 1 -->
					<div class="col-lg-4 col-md-6">
						<div class="delcd-blog animate-box">
							
							<div class="blog-text">
								<div class="prod-title">
									<h3><a href="menual.jsp">Manual</a></h3>
									<span class="posted_by">
							</span>
									
									<p></br>    <!-- &nbsp;공백 -->
									
									<p><a href="menual.jsp"">Read More...</a></p>
								</div>
							</div> 
						</div>
					</div>
							
					
					
				</div><!-- end row -->
				<div class="row">
							<div class="col-md-12">
								<div id="prevnext-container" class="col-md-12">
									<a href="#" class="older" onclick="previous();">
										<i class="icon-arrow-long-left"></i><p> 이전 </p> 
									</a>
									<a href="#" class="newer" onclick="next();">
										<p> 다음 </p> <i class="icon-arrow-long-right"></i>
									</a>
									
									<div style="clear:both;"></div>
									
								</div>
							</div>	
						</div>
			</div><!-- end container -->
			
			
		</div><!-- end delcd-blog-section -->
		
		 <footer>
         <div id="footer">
            <div class="container">
               <div class="row row-bottom-padded-md">
                  <div id="footer-title" class="col-md-12 delcd-footer-link" style="text-align: center;">
                     <h3 style="font-size: 45px;">To travel happily, you must travel lightly.</h3>
                     <p style="font-size: 25px;">-Antoine de Saint-Exupery-</p>
                  </div>
                  
               </div>
               <div class="row">
                  <div class="col-md-6 offset-md-3 text-center">
                     <p class="delcd-social-icons">
                        <a href="#"><i class="icon-twitter2"></i></a>
                        <a href="#"><i class="icon-facebook2"></i></a>
                        <a href="#"><i class="icon-instagram"></i></a>
                        <a href="#"><i class="icon-youtube"></i></a>
                     </p>
                     <p>Copyright 2018 by <a href="https://themeforest.net/user/del-code/portfolio">del-code</a>. All Rights Reserved.</p>
                  </div>
               </div>
            </div>
         </div>
      </footer>
	</div>
	<!-- END delcd-page -->

	</div>
	<!-- END delcd-wrapper -->

		<!-- Modernizr JS -->
		<script src="js/modernizr-3.6.0.min.js"></script>
		
		<!-- jQuery -->
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/migrate.min.js"></script>
		
		<!-- Stellar -->
		<script src="js/jquery.stellar.min.js"></script>
		
		<!-- Bootstrap -->
		<script src="js/bootstrap-4.0.0.min.js"></script>
		
		<!-- Waypoints -->
		<script src="js/jquery.waypoints.min.js"></script>
		
		<!-- Sticky Navbar -->
		<script src="js/sticky.js"></script>
		
		<!-- Magnific Popup -->
		<script src="js/jquery.magnific-popup.min.js"></script>
		
		<!-- Date Picker -->
		<script src="js/bootstrap-datepicker.min.js"></script>
		
		<!-- smooth scroll -->
		<script src="js/SmoothScroll.min.js"></script>
		
		<!-- Main JS -->
		<script src="js/main.js"></script>

	

</body>
</html>