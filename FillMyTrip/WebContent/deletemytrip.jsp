<%@ page import="board.boardDAO"%>
<%@ page import="board.board"%>
<%@ page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%

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

		} 

		String title="";

		title= request.getParameter("title");

		System.out.println("tttt"+title);

		

		

		

			boardDAO boardDAO = new boardDAO();

			int result = boardDAO.deleteMyTrip(title);

			if (result == -1) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('글 삭제에 실패했습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("location.href='login.jsp'");

				script.println("</script>");

			}

		

	%>
</body>
</html>