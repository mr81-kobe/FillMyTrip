<%@page import="board.mytrip"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="board.review"%>
<%@ page import="java.util.*"%>



<%

int p =0;

if(request.getParameter("page")==null){
	 p = 0;	
}else {
	
	 p = Integer.parseInt(request.getParameter("page"));
}

String id = null;
int trip_pageNumber = 1;
boardDAO boardDAO = new boardDAO();


%>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Fill My Trip</title>
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
		
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jQuery.ajax"></script>
		
		
		
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
function trip_delete(i){

	var returnValue = confirm('정말 삭제하시겠습니까?');
	if(returnValue==true){
		
		
		location.href= "/deletemytrip.jsp?title="+i;
			
	}
}

function trip_available(title,available){
	
	if(available ==0){
		var returnValue = confirm('공개하시겠습니까?');
		
	}else if(available == 1){
		var returnValue = confirm('비공개하시겠습니까?');
	}
	
	if(returnValue==true){
		
		if(available ==0){
			available = 1;
			
		}else if(available == 1){
			available = 0;
		}
		
		location.href= "/trip_available.jsp?title="+title+"&available="+available;
			
	}
	
}






Kakao.init('a5b8514dc12c280d44a8f1cb14bcd0c4');
function sendLink(title,content) {
    Kakao.Link.sendCustom({
      templateId: 36992,
      templateArgs: {
    	  THU :"https://i.ibb.co/TqR5SFt/picnic.jpg",
    	  title : title,
    	  url :"mytrip.jsp?title="+title,
    	  content :content,
    	 
    
      },
    })
  }


function next(){
	location.href="tripboard.jsp?page=<%=p+1%>";
	
}

function previous(){
	location.href="tripboard.jsp?page=<%=p-1%>";
}
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
      
      $.ajax({
          url:'./findpw.jsp?id='+id+'&email='+email+'&name='+name,
          type:'post',
          dataType :"json",
          success:function(data){
        	  
        	  if(data.aa ==1){
        		  alert("초기 비밀번호는 a123456789! 입니다.");
        	  }else{
        		  alert("회원정보가 없습니다.");
        	  }

        	  
          },
          error:function(xhr,textStatus,errorThrown){
        	  alert("실패");
          }
      });
       
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
</head>
<body>
<%
                      // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
                        if(session.getAttribute("id") == null) {
                        	%>
                        	<div id="delcd-wrapper">
		<div id="delcd-page">

		<header id="delcd-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-delcd-nav-toggle delcd-nav-toggle dark"><i></i></a>
					<h1 id="delcd-logo"><a href="index.jsp"><img id="travel-icon" src="" alt="" />Fill My Trip </a></h1>
					
					<!-- start navbar -->
					<nav id="delcd-menu-wrap">
						<ul class="sf-menu" id="delcd-primary-menu">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="areaSelect.jsp">Fill My Trip</a></li>
							<li><a href="tripboard.jsp">Travel Sharing</a></li>
							<li><a href="faqboard.jsp">FAQ</a></li>
							<li><a href="login.jsp" class="delcd-sub-ddown">Login</a></li>
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
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/CPnJrtP/welcome5.jpg);">
				<div class="desc2">
					<div class="container"> 
						<div class="row">
							<div class="col-md-12">
								
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>LOGIN PAGE</h2></br></br>
									<h2 style="font-size: 50px">Please Enter Your Information.</h2>
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
			
				<div class="row">
				<div class="col-lg-12">
						
						   <form action="loginCheck.jsp" method="post">
						
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="email" name="input_id"  style="width: 1000px; height: 50px; font-size: 30px;"   placeholder="Email(ID)" required>
									</div>
								</div>
									
												
								<div class="col-md-12" >
									<div class="form-group">
										<input type="password" class="form-control pw" name="input_pw" id="pw1"  style="width: 1000px; height: 50px; font-size: 30px;"     placeholder="Password" required>
									</div>
								</div>
								
								
								<div class="col-md-12" style="text-align: center;">
									<div class="form-group">
										<input type="submit" value="Login" class="btn btn-primary" style="width: 200px; height: 60px;">
									</div>
								</div>
								
								<div class="col-md-12" style="text-align: center;">
									<div class="form-group">
						
											<button onClick="location.href='join.jsp'" class="btn btn-primary" style="width: 200px; height: 60px;">회원가입</button>
										
									</div>
												
											</div>
											
											
											
											</form>
											<div class="col-md-12" style="text-align: right;">
									<div class="form-group">
											<a href="#" onClick="loginWithKakao();">비밀번호찾기</a>
											</div>
											</div>
											
						</div>
				
				</div>
				
				
			</div><!-- end container -->
			
			
		</div><!-- end delcd-blog-section -->
		
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
                              <%          }else{
                                        
					id = (String)session.getAttribute("id");
					%>
<div id="delcd-wrapper">
		<div id="delcd-page">

		<header id="delcd-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-delcd-nav-toggle delcd-nav-toggle dark"><i></i></a>
					<h1 id="delcd-logo"><a href="index.jsp"><img id="travel-icon" src="" alt="" />Fill My Trip</a></h1>
					
					<!-- start navbar -->
					<nav id="delcd-menu-wrap">
						<ul class="sf-menu" id="delcd-primary-menu">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="areaSelect.jsp">Fill My Trip</a></li>
							<li><a href="tripboard.jsp">Travel Sharing</a></li>
							<li><a href="faqboard.jsp">FAQ</a></li>
							<li><a href="login.jsp" class="delcd-sub-ddown">My Page</a>
									<ul class="delcd-sub-menu">
									<li><a href="login.jsp">My Page</a>
									<li><a href="logout.jsp">Logout</a></li>
									
								</ul>
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
			<div class="delcd-cover" data-stellar-background-ratio="0.5" style="background-image: url(https://i.ibb.co/nkBmwxT/solo-trip11111.jpg);" >
				<div class="desc2">
					<div class="container"> 
						<div class="row">
							<div class="col-md-12">
								
								<!-- start  header txt -->
								<div id="desc-container">
									<h2>WELCOME TO MY PAGE</h2></br></br>
									
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
					
						<h3 style="font-size: 35px">You Can Manage Your Trip</h3>
						
						
				
						  <form action="logout.jsp" method="post">
            <br /> <br />
            <button class="btn btn-primary" style="width: 150px; height: 100px;">로그아웃</button>
            <br /> <br />
         </form>

					</div>
				</div>
				<!-- end subheading -->
			
				<!-- start blog row -->
				<div class="row row-bottom-padded-md">
					
					<%

							
					
					
					if(p < 0){
						PrintWriter script = response.getWriter();

						script.println("<script>");

						script.println("alert('첫 페이지입니다.')");

						script.println("history.back()");

						script.println("</script>");
					}else if(p > (boardDAO.getMyTripNo()/6)){
						PrintWriter script = response.getWriter();

						script.println("<script>");

						script.println("alert('마지막 페이지입니다.')");

						script.println("history.back()");

						script.println("</script>");
						
					}
					
					
					
                          					
					      int pageno = 6;

						   ArrayList<mytrip> list1 =boardDAO.getMyTrip(id,pageno*p,pageno*(p+1));
						   
						   
						   
						   
						   

							for (int i = 0; i < list1.size(); i++) {
								
								int check = boardDAO.reviewCheck(list1.get(i).getTitle());
								ArrayList <mytrip> list3 = boardDAO.goMyTrip(list1.get(i).getTitle());
								
								%>
					
					<!-- blog 1 -->
					<div class="col-lg-4 col-md-6">
						<div class="delcd-blog animate-box">
							
							<div class="blog-text">
							
								<div class="prod-title">
								
									<h3><a href="mytrip.jsp?title=<%=list1.get(i).getTitle()%>"><%=list1.get(i).getTitle()%></a></h3>
									
									<span class="posted_by"><%
							if(check==1){
								
						
							review review = new boardDAO().getreview(list1.get(i).getTitle());
							
							for(int j=0;j<review.getStarpoint();j++){
								%>
								<span style="font-size:20px;cursor:pointer;color:red;text-align:center;"  class="fa fa-star"></span>
							<% 
							}
							}
							%></span>
									<span class="comment"><a href=""><%=boardDAO.getCommentNo(list1.get(i).getTitle()) %><i class="icon-bubble2"></i></a></span></br>
									<%=list1.get(i).getTotaldistance()%></br>
									<%=list1.get(i).getTotaltime()%></br></p>
									<p> 
									<%if(list1.get(i).getAvailable() ==0){
                              %><a href="#" onclick="trip_available('<%=list1.get(i).getTitle()%>',<%=list1.get(i).getAvailable()%>);">비공개</a>
                           <% 
                           }else if(list1.get(i).getAvailable() ==1){
                           %>
                           <a href="#" onclick="trip_available('<%=list1.get(i).getTitle()%>',<%=list1.get(i).getAvailable()%>);">공개</a>   
                           <%
                           }
                           %></br>
                           <a href="#" onclick="trip_delete('<%=list1.get(i).getTitle()%>');">삭제</a>
                           </br></br>
                           <a id="kakao-link-btn" href="javascript:sendLink('<%=list1.get(i).getTitle()%>','<%=list3.get(1).getName()%>')"> 
                           <img src="./images/kakaolink_btn_small.png" />
                               </a>
                               </p>
                          
								</div>
							</div> 
						</div>
					</div>
							<% 
							}%>
					
					
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
							<h3 style="font-size: 45px;">He Who Would Travel Happily Must Travel Lightly</h3>
							<p style="font-size: 25px;">-Antoine Marie Jean-Baptiste Roger de Saint-Exupéry-</p>
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
	<%} %>
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