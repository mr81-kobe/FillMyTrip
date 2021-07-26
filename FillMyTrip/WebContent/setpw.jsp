<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    String id; 
    
    id = (String)session.getAttribute("id");
    
    %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
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
		
		
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jQuery.ajax"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
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
								<li><a href="login.jsp">My Page</a></li>
								
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
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/w0Pw97j/Password.jpg);">
				<div class="desc2">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
							
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>Let Change Password</h2>
									<h3>Important</h3>
								</div>
								<!-- end  header txt -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end header cover img -->
			
		</div>

		
		
				<!-- ///////////////////////////////////////////////////////////////////// -->
				
				<div id="delcd-contact" class="delcd-section-gray">
			<div class="container">
						<div class="row">
							<div class="col-md-12">
							
								<!-- start  header txt -->
								<div id="desc-container">
									<form action="setpwAction.jsp" method="post"
				onsubmit="return input_check_func()" name="join">
					<div class="row">
						
						<!-- start contact desc -->
						
						<!-- end contact desc -->
						
						<!-- start contact form -->
						<div class="col-lg-12">
						
						
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="email" class="form-control" id="email" name="email" placeholder="Email(ID)" value="<%=id %>" readOnly required>
									</div>
								</div>
								
												
								<div class="col-md-6">
									<div class="form-group">
										<input type="password" class="form-control pw" name="pw1" id="pw1" placeholder="Password" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									</div>
									</div>
									
								<div class="col-md-6">
									<div class="form-group">
										<input type="password" class="form-control pw" name="pw2" id="pw2"  placeholder="Confirm Password" required>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
									</div>
									</div>
								<div class="col-md-6">
									<div class="form-group">
								<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> 
                            <span id="alert-danger"style="display: none; color: #d92742; font-weight: bold;">비밀번호가일치하지 않습니다.</span>
                            </div>
                            </div>
								
								
								<div class="col-md-10">
									<div class="form-group">
									</div>
									</div>
									
							
								
								<div class="col-md-2">
									<div class="form-group">
										<input type="button" onclick="checkVaule();" value="비밀번호 변경" class="btn btn-primary">
										
									</div>
								</div>
												
											</div>
						</div>
						<!-- end contact form -->
						
					</div><!-- end row -->
				</form>
								</div>
								<!-- end  header txt -->
								
							</div>
						</div>
					</div>
		</div><!-- end section -->	
					
					
					
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
	
	
	<script type="text/javascript">
	
	function checkVaule(){
		var join = document.join;

		
		var pw4 = $("#pw1").val();
		var pw5 = $("#pw2").val();
		
		var num = pw4.search(/[0-9]/g);
		 var eng = pw4.search(/[a-z]/ig);
		 var spe = pw4.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		
		if(!pw4){
			alert("비밀번호를 입력해주세요.");
			$("#pw1").focus();
		}
		if(!pw5){
			alert("비밀번호를 확인해주세요.");
			$("#pw2").focus();
		}
		if(pw4 == pw5){
			 if(pw4.length < 8 || pw4.length > 20){

				  alert("8자리 ~ 20자리 이내로 입력해주세요.");
				  $("#pw1").focus();
				  return false;
				 }else if(pw4.search(/\s/) != -1){
				  alert("비밀번호는 공백 없이 입력해주세요.");
				  $("#pw1").focus();
				  return false;
				 }else if(num < 0 || eng < 0 || spe < 0 ){
				  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				  $("#pw1").focus();
				  return false;
				 }else {
					 join.submit();
				    return true;
				 }
			
			
		}else{
			alert("비밀번호를 확인해주세요.");
		}
		


		 
		
		
		
		

		
	}
	

	
	
	$(document).ready(function(){
	    $("#btn_email").click(function(){
	        $.ajax({
	            url:'./emailCheck.jsp?emaildata='+$('#email').val(),
	            type:'post',
	            datatype : 'text',
	            success:function(data){
	                
	                $('.double_result2').html(data);
	            },
	            error:function(xhr,textStatus,errorThrown){
	                $('.double_result2').html('ERROR');
	            }
	        })
	    })
	})

	
	function pwcheck(){
		var pw = $("#pw1").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 
		 if(pw.length < 8 || pw.length > 20){

		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  
		  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  
		  return false;
		 }else {
			
		    return true;
		 }
		
	}
	 

	  
	 $('#pw1').focusout(function () {
		 var pw = $("#pw1").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 
		 if(pw.length < 8 || pw.length > 20){

		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  
		  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  
		  return false;
		 }else {
			
		    return true;
		 }
	 });
	 
	 
	 


	 $('.pw').focusout(function () {
	     var pwd1 = $("#pw1").val();
	     var pwd2 = $("#pw2").val();

	     if ( pwd1 != '' && pwd2 == '' ) {
	         null;
	     } else if (pwd1 != "" || pwd2 != "") {
	         if (pwd1 == pwd2) {
	             $("#alert-success").css('display', 'inline-block');
	             $("#alert-danger").css('display', 'none');
	             
	         } else {
	             
	             $("#alert-success").css('display', 'none');
	             $("#alert-danger").css('display', 'inline-block');
	             
	         }
	     }
	 });

	 
	
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