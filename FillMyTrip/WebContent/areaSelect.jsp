<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
	<style>
	
.nav-pills {
	margin: 0;
	padding: 0;
	clear: both;
	text-align: center
}
.nav-pills li{
float:none;
     display:inline-block;
     padding:10px 20px;
     
     margin:0;
}
	</style>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Fill My Trip</title>
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

<%
if(session.getAttribute("id") == null){
	response.sendRedirect("login.jsp");
}

%>

	</head>
	<body>
		<div id="delcd-wrapper">
		<div id="delcd-page">
	
		<!-- start header top-->
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
		<!-- end header top-->
	<div class="delcd-hero">
			<div class="delcd-overlay"></div>
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://cdn.pixabay.com/photo/2017/11/13/22/12/compass-2946959_1280.jpg);">
				<div class="desc">
					<div class="container">
						
						<div class="row">
							
							
							<!-- start header text -->
							<div  id="desc-container" class="col-md-7">
								<div class="desc-txt">
									<h2>Area Select</h2>
									<h3></h3>
								</div>
							</div>
							<!-- end header text -->
							
						</div><!-- end row -->
						
					</div><!-- end container -->
				</div>
			</div>
		</div>
		<!-- start header bottom-->
		
		<!-- end header bottom-->
		
		<!-- start hot tours -->
		
		<!-- end hot tours -->
		
		<!-- start travel plans -->
		
		<!-- end travel plans -->
		
		<!-- start popular destination -->
		
		<ul class="nav nav-pills" role="tablist" id="myTab">
			<li role="presentation" class="tab"><a class="btn btn-primary btn-lg"
				href="#home" aria-controls="home" role="tab" data-toggle="tab">중부지방</a></li>
			<li role="presentation" class="tab"><a class="btn btn-primary btn-lg"
				href="#profile" aria-controls="profile" role="tab" data-toggle="tab">남부지방</a></li>
		</ul>
		
		<div class="tab-content">
		
		
			
			<div class="tab-pane active" id ="home">
				
					<div class="row">
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/seoul_img.jpg);">
								<a href="TestFile.jsp?areaCode=1" >
									<div class="case-studies-summary">
										<h2>서울</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/incheon_img.jpg); ">
								<a href="TestFile.jsp?areaCode=2" >
									<div class="case-studies-summary">
										<h2>인천</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/gyeong-gi_img.jpg); ">
								<a href="TestFile.jsp?areaCode=31" >
									<div class="case-studies-summary">
										<h2>경기도</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/gang-wondo_img.jpg); ">
								<a href="TestFile.jsp?areaCode=32" >
									<div class="case-studies-summary">
										<h2>강원도</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-3 col-md-3 dest-grid">
							<div class="destination-list" style="background-image: url(images/daejeon_img.jpg);">
								<a href="TestFile.jsp?areaCode=3" >
									<div class="case-studies-summary">
										<h2>대전</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-6 col-md-6 dest-grid">
							<div class="title-bg">
								<div class="title-bg-txt" role="presentation">
									<h2>Popular Destinations</h2>
									<span><a href="#profile" class="south" aria-controls="profile" role="tab" data-toggle="tab">중부지방</a></span></h2>
									
								</div>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-3 dest-grid">
							<div class="destination-list" style="background-image: url(images/sejong_img.jpg); ">
								<a href="TestFile.jsp?areaCode=8" >
									<div class="case-studies-summary">
										<h2>세종</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/N-chungcheong_img.jpg); ">
								<a href="TestFile.jsp?areaCode=33" >
									<div class="case-studies-summary">
										<h2>충청북도</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/S-chungcheong_img.jpg); ">
								<a href="TestFile.jsp?areaCode=34" >
									<div class="case-studies-summary">
										<h2>충청남도</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(http://via.placeholder.com/600x400/f4be53/fffff); ">
								<a href="" >
									<div class="">
										<h2>X</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(http://via.placeholder.com/600x400/dedede/fffff); ">
								<a href="" >
									<div class="">
										<h2>X</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
					
				</div>
				
				
			
		
		
		<div role="tabpanel" class="tab-pane" id="profile">
				<div class="container-fluid" id ="profile">
				
					<div class="row">
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/jeju_img.jpeg);">
								<a href="TestFile.jsp?areaCode=39" >
									<div class="case-studies-summary">
										<h2>제주</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/busan_img.jpg); ">
								<a href="TestFile.jsp?areaCode=6" >
									<div class="case-studies-summary">
										<h2>부산</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/dae-gu_img.jpg); ">
								<a href="TestFile.jsp?areaCode=4" >
									<div class="case-studies-summary">
										<h2>대구</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/gwangju_img.jpg); ">
								<a href="TestFile.jsp?areaCode=5" >
									<div class="case-studies-summary">
										<h2>광주</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-3 col-md-3 dest-grid">
							<div class="destination-list" style="background-image: url(images/ulsan_img.jpg);">
								<a href="TestFile.jsp?areaCode=7" >
									<div class="case-studies-summary">
										<h2>울산</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-6 col-md-6 dest-grid">
							<div class="title-bg">
								<div role="presentation" class="tab">
								<div class="title-bg-txt" >
									<h2>Popular Destinations</h2>
									<a href="#home"   role="tab" data-toggle="tab">남부지방</a>
								</div>
							</div>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-3 dest-grid">
							<div class="destination-list" style="background-image: url(images/N-gyeongsang_img.png); ">
								<a href="TestFile.jsp?areaCode=35" >
									<div class="case-studies-summary">
										<h2>경상북도</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/S-gyeongsang_img.jpg); ">
								<a href="TestFile.jsp?areaCode=36" >
									<div class="case-studies-summary">
										<h2>경상남도</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/N-jeolla_img.jpg); ">
								<a href="TestFile.jsp?areaCode=37" >
									<div class="case-studies-summary">
										<h2>전라북도</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(images/S-jeolla_img.jpg); ">
								<a href="TestFile.jsp?areaCode=38" >
									<div class="case-studies-summary">
										<h2>전라남도</h2>
									</div>
								</a>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6 dest-grid">
							<div class="destination-list" style="background-image: url(http://via.placeholder.com/600x400/dedede/fffff); ">
								<a href="" >
									<div class="case-studies-summary">
										<h2>X</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		
		
		</div>
		<!-- end popular destination -->
		
		<!-- start recent blog-section -->
		
		<!-- end recent blog-section -->
		
		<!-- start testimonial -->
		
		<!-- end testimonial -->
		
		<!-- start footer -->
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
		<!-- end footer -->	

	</div>
	<!-- END delcd-page -->

	</div>
	<!-- END delcd-wrapper -->
<script>

	</script>
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