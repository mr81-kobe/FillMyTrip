<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    
    
<%request.setCharacterEncoding("UTF-8"); %>


    
<jsp:useBean id="board" class="board.trip_comment" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="board" property="comment" /><!-- bbs.setBbsTitle(requrst) -->





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id = null;

if (session.getAttribute("id") != null) {

	id = (String) session.getAttribute("id");



}

if (id == null) {

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('로그인을 하세요.')");

	script.println("location.href = 'login.jsp'");

	script.println("</script>");

} else {



Date nowTime = new Date();
SimpleDateFormat time = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm");

String regdate = time.format(nowTime);



String comment = request.getParameter("comment");
System.out.println("ididididididi12333"+comment);
String title = request.getParameter("title");

boardDAO boardDAO = new boardDAO();

int result = boardDAO.tripcomment_post(id, comment, regdate, title);

if(board.getComment() ==null){
	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('댓글 내용을 적어주세요')");

	script.println("history.back()");

	script.println("</script>");
}   else {

	

	if (result == -1) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('댓글 실패')");

		script.println("history.back()");

		script.println("</script>");

	} else {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		
		script.println("alert('댓글이 정상적으로 작성되었습니다.')");

		script.println("location.href='mytrip.jsp?title="+title+"'");

		//script.println("history.back()");

		script.println("</script>");

	}

}

} 


%>



</body>
</html>