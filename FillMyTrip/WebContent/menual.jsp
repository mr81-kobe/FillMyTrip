<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="zxx"> 
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Go Travel</title>
		<link rel="icon" href="http://del-code.com/images/icon/favicon.png" type="image/png">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="del-code.com" />

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
		<!-- end header-top -->
	
		<div class="delcd-hero">
			<div class="delcd-overlay"></div>
			
			<!-- header cover img -->
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/WVNnH7J/manual.jpg);">
				<div class="desc2">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
							
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>Manual</h2>
									
								</div>
								<!-- end  header txt -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end header cover img -->
			
		</div>
		
		<div id="delcd-tours" class="delcd-section-gray">
			<div class="container">
				
				<!-- start subheading -->
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center heading-section">
						<h3>Menual</h3>
						<p>필마단창</p>
					</div>
				</div>
				<!-- end subheading -->
				
				
				
				
			</div><!-- end container -->
		</div><!-- end section -->
		
		<div class ="row">
		
		
		<img alt="" src="/images/1.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br>
		<div class ="row">
		
		
		<img alt="" src="/images/2.JPG" style ="margin: auto;" class="col-md-8">
		 
		</div> 
		<hr>  
		<br>
		<div class ="row">
		
		
		<img alt="" src="/images/3.JPG" style ="margin: auto;" class="col-md-8">
		   
		</div>
		<hr>
		
		<div class ="row">
		
		
		<img alt="" src="/images/4.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br> 
		
		<div class ="row">
		
		
		<img alt="" src="/images/5.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br> 
		
		<div class ="row">
		
		
		<img alt="" src="/images/6.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br>
		
		<div class ="row">
		
		
		<img alt="" src="/images/7.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br> 
		
		<div class ="row">
		
		
		<img alt="" src="/images/8.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br>
		
		<div class ="row">
		
		
		<img alt="" src="/images/9.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br>
		
		<div class ="row">
		
		
		<img alt="" src="/images/10.JPG" style ="margin: auto;" class="col-md-8 ">
		  
		</div>
		 <hr>
		<br>
		
		
		
		
		
		
		
		
		
		
		
		
		
		<footer>
			<div id="footer">
				<div class="container">
					<div class="row row-bottom-padded-md">
						<div id="footer-title" class="col-md-4 delcd-footer-link">
							<h3>Go Travel</h3>
							<p>Fuasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur explicabo.</p>
						</div>
						<div class="col-md-2 delcd-footer-link">
							<h3>Top Hotels</h3>
							<ul>
								<li><a href="#">Boracay Hotel</a></li>
								<li><a href="#">Dubai Hotel</a></li>
								<li><a href="#">Singapore Hotel</a></li>
								<li><a href="#">Manila Hotel</a></li>
							</ul>
						</div>
						<div class="col-md-2 delcd-footer-link">
							<h3>Interest</h3>
							<ul>
								<li><a href="#">Beaches</a></li>
								<li><a href="#">Family Travel</a></li>
								<li><a href="#">Budget Travel</a></li>
								<li><a href="#">Food &amp; Drink</a></li>
								<li><a href="#">Honeymoon and Romance</a></li>
							</ul>
						</div>
						<div class="col-md-2 delcd-footer-link">
							<h3>Best Places</h3>
							<ul>
								<li><a href="#">Boracay Beach</a></li>
								<li><a href="#">Dubai</a></li>
								<li><a href="#">Singapore</a></li>
								<li><a href="#">Hongkong</a></li>
							</ul>
						</div>
						<div class="col-md-2 delcd-footer-link">
							<h3>Affordable</h3>
							<ul>
								<li><a href="#">Food &amp; Drink</a></li>
								<li><a href="#">Fare Flights</a></li>
							</ul>
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