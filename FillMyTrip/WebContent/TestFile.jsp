<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = null;
id = (String)session.getAttribute("id");
			System.out.println(id);
String areaCode ; 
areaCode =request.getParameter("areaCode");

%>


<html lang="zxx">
	<head>
	<script> 
var cur_lat;
var cur_lot;
/* function getLocation() {
  if (navigator.geolocation) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
      cur_lat= position.coords.latitude ;
      cur_lot= position.coords.longitude;
    }, function(error) {
      console.error(error);
    }, {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    });
  } else {
    alert('GPS를 지원하지 않습니다');
  }
}
getLocation();

function input_lat_lot(){


document.getElementById("lat").value = cur_lat;
document.getElementById("lot").value = cur_lot;
} */







function categoryChange(e) {
	var good_a = ["자연관광지", "관광자원", "역사관광지", "휴양관광지","체험관광지","산업관광지","건축/조형물"];
	var good_b = ["문화시설"];
	var good_c = ["축제", "공연/행사"]; 
	var good_d = ["레포츠소개", "육상 레포츠", "수상 레포츠", "항공 레포츠", "복합 레포츠"]; 
	var good_e = ["5일장", "상설시장", "백화점", "면세점", "할인매장","전문상가","공예,공방","관광기념품점","특산물판매점"]; 
	var good_f = ["한식", "서양식", "일식", "중식", "아시아식","패밀리레스토랑","이색음식점","채식전문점","바/까페","클럽"];
	var target = document.getElementById("good");

	if(e.value == "a") var d = good_a;
	else if(e.value == "b") var d = good_b;
	else if(e.value == "c") var d = good_c;
	else if(e.value == "d") var d = good_d; 
	else if(e.value == "e") var d = good_e; 
	else if(e.value == "f") var d = good_f;
	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}	
}


</script>
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
	<body onload = "input_lat_lot();">
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
						
							
								<div class="tabulation">

								  <!-- Nav tabs -->
								   <ul id="form-tab-panel" class="nav nav-tabs">
								      <li class="nav-item">
								      	<a class="nav-link " href="#trains" data-toggle="tab">지역설정</a>
								      </li>
								      <li class="nav-item">
								    	   <a class="nav-link active" href= "#flights" data-toggle="tab">여행 테마 만들기 </a>
								      </li>
									  <li class="nav-item">
								    	   <a class="nav-link" href="#hotels" data-toggle="tab">코스만들기</a>
								      </li>
								   </ul>

								   <!-- Tab panes -->
								   <div class="tab-content">
									
									 <!-- start tab flights -->
									 <div class="tab-pane active" id="flights">
										 <form action="ad.jsp" method="post">
										  <!-- start destination -->
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Check In:</label>
												<br>
												<input type="datetime-local"  name="date-start" >
											 </div>
											</div>
											<div class="col-sm-6">
											  <div class="form-group">
												<label>time(Minute):</label>
												<br>
												<input type="number" value = "0" name ="min">
											  </div>
											</div>
											
										  </div>
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Check In:</label>
												<select class="form-control" onchange="categoryChange(this)">
	
											<option>테마 선택</option>
											<option value="a">관광지</option>
											<option value="b">문화시설</option>
											<option value="c">축제공연행사</option>
											<option value="d">레포츠</option>
											<option value="e">쇼핑</option> 
											<option value="f">음식</option> 

												</select>
											 </div>
											</div>
											
											
										  </div>
										  <!-- end destination -->
										  <input type="hidden" id="areaCode" name="areaCode" value="<%=areaCode%>">
										  <input type="hidden" id="lat" name="lat" value="37.379815" >
										<input type="hidden"id="lot" name="lot" value ="126.926993"> 
										  
<!-- start check in -->
										 
										  <!-- end check in -->
										  
										  <!-- start class -->		
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Class:</label>
												<select id="good" class="form-control" name = "sel">
													<option>대분류를 선택해 주세요</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end class -->
										  
										  <!-- start age -->		
										  <div class="form-row">										  
										 </div>
										  <!-- end age -->
										  
										  <div class="form-row">										  
											<div class="col-sm-12">
												<input type="submit" class="btn btn-primary btn-block" value="코스 만들기">
											
											</div>
										  </div>	
										  
										</form>
									 </div>
									 <!-- end tab flights -->
									 
									  <!-- start tab trains -->
									 <div class="tab-pane" id="trains">
										 <form>
										  <!-- start destination -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>From:</label>
												<input type="text" class="form-control from-place" placeholder="Kuala Lumpur, Malaysia"/>
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<label>To:</label>
												<input type="text" class="form-control to-place" placeholder="Singapore, Singapore"/>
											  </div>
											</div>
										  </div>
										  <!-- end destination -->
										  
										  <!-- start check in -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Check In:</label>
												<input type="text" class="form-control date-start" placeholder="mm/dd/yyyy"/>
											 </div>
											</div>
											
											
										  </div>
										  <!-- end check in -->
										  
										  <!-- start class -->		
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Class:</label>
												<select class="form-control">
													<option value="economy" selected>Economy</option>
													<option value="first">First</option>
													<option value="business">Business</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end class -->
										  
										  <!-- start age -->		
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Adult:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
											
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Children:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end age -->
										  
										  <div class="form-row">										  
											<div class="col-sm-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Flight">
											</div>
										  </div>	
										  
										</form>
									 </div>
									 <!-- end tab trains -->
									 
									 <!-- start tab hotels -->	
									 <div class="tab-pane" id="hotels">
									 
										<form>
										  <!-- start city -->
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>City:</label>
												<input type="text" class="form-control from-place" placeholder="Istanbul, Turkey"/>
											 </div>
											</div>
										  </div>
										  <!-- end city -->
										  
										  <!-- start check in -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Return:</label>
												<input type="text" class="form-control date-start" placeholder="mm/dd/yyyy"/>
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<label>Check Out:</label>
												<input type="text" class="form-control date-end" placeholder="mm/dd/yyyy"/>
											  </div>
											</div>
										  </div>
										  <!-- end check in -->
										  
										  <!-- start rooms -->		
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Rooms:</label>
												<select class="form-control">
													<option value="economy">Economy</option>
													<option value="regular">Regular</option>
													<option value="vip" selected>VIP</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end class -->
										  
										  <!-- start age -->		
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Adult:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
											
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Children:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end age -->
										  
										  <div class="form-row">										  
											<div class="col-sm-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Hotel">
											</div>
										  </div>	
										  
										</form>
									 </div>
									 <!-- end tab hotel -->
									 
									 
									</div><!-- end tab content -->
								</div><!-- end tabulation -->
						
							<!-- start header text -->
							<div  id="desc-container" class="col-md-7">
								<div class="desc-txt">
									

								</div>
							</div>
							<!-- end header text -->
							
						
						
					</div><!-- end container -->
				</div>
			</div>
		</div>
		<!-- end header bottom-->
		
		<!-- start hot tours -->
		
		
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