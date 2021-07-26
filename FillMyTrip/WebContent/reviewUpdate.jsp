<%@page import="board.review"%>
<%@ page import="board.boardDAO"%>


<!-- bbsdao의 클래스 가져옴 -->

<%@ page import="java.io.*"%>

<!-- 자바 클래스 사용 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.

%>
<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="review" class="board.review" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="review" property="title" /><!-- bbs.setBbsTitle(requrst) -->

<jsp:setProperty name="review" property="review_content" />
<jsp:setProperty name="review" property="starpoint" />









    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판 글쓰기</title>
</head>
<body>
	<%
	
	
	review.setStarpoint(Integer.parseInt(request.getParameter("STARPOINT"))); 
	review.setTitle(request.getParameter("title"));
	review.setReview_content(request.getParameter("reviewContent"));
	
	

		String id = null;

		if (session.getAttribute("id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			id = (String) session.getAttribute("id");//유저아이디에 해당 세션값을 넣어준다.

		}

		if (id == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} else {



			if ( review.getReview_content() == "" || review.getStarpoint() == 0 ) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('입력이 안된 사항이 있습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				boardDAO boardDAO = new boardDAO();

				int result = boardDAO.reviewupdate(review.getTitle(),  review.getReview_content(), review.getStarpoint());

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글쓰기에 실패했습니다')");

					script.println("history.back()");

					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href='mytrip.jsp?title="+review.getTitle()+"'");

					//script.println("history.back()");

					script.println("</script>");

				}



			}



		}

	%>


</body>
</html>