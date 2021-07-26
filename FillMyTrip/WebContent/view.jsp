<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="java.io.PrintWriter"%>

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
<meta name="viewport" content="width=device-width" initial-scale="1">

<meta charset="UTF-8">
<title>게시판 </title>
</head>
<body>
<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String id = null;

		if (session.getAttribute("id") != null) {

			id = (String) session.getAttribute("id");

	

		}

		int BOARD_NO = 0;

		if (request.getParameter("BOARD_NO") != null) {

			BOARD_NO = Integer.parseInt(request.getParameter("BOARD_NO"));

		}

		if (BOARD_NO == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'board.jsp'");

			script.println("</script>");

		}

		board board = new boardDAO().getboard(BOARD_NO);

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

				<li><a href=index.jsp>메인</a></li>

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

							<th colspan="3"

								style="background-color: #eeeeee; text-align: center;">글 보기 </th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td style="width: 20%;"> 글 제목 </td>

							<td colspan="2"><%= board.getBOARD_TITLE() %></td>

						</tr>

						<tr>

							<td>작성자</td>	

							<td colspan="2"><%= board.getUSER_ID() %></td>

						</tr>

						<tr>

							<td>작성일</td>	

							<td colspan="2"><%= board.getBOARD_DATE().substring(0, 11) + board.getBOARD_DATE().substring(11, 13) + "시"

							+ board.getBOARD_DATE().substring(14, 16) + "분"%></td>

						</tr>
						<tr>
						<td>
							<%for(int j=0;j<board.getSTARPOINT();j++){ %>
								<span style="font-size:40px;cursor:pointer;color:red;text-align:center;"  class="fa fa-star"></span>
							<%} %>
							
							</td>
							</tr>

						<tr>

							<td>내용</td>	

							<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBOARD_CONTENT() %></td>

						</tr>

						

					</tbody>

				</table>	

				<a href = "board.jsp" class="btn btn-primary">목록</a>

				

				

				<%

				//글작성자 본인일시 수정 삭제 가능 

					if(id != null && id.equals(board.getUSER_ID())){

				%>

						<a href="update.jsp?BOARD_NO=<%= BOARD_NO %>" class="btn btn-primary">수정</a>

						<a href="deleteAction.jsp?BOARD_NO=<%= BOARD_NO %>" class="btn btn-primary">삭제</a>

				<%					

					}

				%>

		

</body>
</html>