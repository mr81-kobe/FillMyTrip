<%@page import="board.boardDAO"%>
<%@ page import="java.util.*,java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("utf-8"); //데이터베이스로 보낼때 한글깨짐 방지
%>
<title>joinCheck</title>
</head>
<body>
  <%
        // JOIN.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
     String his_id = request.getParameter("id");
     String his_email = request.getParameter("email");
     String his_pw = request.getParameter("pw1");
     String his_name = request.getParameter("name");
     String his_year = request.getParameter("year");
     String his_month = request.getParameter("month");
     String his_day = request.getParameter("day");
     String his_ph = request.getParameter("ph");
     String birthday1 = request.getParameter("birthday");
   
     
     String [] birthday = birthday1.split("/");
     
     System.out.println(birthday[0]);
     System.out.println(birthday[1]);
     System.out.println(his_ph);
     
     

        
     boardDAO boardDAO = new boardDAO();

		int result = boardDAO.joincheck(his_id, his_email, his_pw, his_name, birthday[2], birthday[0], birthday[1], his_ph);

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('회원가입에 실패하였습니다')");

			script.println("history.back()");

			script.println("</script>");

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href='login.jsp'");

			script.println("</script>");

		}

            
            // 회원가입에 성공하였으면 첫 페이지로 보낸다
                    
            
        
    %>



</body>
</html>