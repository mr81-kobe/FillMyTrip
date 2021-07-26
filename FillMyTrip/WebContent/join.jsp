<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Fill My Trip</title>
<meta charset="utf-8" />
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
								<li><a href="login.jsp">Login</a></li>
								
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
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/qgkDrd4/image.jpg);">
				<div class="desc2">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
							
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>CONTACT US</h2>
									<h3>Let Us Know</h3>
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
									<form action="joinCheck.jsp" method="post"
				onsubmit="return input_check_func()" name="join">
					<div class="row">
						
						<!-- start contact desc -->
						
						<!-- end contact desc -->
						
						<!-- start contact form -->
						<div class="col-lg-12">
						
						
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="email" class="form-control" id="email" name="email" placeholder="Email(카카오계정) " readOnly required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
												<input type="button" id="btn_email" value="중복확인"
													class="btn btn-primary"">&nbsp;&nbsp;&nbsp;&nbsp;
												<span class="double_result2" style="color: gray;">(닉네임는
														한글 1~5자 영문 4~15자)</span></br>
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
								<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> 
                            <span id="alert-danger"style="display: none; color: #d92742; font-weight: bold;">비밀번호가일치하지 않습니다.</span>
                            </div>
                            </div>
								
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
									</div>
								</div>
								<div class="col-md-6">
								<div class="form-group">
												
												<input type="text" class="form-control" id="date-start" name="birthday" placeholder="mm/dd/yyyy"   required>
											 </div>
											 </div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" name="ph" id="ph" placeholder="010-XXXX-XXXX" required>
									</div>
								</div>
								<div class="col-md-12">
													<div class="form-group">
														<a id="custom-login-btn"
															href="javascript:loginWithKakao()"> <img
															src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
															width="222" />
														</a>
													</div>
												</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="submit" value="회원가입" class="btn btn-primary">
										
										<input type="hidden" id="id" name="id" value=1>
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


	/* function logoutWithKakao(){
	    Kakao.Auth.logout();
	    alert('카카오 로그아웃 완료!');
	    location.href="http://localhost:8090/kakao/logout.jsp";
	    //setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)
	    //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
	    location.href="http://localhost:8090/kakao/logout.jsp";
	}
	 */
	 

	  
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
	  /* $("#pw1").focus(); */
	  return false;
	 }else {
		console.log("통과"); 
	    return true;
	 }
	 });
	 
	 
	 
	 
	 $('#ph').focusout(function () {
		 var ph = $("#ph").val();
		 var check =/^\d{3}-\d{4}-\d{4}$/;
		 
		 if(ph.match(check) != null) {            
			 
	            
	}else{
		alert("핸드폰 번호가 잘못됐습니다");
		
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

	 Kakao.init('a5b8514dc12c280d44a8f1cb14bcd0c4');

	 
	 function loginWithKakao(){
		 
	 Kakao.Auth.loginForm({
	     
	     success: function(authObj) {
	       Kakao.API.request({
	         url: '/v2/user/me',
	         success: function(res) {
	            
	            
	         
	       var id = res.id; //데이터베이스의 primary Key값 속성 즉 기본키의 식별성
	       var email = res.kakao_account.email;
	       var birthday = res.kakao_account.birthday;
	       var birthdaymonth = birthday.substring(0,2);
	       var birthdayday = birthday.substring(2,4);
	       var name = res.properties.nickname;
	       
	       
	        
	         
	         
	         document.getElementById("id").value= id;
	         document.getElementById("email").value= email; 
	         document.getElementById("name").value= name; 
	         
	         document.getElementById("date-start").value= birthday.substring(0,2)+"/"+birthday.substring(2,4)+"/"; 
	  
	         
	         this.setState({
	            isLogin: true
	         })

	      
	            //$('body').append(html);   
	            
	         //location.href='http://localhost:8090/kakao/index.jsp?id=' + id + '&email=' + email +'&name=' +name ;
	         //window.open("http://localhost:8090/kakao/index.jsp");

	         
	             
	         },
	         fail: function(error) {
	           alert(
	             'login success, but failed to request user information: ' +
	               JSON.stringify(error)
	           )
	         },
	       })
	     },
	     fail: function(err) {
	       alert('failed to login: ' + JSON.stringify(err))
	     },
	   })

	 }
	 
	
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