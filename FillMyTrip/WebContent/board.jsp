<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
request.setCharacterEncoding("utf-8"); //데이터베이스로 보낼때 한글깨짐 방지
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>게시판</title>
<style type="text/css">

		a, a:hover {

			color: #000000;

			text-decoration: none;

		}

	</style>
</head>
<body>
<%

			//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

			String id = null;

			if (session.getAttribute("id") != null) {

				id = (String) session.getAttribute("id");

	

			}

	

			int pageNumber = 1; //기본 페이지 넘버

	

			//페이지넘버값이 있을때

			if (request.getParameter("pageNumber") != null) {

				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

			}

		%>

	

	

		<!-- 네비게이션  -->

		<nav class="navbar navbar-default">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"

					data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

					aria-expaned="false">

					<span class="icon-bar"></span> <span class="icon-bar"></span> <span

						class="icon-bar"></span>

				</button>

				<a class="navbar-brand" href="board.jsp">필마단창's 게시판</a>

			</div>

			<div class="collapse navbar-collapse"

				id="#bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav">

					<li><a href="index.jsp">메인</a></li>

					<li class="active"><a href="board.jsp">게시판</a></li>

				</ul>

	

	

				<%

					//라긴안된경우

					if (id == null) {

				%>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"


 
						aria-expanded="false">접속하기<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="login.jsp">로그인</a></li>

							<li><a href="join.jsp">회원가입</a></li>

						</ul></li>

				</ul>

				<%

					} else {

				%>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"


 
						aria-expanded="false">회원관리<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="logout.jsp">로그아웃</a></li>
							<li><a href="login.jsp">마이페이지</a></li>

						</ul></li>

				</ul>

				<%

					}

				%>

			</div>

		</nav>

		<!-- 게시판 -->

		<div class="container">

			<div class="row">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th style="background-color: #eeeeee; text-align: center;">번호</th>

							<th style="background-color: #eeeeee; text-align: center;">제목</th>


 
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>

							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							
							<th style="background-color: #eeeeee; text-align: center;">평점</th>

						</tr>

					</thead>

					<tbody>          

						<%

							boardDAO boardDAO = new boardDAO();

						   ArrayList<board> list = boardDAO.getList(pageNumber);

							for (int i = 0; i < list.size(); i++) {

						%>
						
						
 
						<tr>

							<td><%=list.get(i).getBOARD_NO()%></td>

							<td><a href="view.jsp?BOARD_NO=<%=list.get(i).getBOARD_NO()%>"><%=list.get(i).getBOARD_TITLE()%></a></td>

							<td><%=list.get(i).getUSER_ID()%></td>

							<td><%=list.get(i).getBOARD_DATE().substring(0, 11) + list.get(i).getBOARD_DATE().substring(11, 13) + "시"

							+ list.get(i).getBOARD_DATE().substring(14, 16) + "분"%></td>
							
							<td>
							<%for(int j=0;j<list.get(i).getSTARPOINT();j++){ %>
								<span style="font-size:20px;cursor:pointer;color:red;"  class="fa fa-star"></span>
							<%} %>
							
							</td>
							
                            

						</tr>
						

	

						<%

							}

						%>

	

					</tbody>

				</table>

				<!-- 페이지 넘기기 -->

				<%

					if (pageNumber != 1) {

				%>

				<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"

					class="btn btn-success btn-arrow-left">이전</a>

				<%

					}

					if (boardDAO.nextPage(pageNumber)) {

				%>

				<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"

					class="btn btn-success btn-arrow-left">다음</a>

				<%

					}

				%>

	

	

				<!-- 회원만넘어가도록 -->

				<%

					//if logined userID라는 변수에 해당 아이디가 담기고 if not null

					if (session.getAttribute("id") != null) {

				%>

				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>

				<%

					} else {

				%>

				<button class="btn btn-primary pull-right"

					onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"

					type="button">글쓰기</button>

				<%

					}

				%>

	

			</div>

		</div>
			

</body>
</html>