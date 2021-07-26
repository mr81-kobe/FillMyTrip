<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width" initial-scale="1">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String id = null;

		if (session.getAttribute("id") != null) {

			id = (String) session.getAttribute("id");



		} 

		//로그인 안한 경우

		if(id == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

			

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

		if (!id.equals(board.getUSER_ID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('권한이 없습니다.')");

			script.println("location.href = 'board.jsp'");

			script.println("</script>");				

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

				<li><a href="TestFile.jsp">메인</a></li>

				<li class="active"><a href="board.jsp">게시판</a></li>

			</ul>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"


 
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logout.jsp">로그아웃</a></li>
						<li><a href="login.jsp">마이페이지</a></li>

					</ul>

				</li>

			</ul>

		</div>

	</nav>

	<!-- 게시판 --> 

	<div class="container">

		<div class="row">

			<form method="post" action="updateAction.jsp?BOARD_NO=<%= BOARD_NO %> ">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"

								style="background-color: #eeeeee; text-align: center;">글

								수정 </th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control" placeholder="글 제목" name="BOARD_TITLE" maxlength="50" value="<%= board.getBOARD_TITLE() %>" ></td>

						</tr>
						 <tr>

							<td>
                            <span  onmouseover="starmark(this)" onclick="starmark(this)"id="1one"   style="font-size:40px;cursor:pointer;"  class="fa fa-star checked"></span>
                            <span  onmouseover="starmark(this)" onclick="starmark(this)" id="2one"   style="font-size:40px;cursor:pointer;" class="fa fa-star "></span>
                            <span  onmouseover="starmark(this)" onclick="starmark(this)" id="3one"   style="font-size:40px;cursor:pointer;" class="fa fa-star "></span>
                            <span  onmouseover="starmark(this)" onclick="starmark(this)" id="4one"   style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
                            <span  onmouseover="starmark(this)" onclick="starmark(this)" id="5one"   style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
                            <input type="text" id = 'starpoint' name="STARPOINT" value= "1"  readonly style="display:none;">
                            <br/></td>

						</tr>

						<tr>

							<td><textarea class="form-control" placeholder="글 내용" name="BOARD_CONTENT" maxlength="2048" style="height: 350px;" ><%= board.getBOARD_CONTENT() %></textarea></td>

						</tr>

					</tbody>

				</table>	

				<button type="submit" class="btn btn-primary pull-right" >글수정</button>

			</form>

		</div>

	</div>
	<script>
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

</body>
</html>