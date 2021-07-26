<%@page import="board.boardDAO"%>
<%@ page import="java.util.*,java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("utf-8"); //데이터베이스로 보낼때 한글깨짐 방지
%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
    <% 
    
    String user_id= request.getParameter("input_id");
    String user_pw= request.getParameter("input_pw");
    boardDAO board = new boardDAO();
        
        
      int  rs = board.logincheck(user_id, user_pw);
        
        
        // isLogin 은 로그인 확인 유무를 위한 변수
        if(rs == 1){
        	
        	if(user_pw.equals("a123456789!")){
        		session.setAttribute("id", user_id); 
                session.setAttribute("pw", user_pw);
        		
        		response.sendRedirect("setpw.jsp");
        	}else{
        		session.setAttribute("id", user_id); 
                session.setAttribute("pw", user_pw);

    			response.sendRedirect("index.jsp");
        	}

        	

		}else if(rs == 0){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('비밀번호가 틀립니다.')");

			script.println("history.back()");

			script.println("</script>");

		}else if(rs == -1){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('존재하지 않는 아이디 입니다.')");

		script.println("history.back()");

		script.println("</script>");

		}else if(rs == -2){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('DB오류가 발생했습니다.')");

		script.println("history.back()");

		script.println("</script>");

		}



        
        
   
    %>




</body>
</html>