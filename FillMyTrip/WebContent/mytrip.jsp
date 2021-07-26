<%@page import="board.mytrip"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="java.util.*"%>
<%@ page import="board.trip_comment"%>
<%@ page import="java.util.*"%>
<%@ page import="board.review"%>


<%
				int pageNumber = 1; //기본 페이지 넘버
				String id = null;
			id = (String)session.getAttribute("id");
			String title = request.getParameter("title");
			
			System.out.println(title);
			System.out.println(id);
			boardDAO boardDAO = new boardDAO();
			ArrayList <mytrip> list = boardDAO.goMyTrip(title);
			
			
			
			StringBuffer sbuff=new StringBuffer();
			StringBuffer sbuff1=new StringBuffer();
			for(int i=0;i <list.size();i++){
				
			sbuff.append(list.get(i).getLot());
			
			sbuff.append(",");
			
			}
			for(int i=0;i <list.size();i++){
				
				sbuff1.append(list.get(i).getLat());
				
				sbuff1.append(",");
				
				}
			System.out.println(sbuff.toString());
			System.out.println(sbuff1.toString());
			

			String total_=list.get(0).getTotaltime().substring(6).replace("분", "");
			int ntotal = Integer.parseInt(total_);
			
			%>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Fill My Trip</title>
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
		
		

<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx70571c96476747ee9c12c12216b1db95"></script>

<script type="text/javascript">
var lot ="<%=sbuff.toString()%>";
var lat ="<%=sbuff1.toString()%>";

var lotArray=lot.split(",");
var latArray=lat.split(",");
var i =0;

var viaPoints =[];

function initTmap(){
	// map 생성
	// Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
	var map = new Tmapv2.Map("map_div", { // 지도가 생성될 div
		center: new Tmapv2.LatLng(latArray[0], lotArray[0]),
		width : "100%", // 지도의 넓이
		height : "450px", // 지도의 높이
		zoom: 10
	});
	
	
	for(i= 1; i< lotArray.length-1 ;i++){
		
		

		viaPoints.push({
			viaPointId : "asd",
			viaPointName : "번째",
			viaX : lotArray[i],
			viaY : latArray[i]
		}); 
}
	
	
	
	var headers = {};
	headers["appKey"] = "l7xx70571c96476747ee9c12c12216b1db95";
	headers["Content-Type"] = "application/json";
	
	var param = JSON.stringify({
		"startName" : "출발지",
		"startX" : lotArray[0],
		"startY" : latArray[0],
		"startTime" : "202010080125",
		"endName" : "도착지",
		"endX" : lotArray[i-1],
		"endY" : latArray[i-1],
		"viaPoints" :viaPoints,
		"reqCoordType" : "WGS84GEO",
		"resCoordType" : "EPSG3857",
		"searchOption" : "0",
		"trafficInfo" : "Y"
	});
	
	$
	.ajax({
		method : "POST",
		url : "https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
		headers : headers,
		async : false,
		data : param,
		success : function(response) {
			
			var resultData = response.properties;
			var resultFeatures = response.features;
			

			

			for ( var i in resultFeatures) {
				var geometry = resultFeatures[i].geometry;
				var properties = resultFeatures[i].properties;
				
				var polyline_;

				var drawInfoArr = [];
				 

				if (geometry.type == "LineString") {
					
					var trafficArr = geometry.traffic;
					
					
					
					for ( var j in geometry.coordinates) {
						// 경로들의 결과값(구간)들을 포인트 객체로 변환 
						var latlng = new Tmapv2.Point(
								geometry.coordinates[j][0],
								geometry.coordinates[j][1]);
						// 포인트 객체를 받아 좌표값으로 변환
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
								latlng);
						// 포인트객체의 정보로 좌표값 변환 객체로 저장
						var convertChange = new Tmapv2.LatLng(
								convertPoint._lat,
								convertPoint._lng);

						drawInfoArr.push(convertChange);
					}
					 

					  polyline_ = new Tmapv2.Polyline({
						path : drawInfoArr,
						strokeColor : "#FF0000",
						strokeWeight : 6,
						map : map
					}); 
				

				} else {
					var markerImg = "";
					var size = ""; //아이콘 크기 설정합니다.

					if (properties.pointType == "S") { //출발지 마커
						markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
						size = new Tmapv2.Size(24, 38);
					} else if (properties.pointType == "E") { //도착지 마커
						markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
						size = new Tmapv2.Size(24, 38);
					} else { //각 포인트 마커
						markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png";
						size = new Tmapv2.Size(24, 38);
					}

					// 경로들의 결과값들을 포인트 객체로 변환 
					var latlon = new Tmapv2.Point(
							geometry.coordinates[0],
							geometry.coordinates[1]);
					// 포인트 객체를 받아 좌표값으로 다시 변환
					var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
							latlon);

					var marker = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(
								convertPoint._lat,
								convertPoint._lng),
						icon : markerImg,
						iconSize : size,
						map : map
					});                
					
				}
			}
			
			
		},/////////////////
		error : function(request, status, error) {
			alert("실패");
			console.log("code:" + request.status + "\n"
					+ "message:" + request.responseText + "\n"
					+ "error:" + error);
		}
	});
	
		


	
			
	
	
	
}
</script>
<style>


.myTripTable {
width: 100%;
height: 250px;
font-size: 15pt;
text-align :left;
color: black;
}
.myTrip-th1{

width: 10%;
color:black;

}
.myTrip-th2{
color: black;
width: 35%;

}
.myTrip-th3{
color: black;
width: 30%;

}
.myTrip-th4{
color: black;
width: 20%;

}
.myTrip-th5{

width: 5%;
color: black;

}


</style>
</head>
<body onload="initTmap();">
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
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/fSMrZkN/mytrip.jpg);">
				<div class="desc2">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
							
								<!-- start header txt -->
								<div id="desc-container">
									<h2>Trip</h2>
									<h3>Share Your Experience</h3>
								</div>
								<!-- end header txt -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end header cover img -->
			
		</div>
		
		<!-- start blog section -->
		<div id="delcd-blog-section">
			
			<div class="container">
			
				<!-- start subheading -->
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center heading-section">
						<h3><%=title %></h3>
						<p><%=list.get(0).getUser_id() %> Is The One Who Made This Trip.</p>
					</div>
				</div>
				<!-- end subheading -->
				
				<div class="row row-bottom-padded-md">
					<!-- blog left side -->
					<div class="col-lg-12">
					
						<div class="bottom-border">
							<div class="map_div" id="map_div">
							</div>
							</br>
							<div class="container">
            <table class="myTripTable">
                  <thead>
                     <tr>
                        <th class="myTrip-th1">NO</th>
                        <th class="myTrip-th2">장소명</th>
                        <th class="myTrip-th3">도착(출발)시간</th>
                        <th class="myTrip-th4">거리</th>
                        <th class="myTrip-th5">시간(분)</th>
                     </tr>
                  </thead>
                  <tbody>
                  <% 
                  for(int i =0; i <list.size();i++)
                  {
                     %>
                  <tr>
                  <td style="color:red;"><%=list.get(i).getIndex()%></td>
                  <%
                  if(list.get(i).getName().equals("출발지")){                %>
                  <td><%=list.get(i).getName()%></td>
                  <%}else{
                     %>
                     <td><a href="info.jsp?ti=<%=list.get(i).getName()%>"><%=list.get(i).getName()%></a></td>
                  <%} %>
                  <td><%=list.get(i).getArrivetime().substring(4,6)%>월<%=list.get(i).getArrivetime().substring(6,8)%>일<%=list.get(i).getArrivetime().substring(8,10)%>시<%=list.get(i).getArrivetime().substring(10,12)%>분</td>
                  <td><%=list.get(i).getDistance()%></td>
                  <td><%=list.get(i).getViatime()%></td><% ntotal +=list.get(i).getViatime();   %>
                  </tr>
                  <%
                  }
                  %>
                  <tr>
                  <td></td>
                  <td><%=list.get(0).getTotaldistance()%></td>
                  <td><%=list.get(0).getTotaltime()%></td>
                  <td>총시간: <%=ntotal%>분</td>
                  <td></td>
                  </tr>
                  
                  
                  
                  </tbody>

               </table></br></br></br>

               <!-- $("#tagID").show(); // display 속성을 block 으로 바꾼다.
$("#tagID").hide(); // display 속성을 none 으로 바꾼다.  -->

            </div>
						<!-- 후기 작성및 수정 -->
						<div class="bottom-border">
							<div class="row">
								<div id="author-detail" class="col-md-12">
									<%
         
         review review = new boardDAO().getreview(title);
      
         
         if(boardDAO.reviewCheck(title)==1){
            if(list.get(0).getUser_id().equals(id)){
            %><div id="review"> 
            <p colspan="2" style="min-height: 200px; text-align: left; border: 1; width: 100%; height: 300px"><%= review.getReview_content() %></p>
            <% 
            for(int j=0;j<review.getStarpoint();j++){
               %>
               
               <span style="font-size:60px;cursor:pointer;color:red;text-align:center;"  class="fa fa-star"></span>
               <%
            }
            %>
            </div>
            
            <div id="update" style="display: none;">
            <form action="reviewUpdate.jsp" method="post">
            <textarea name ="reviewContent"  style="border: 1; width: 100%; height: 300px"><%= review.getReview_content() %></textarea>
            <div id="star">
            <span  onmouseover="starmark(this)" onclick="starmark(this)"id="1one"   style="font-size:60px;cursor:pointer;"  class="fa fa-star checked"></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="2one"   style="font-size:60px;cursor:pointer;" class="fa fa-star "></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="3one"   style="font-size:60px;cursor:pointer;" class="fa fa-star "></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="4one"   style="font-size:60px;cursor:pointer;" class="fa fa-star"></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="5one"   style="font-size:60px;cursor:pointer;" class="fa fa-star"></span>
<input type="text" id = 'starpoint' name="STARPOINT" value= "1"  readonly style="display:none;">   
<input type="hidden" id="title" name="title" value="<%=title%>">            
            </div>
            <input type="submit" class="btn btn-primary pull-right" value="완료" /></br></br>
            </form>
            </div>
            <button id="updatebtn" class="btn btn-primary pull-right" onclick="update();">수정</button>
            <%
            }
         }else{
            if(list.get(0).getUser_id().equals(id)){
               %> <button class="comtent_btn btn btn-primary pull-right" onclick="dis();">후기 작성</button>
            <% }
         }
         
         %>
         
            
      
            <div class="content" id="dis" style="display: none;">
            <form action="reviewAction.jsp" method="post">
            <textarea name ="reviewContent" style="border: 1; width: 100%; height: 300px"></textarea>
            <div id="star">
            <span  onmouseover="starmark(this)" onclick="starmark(this)"id="1one"   style="font-size:60px;cursor:pointer;"  class="fa fa-star checked"></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="2one"   style="font-size:60px;cursor:pointer;" class="fa fa-star "></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="3one"   style="font-size:60px;cursor:pointer;" class="fa fa-star "></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="4one"   style="font-size:60px;cursor:pointer;" class="fa fa-star"></span>
<span  onmouseover="starmark(this)" onclick="starmark(this)" id="5one"   style="font-size:60px;cursor:pointer;" class="fa fa-star"></span>
<input type="text" id = 'starpoint' name="STARPOINT" value= "1"  readonly style="display:none;">   
<input type="hidden" id="title" name="title" value="<%=title%>">            
            </div>
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
            </form>
            </div>
            
            
            <script type="text/javascript">
            
            
            function dis(){
                  if($('#dis').css('display') == 'none'){
                  $('#dis').show();
              }else{
                  $('#dis').hide();
              }
              }
            function update(){
                  if($('#update').css('display') == 'none'){
                  $('#update').show();
                  $('#review').hide();
              }else{
                  $('#update').hide();
                  $('#review').show();
              }
              }
            
            var count;

            function starmark(item)
            {
            count=item.id[0];
            sessionStorage.starRating = count;
            var subid= item.id.substring(1);

            for(var i=0;i<5;i++)
            {
            if(i<count)
            {
            document.getElementById((i+1)+subid).style.color="red";

            }
            else
            {
            document.getElementById((i+1)+subid).style.color="black";
            }

            }
            document.getElementById("starpoint").value = count;


            }
            
            </script>
								</div>
							</div>
						</div>
						<!-- end about author -->
						
						
						 <% 
         ArrayList<trip_comment> list3 = boardDAO.gettripComment(title);
            
                         %>
						<!-- start comment -->
						<div id="comment-container">
							<h3 id="comment-count">Comments[<%=boardDAO.getCommentNo(title) %>]</h3>
							
							<div class="comment">
								<%for(int i=0; i< list3.size();i++){
                                %>
								<div class="comment-detail">
									<h4><%=list3.get(i).getUser_id() %></h4>
									<span class="comment-date"><%=list3.get(i).getRegdate()%></span>
								</div>
								<p class="comment-text"><%=list3.get(i).getComment()%></p>
								<% 
								}%>
							</div>
						</div>

								<%
									if (id != null) {
								%>
								<div>
									<form name="comment"
										action="trip_comment_post.jsp?title=<%=title%>" method="POST">

										<h3><%=id%></h3>
										<input type="text" name="comment" style="width: 80%">&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit" class="btn btn-primary">입력</button>
									</form>
								</div>
								<%
									} else {
								%><div style="text-align: center;">
									<form name="comment"
										action="trip_comment_post.jsp?title=<%=title%>" method="POST">
										<p>로그인 시 이용가능합니다.</p>
										<input type="text" name="comment" style="width: 80%">&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit" class="btn btn-primary">입력</button>
									</form>
								</div>
								<%
									}
								%>
								<!-- end comment -->
						
						
						
					</div><!-- end left side -->
					
					

				</div><!-- end row -->
			</div><!-- end container -->
		</div><!-- end blog-section -->
		
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