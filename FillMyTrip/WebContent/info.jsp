
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.omg.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="tt.*"%>


  <%

String ti = request.getParameter("ti"); 
//request.getParameter("ti"); 

/* String.valueOf(request.getAttribute("content")); */






int a = 1; // 페이지 초기값
String cid = "";
String tid = "";

String title =ti;


String addr ="";
String img ="";
String homepage ="";
String overview ="";
String usetime ="";
String parking="";
String tel ="";
String restdate ="";
String usepay ="";
String parkingpay ="주차요금";
String keyword = URLEncoder.encode(title, "UTF-8");
String infoname1 ="";
String infoname2 ="";




String myroute ="경석's 여행 계획";
ArrayList list = new ArrayList();

boolean indataUrl = false;
boolean indataUrl2 = false;
boolean indataUrl3 = false;
boolean indataUrl4 = false;
boolean indataUrl5 = false;
boolean indataUrl6 = false;

%>
   <%
try {
   while (true) {         
      // parsing할 url 지정(API 키 포함해서)
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=IhilMM2OP8ukaWbvRR6zLpOkqlVJCkA%2FLB4%2FPoGh6Iik%2B58PL7bz19IT0QQDjoiCKzcwTXUEK4WTY7p%2F%2F2SGXQ%3D%3D&contentTypeId=&contentId=&pageNo=1&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&keyword="+keyword;

      
      
      DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
      DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
      Document doc = dBuilder.parse(url);
      //System.out.println("url  : " + url);
      // root tag
      doc.getDocumentElement().normalize();
      //System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

      // 파싱할 tag

      NodeList nList = doc.getElementsByTagName("item");
      System.out.println("파싱할 리스트 수 : " + nList.getLength());

      for (int temp = 0; temp < nList.getLength(); temp++) {
         Node nNode = nList.item(temp);
         if (nNode.getNodeType() == Node.ELEMENT_NODE) {

            Element eElement = (Element) nNode;
            //System.out.println("######################");
            // System.out.println(eElement.getTextContent());
            NodeList nodeUrl15 = doc.getElementsByTagName("contentid"); // 파싱하고싶은 태그
            cid = nodeUrl15.item(0).getFirstChild().getNodeValue();
            NodeList nodeUrl16 = doc.getElementsByTagName("contenttypeid"); // 파싱하고싶은 태그
            tid = nodeUrl16.item(0).getFirstChild().getNodeValue();
            
            
            
            
            
              
            
                 System.out.println(cid);
                System.out.println(tid);
                

            

         } // for end
      } // if end

      a += 1;
      System.out.println("page number : " + a);

      if (a > 1) {
         break;
      }
   } // while end

} catch (Exception e) {
   e.printStackTrace();
} // try~catch end
////////////////////////////////////////////////////////////////////////////////////////



// 투어 인증키 IhilMM2OP8ukaWbvRR6zLpOkqlVJCkA%2FLB4%2FPoGh6Iik%2B58PL7bz19IT0QQDjoiCKzcwTXUEK4WTY7p%2F%2F2SGXQ%3D%3D
try {
   while (true) {
      // parsing할 url 지정(API 키 포함해서)
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=IhilMM2OP8ukaWbvRR6zLpOkqlVJCkA%2FLB4%2FPoGh6Iik%2B58PL7bz19IT0QQDjoiCKzcwTXUEK4WTY7p%2F%2F2SGXQ%3D%3D&contentTypeId="+tid+"&contentId="+cid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";

      
      
      DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
      DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
      Document doc = dBuilder.parse(url);
      //System.out.println("url  : " + url);
      // root tag
      doc.getDocumentElement().normalize();
      //System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

      // 파싱할 tag

      NodeList nList = doc.getElementsByTagName("item");
      System.out.println("파싱할 리스트 수 : " + nList.getLength());

      for (int temp = 0; temp < nList.getLength(); temp++) {
         Node nNode = nList.item(temp);
         if (nNode.getNodeType() == Node.ELEMENT_NODE) {

            Element eElement = (Element) nNode;
            //System.out.println("######################");
            // System.out.println(eElement.getTextContent());
            NodeList nodeUrl = doc.getElementsByTagName("title"); // 파싱하고싶은 태그
            title = nodeUrl.item(0).getFirstChild().getNodeValue();
            NodeList nodeUrl2 = doc.getElementsByTagName("addr1"); // 파싱하고싶은 태그
            addr = doc.getElementsByTagName("addr1").item(0).getFirstChild().getNodeValue();
            /* NodeList nodeUrl3 = doc.getElementsByTagName("mapy"); // 파싱하고싶은 태그
            lat = Float.parseFloat(doc.getElementsByTagName("mapy").item(0).getFirstChild().getNodeValue()); */
            /* NodeList nodeUrl4 = doc.getElementsByTagName("firstimage2"); // 파싱하고싶은 태그
            img = nodeUrl4.item(0).getFirstChild().getNodeValue(); */
            /* NodeList nodeUrl7 = doc.getElementsByTagName("homepage"); // 파싱하고싶은 태그
            homepage = nodeUrl7.item(0).getFirstChild().getNodeValue(); */
            NodeList nodeUrl8 = doc.getElementsByTagName("overview"); // 파싱하고싶은 태그
            overview = nodeUrl8.item(0).getFirstChild().getNodeValue();
            
            
            
            
            
            NodeList nodeUrl5 = doc.getElementsByTagName("homepage"); // 파싱하고싶은 태그

            if (nodeUrl5.item(0) == null) {
               homepage = "준비중";

            } else {
               homepage = nodeUrl5.item(0).getFirstChild().getNodeValue();
            }

            NodeList nodeUrl6 = doc.getElementsByTagName("firstimage"); // 파싱하고싶은 태그

            if (nodeUrl6.item(0) == null) {

               img = "준비중";

            } else {
               img = nodeUrl6.item(0).getFirstChild().getNodeValue();
            }
              
            
                 System.out.println(title);
                System.out.println(addr);
                System.out.println(homepage);
                System.out.println(img);
                System.out.println(overview);
                 

            

         } // for end
      } // if end

      a += 1;
      System.out.println("page number : " + a);

      if (a > 1) {
         break;
      }
   } // while end

} catch (Exception e) {
   e.printStackTrace();
} // try~catch end
////////////////////////////////////////////////////////////////////////////////////////


try {
   while (true) {
      // parsing할 url 지정(API 키 포함해서)
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=IhilMM2OP8ukaWbvRR6zLpOkqlVJCkA%2FLB4%2FPoGh6Iik%2B58PL7bz19IT0QQDjoiCKzcwTXUEK4WTY7p%2F%2F2SGXQ%3D%3D&contentTypeId="+tid+"&contentId="+cid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y";

      System.out.println(url);
      
      DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
      DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
      Document doc = dBuilder.parse(url);
      //System.out.println("url  : " + url);
      // root tag
      doc.getDocumentElement().normalize();
      //System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

      // 파싱할 tag

      NodeList nList = doc.getElementsByTagName("item");
      System.out.println("파싱할 리스트 수 : " + nList.getLength());

      for (int temp = 0; temp < nList.getLength(); temp++) {
         Node nNode = nList.item(temp);
         if (nNode.getNodeType() == Node.ELEMENT_NODE) {

            Element eElement = (Element) nNode;
            NodeList nodeUrl9 = doc.getElementsByTagName("usetime"); // 파싱하고싶은 태그
            
            if(nodeUrl9.item(0)==null){
            	usetime="준비중";
            }else{
            	if(nodeUrl9.item(0).getNodeValue()==null) {
            		usetime = "없음";
            	}else {
            		usetime = nodeUrl9.item(0).getFirstChild().getNodeValue();
            	}
            	
            }
            
            NodeList nodeUrl10 = doc.getElementsByTagName("parking"); // 파싱하고싶은 태그
            
            if (nodeUrl10.item(0) == null) {
				parking = "준비중";
			} else {
				if (nodeUrl10.item(0).getNodeValue() == null) {
					parking = "없음";
				} else {
					parking = nodeUrl10.item(0).getFirstChild().getNodeValue();
				}

			}
            
            
             NodeList nodeUrl11 = doc.getElementsByTagName("restdate"); // 파싱하고싶은 태그
             
             if(nodeUrl11.item(0)==null){
            	 restdate="없음";
             }else{
             	if(nodeUrl11.item(0).getNodeValue()==null) {
             		restdate = "없음";
             	}else {
             		restdate = nodeUrl11.item(0).getFirstChild().getNodeValue();
             	}
             	
             }
             
              
            NodeList nodeUrl12 = doc.getElementsByTagName("infocenter"); // 파싱하고싶은 태그
            
            if(nodeUrl12.item(0)==null){
           	 tel="준비중";
            }else{
            	if(nodeUrl12.item(0).getNodeValue()==null) {
            		tel = "없음";
            	}else {
            		tel = nodeUrl12.item(0).getFirstChild().getNodeValue();
            	}
            	
            }
            

              
            
                System.out.println(usetime);
                System.out.println("par"+parking);
                System.out.println(restdate);
                System.out.println(tel);


         } // for end
      } // if end

      a += 1;
      System.out.println("page number : " + a);

      if (a > 2) {
         break;
      }
   } // while end

} catch (Exception e) {
   e.printStackTrace();
} // try~catch end
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
try {
   while (true) {
      // parsing할 url 지정(API 키 포함해서)
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=IhilMM2OP8ukaWbvRR6zLpOkqlVJCkA%2FLB4%2FPoGh6Iik%2B58PL7bz19IT0QQDjoiCKzcwTXUEK4WTY7p%2F%2F2SGXQ%3D%3D&contentTypeId="+tid+"&contentId="+cid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y";
      
      
      
      DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
      DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
      Document doc = dBuilder.parse(url);
      System.out.println("url  : " + url);
      // root tag
      doc.getDocumentElement().normalize();
      //System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

      // 파싱할 tag

      NodeList nList = doc.getElementsByTagName("item");
      System.out.println("파싱할 리스트 수 : " + nList.getLength());

      
         Node nNode = nList.item(0);
         if(nNode==null){     // 파싱할 객체가 아예없을때
        	infoname1 ="없음";
        	infoname2 ="없음";
            usepay="없음";
            parkingpay = "없음";
         }else{
            
         
         if (nNode.getNodeType() == Node.ELEMENT_NODE) {

            Element eElement = (Element) nNode;        
            //System.out.println("######################");
            // System.out.println(eElement.getTextContent());
            NodeList nodeUrl13 = doc.getElementsByTagName("infoname");
            NodeList nodeUrl14 = doc.getElementsByTagName("infotext"); // 파싱하고싶은 태그
            
            
            infoname1 = nodeUrl13.item(0).getFirstChild().getNodeValue();
            usepay = nodeUrl14.item(0).getFirstChild().getNodeValue();
            
            infoname2 = nodeUrl13.item(1).getFirstChild().getNodeValue();
            parkingpay = nodeUrl14.item(1).getFirstChild().getNodeValue();
           
      
                 System.out.println("ffffffffff"+usepay);
                System.out.println("asdasdasd"+parkingpay);
                
                
                 

            

         } // for end
   }

      a += 1;
      System.out.println("page number : " + a);

      if (a > 1) {
         break;
      }
   } // while end

} catch (Exception e) {
   e.printStackTrace();
} // try~catch end



%>
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

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


<meta charset="UTF-8">


<style>

/* #A0A0FF */
 .a{
background-image:url('./images/background.jpg');
background-color: #D2D2FF;
background-repeat: no-repeat; 
background-size: cover;
background-blend-mode: multiply;
height: 500px;
} 

.b li{
text-decoration: underline;
text-decoration-color: #F4A460;
text-underline-position: under;

}
.ccc {
font-size: 13pt;
}
.nav-pills>li.aaa{ 
 
 text-align: center; 
 
 background-color: #F4A460; 
 
 
 color: white; 
 
}
.nav-pills>li>a:hover{ 
 
 text-align: center; 
 
 background-color: #F4A460; 
 
 color: white; 
 
}
.nav-pills>li>a:focus{ 
 
 text-align: center; 
 
 background-color: #F4A460; 
 
 color: white; 
 
}

</style>
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
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/bLqHwM1/info.jpg);">
				<div class="desc2">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
							
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>TOUR DETAILS</h2>
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
		
		<div id="delcd-blog-section" class="delcd-section-gray">
			
			<div class="container">
				
				<!-- start subheading -->
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center heading-section">
						<h3>Spot Information</h3>
						<p>Here You Can Find a Lot Of Information About The Place.</p>
					</div>
				</div>
				<!-- end subheading -->
			
				<div class="row">
				
					<!-- start price -->
					<div class="col-lg-5 order-lg-5">
						
						<!-- start price box  -->
						<div class="row">
							<div class="col-sm-12">
								<div class="car tour-price">
									<h2 style="font-size: 40px;"><%=title%></h2>
									<h3>   주소: <%=addr%></br></br>
						번호: <%=tel%></br></br>
						홈페이지: <%=homepage%></h3></br>
								</div>
							</div>
						</div>
						<!-- end price box  -->
						
						<!-- start date & age -->
						
						<!-- end date & age -->
						
						<!-- cart button -->
						
						
					</div>
					<!-- end price -->
					
					<!-- start slider -->
					<div class="col-lg-7 order-lg-1">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <div class="carousel-inner">
							<div class="carousel-item active">
							  <img class="d-block w-100" src="<%=img%>" alt=""></br>
							</div>
							
						  </div>
						</div>
					</div>
					<!-- end slider -->
					
					
				
				</div><!-- end row -->
				
				
				<!-- end button image -->
				
				<div class="row">
					<div class="col-md-12">
						
						<!-- Nav tabs -->
						<ul id="form-tab-panel" class="nav nav-tabs tour-tabs">
							<li class="nav-item">
								<a class="nav-link active" href="#details" data-toggle="tab">Details</a>
							</li>
							<li class="nav-item">
							   <a class="nav-link" href="#reviews" data-toggle="tab">Reviews</a>
							</li>
							<li class="nav-item">
							   <a class="nav-link" href="#photos" data-toggle="tab">Photos</a>
							</li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content tour-tabpane">

							<!-- start tab flights -->
							<div class="tab-pane active" id="details">
								<h3><%=overview%></h3>
							</div>
							
							<div class="tab-pane" id="reviews">
								 <div class="row">
               <div class="col-md-3">
                  <p><h3>이용시간 :</h3> <%=usetime%></p>
               </div>
               <div class="col-md-3">
                  <p><h3>주차여부 :</h3> <%=parking%></p>
                     
                  </br>
               </div>
               <div class="col-md-3">
                  <p><h3>휴무일 :</h3> <%=restdate%></p> 
                   </br>
               </div>
            </div>
							</div>
							
							<div class="tab-pane" id="photos">
								
								<div class="row">
                  <div class="col-md-4">
                     <p><h3><%=infoname1%> : </h3><p><%=usepay%></p>
                  </div>
                   <div class="col-md-1"></div>
                  <div class="col-md-4">
                    
                        <p><h3><%=infoname2%>:</h3> <%=parkingpay%></p>
                        </br>
                  </div>

               </div>
								
							</div><!-- end photo tab -->
							
						</div><!-- end tab-pane -->
					</div>
				</div><!-- end row -->		
				
			</div><!-- end container -->
		</div>
		<!-- end delcd-blog-section -->
		
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