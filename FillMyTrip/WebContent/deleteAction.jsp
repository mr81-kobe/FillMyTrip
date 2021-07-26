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
<title>게시판</title>
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

		int BOARD_NO = 0;

		if(request.getParameter("BOARD_NO") != null){

			BOARD_NO = Integer.parseInt(request.getParameter("BOARD_NO"));

		}

		if(BOARD_NO == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다')");

			script.println("location.href='board.jsp'");

			script.println("</script>");

		}

		board board = new boardDAO().getboard(BOARD_NO);

		if(!id.equals(board.getUSER_ID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('권한이 없습니다')");

			script.println("location.href='board.jsp'");

			script.println("</script>");			

		}

		else{

			boardDAO boardDAO = new boardDAO();

			int result = boardDAO.delete(BOARD_NO);

			if (result == -1) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('글 삭제에 실패했습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("location.href='board.jsp'");

				script.println("</script>");

			}

		}

	%>


</body>
</html>