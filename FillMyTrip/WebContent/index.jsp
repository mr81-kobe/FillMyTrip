<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
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
	
		<!-- start header bottom-->
		<div class="delcd-hero">
			<div class="delcd-overlay"></div>
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://cdn.pixabay.com/photo/2017/11/13/22/12/compass-2946959_1280.jpg);">
				<div class="desc">
					<div class="container">
						
						
							<!-- start header text -->
							<div  id="desc-container" class="col-md-12" style="text-align: center;">
								<div class="desc-txt">
									<h2 style="font-size: 45px;">"필마단창 (匹馬單槍)"</h2> 
									<BR>
									<h2 style="font-size: 45px;">"삶 속에 작은 여행계획을 만들어 드려요"</h2> 
									<BR>
									<h2 style="font-size: 45px;">"To travel happily, you must travel lightly."</h2>

									<h3>-Antoine de Saint-Exupery-</h3>

								</div>
							</div>
							<!-- end header text -->
							
						</div><!-- end row -->
						
					</div><!-- end container -->
				</div>
			</div>
		</div>
		<!-- end header bottom-->
		
		<!-- start hot tours -->
		<div id="delcd-tours" class="delcd-section-gray">
			<div class="container">
				
				<!-- start subheading -->
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center heading-section">
						<h3>Function</h3>
						<p>To Travel is to Live -Hans Christian Andersen </p>
					
					</div>
				</div>
				<!-- end subheading -->
				
				<!-- start hot place -->
				<div class="row">
				
					<div class="col-lg-4 delcd-tours animate-box">
						<div class="hot-img-container">
							<a href="#">
								<img src="images\cartrip.jpg" class="img-fluid" alt="" />
							</a>	
							<div class="desc">
								<span></span>
								<h3>당신만의 여행</h3>
								<span>Fil My Trip</span>
								
								<a class="btn btn-primary btn-outline" href="areaSelect.jsp">Planning a trip <i class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4 delcd-tours animate-box">
						<div class="hot-img-container">
							<a href="#">
								<img src="images\mypage.jpg" class="img-fluid" alt="" />
							</a>
							<div class="desc">
								<span></span>
								<h3>MyPage</h3>
								<span>MyPage</span>
								
								<a class="btn btn-primary btn-outline" href="login.jsp">MyPage <i class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4 delcd-tours animate-box">
						<div class="hot-img-container">
							<a href="#">
								<img src="images\fellmytrip.png" class="img-fluid" alt="" />
							</a>
							<div class="desc">
								<span></span>
								<h3>게시판</h3>
								<span>Feel Your Trip</span>
								
								<a class="btn btn-primary btn-outline" href="tripboard.jsp">Share Experiences<i class="icon-arrow-right22"></i></a>
							</div>
						</div>
					</div>
					
					
					
				</div>
				<!-- end hot place -->
				
			</div>
		</div>
		
		
		<!-- start recent blog-section -->
		<div id="delcd-blog-section" class="delcd-section-gray">
			
			<!-- start subheading -->
			<div class="container">
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center heading-section">
						<h3> API USED</h3>
					</div>
				</div>
			</div>
			<!-- end subheading -->
			
			<!-- start blog content -->
			<div class="container">
				
				<div class="row">
					<div class="feature-full-1col animate-box">
						<div class="image" style="background-image: url(https://www.openit.co.kr/static/ir/img/20121010203010421857521_20141013163656762894852.jpg);"></div>
						<div class="desc">
							<h3>T Map API</h3>
							<p>Fill My Trip은 T Map API를 통하여 여행 계획을 수립할때</br> 제일 중요한 경로 탐색기능을 제공하여서 더욱 신속하고 정확한 </br>경로를 사용자에 제공할수 있었습니다. </p>
							<p><a href="https://tmapapi.sktelecom.com/" target="_blank" class="btn btn-primary btn-luxe-primary">Read More <i class="ti-angle-right"></i></a></p>
						</div>
					</div>

					<div class="feature-full-2col animate-box">
						<div class="f-hotel">
							<div class="image" style="background-image: url(https://i.ibb.co/ZNyZ8cX/tourapi2.gif);"></div>
							<div class="desc">
								<h3>Tour API 3.0</h3>
								<p>Fill My Trip은 한국 관광공사에서 만든  Tour API 3.0을 사용하여 데이터의  무결성을 유지함으로써  사용자에게 정확하고 일관성이 있는 수 많은 여행지를 제공할수 있었습니다.</p>
								<p><a href="http://api.visitkorea.or.kr/main.do" target="_blank" class="btn btn-primary btn-luxe-primary">Read More<i class="ti-angle-right"></i></a></p>
							</div>
						</div>
						<div class="f-hotel">
							<div class="image" style="background-image: url(https://i.ibb.co/GH5mQwB/kakao2.png);"></div>
							<div class="desc">
								<h3>Kakao API</h3>
								<p>Fill My Trip은 카카오 API를 통하여 회원가입과 인증을 간소화 하였고 여행계획 공유 기능을 가능하게 구현할수 있었습니다.</p>
								<p><a href="https://developers.kakao.com/" target="_blank" class="btn btn-primary btn-luxe-primary">Read More <i class="ti-angle-right"></i></a></p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<!-- end blog content -->
			
		</div>
		<!-- end recent blog-section -->
		
		<!-- start testimonial -->
		<div id="delcd-testimonial" style="background-image:url(https://i.ibb.co/MRz19fy/background.jpg);">
			<div class="container">
				
				<!-- start subheading -->
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center delcd-heading">
						<h2 style="color:black;">Wise Saying</h2></br>
					</div>
				</div>
				<!-- end subheading -->
				
				<!-- start testimonial box -->
				<div class="row">
				
					<!-- box 1 -->
					<div class="col-md-4">
						<div class="box-testimony">
							<blockquote>
								<span class="quote"><span><i class="icon-quotes-right"></i></span></span>
								<p>&ldquo;등잔 밑에도 아름다움은 있다.&rdquo;</p>
							</blockquote>
							<p class="author" style="color:white;">이은호<span class="subtext" style="color:white;">이등병</span></p>
						</div>
					</div>
					
					<!-- box 2 -->
					<div class="col-md-4">
						<div class="box-testimony">
							<blockquote>
								<span class="quote"><span><i class="icon-quotes-right"></i></span></span>
								<p>&ldquo;여행의 즐거움은 그여행을 계획할때 부터 시작이다.&rdquo;</p>
							</blockquote>
							<p class="author" style="color:black;">황규준<span class="subtext" style="color:black;">상병</span></p>
						</div>
					</div>
					
					<!-- box 3 -->
					<div class="col-md-4">
						<div class="box-testimony">
							<blockquote>
								<span class="quote"><span><i class="icon-quotes-right"></i></span></span>
								<p>&ldquo;시간에 쫒겨 여행의 즐거움을 놓치는 것은 어리석은 짓이다.&rdquo;</p>
							</blockquote>
							<p class="author" style="color:black;">정경석<span class="subtext" style="color:black;">민간인</span></p>
						</div>
					</div>
					
				</div>
				<!-- end testimonial box -->
				
			</div>
		</div>
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