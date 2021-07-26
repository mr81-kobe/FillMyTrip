<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); //데이터베이스로 보낼때 한글깨짐 방지%>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
	
		<title>匹馬單槍</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<span><a href="index.jsp" class="logo"><strong>匹馬單槍</strong><b>by 쾌도난마</b></a></span>
					<nav id="nav">
						<a href="index.jsp">Home</a>
						<a href="login.jsp">Login</a>
						<a href="index.jsp">Elements</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>필마단창(匹馬單槍)</h1>
						<p>한 필의 말과 한 개의 창. 아주 간략하게 武裝(무장)함</p>
					</header>

					<div class="flex ">
					<form action="map.jsp" method="POST">
					</br>
                       <input type="text" id ="lat" name =lat value = "" >
                       </br>
                       <input type="text" id= lot name =lot value = "" >
                       </br>
                       <input type="text" id=city name=city>
                       </br>
                       <label><input id ="cb1" type="checkbox" name="tag" value="숙박"> 숙박</label>
                       <label><input id ="cb1" type="checkbox" name="tag" value="음식점"> 음식</label>
                       <label><input id ="cb1" type="checkbox" name="tag" value="문화시설">문화시설</label>
                       <input type="button"value ="현재 위치" onclick="input_lat_lot();" >
                       <input type="submit" value ='지도로 가기'>
                    </form>
					
					</div>

					<footer>
						
					</footer>
				</div>
			</section>


		

		
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script> 
             var cur_lat;
             var cur_lot;
             function getLocation() {
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
                 }
             
	
	



</script>

	</body>
</html>