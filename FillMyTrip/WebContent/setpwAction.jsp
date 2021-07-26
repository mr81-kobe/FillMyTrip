<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
boardDAO boardDAO = new boardDAO();
String id; 
String pw;
id = request.getParameter("email");
pw = request.getParameter("pw1");

int rs =boardDAO.setpw(pw, id);

if(rs != -1){
	response.sendRedirect("index.jsp");
}else{
	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('DB오류가 발생했습니다.')");

	script.println("history.back()");

	script.println("</script>");
}



%>
</body>
</html>