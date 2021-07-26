<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,java.lang.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
     // JOIN.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
     String title = request.getParameter("title");
    

    boardDAO mytrip = new boardDAO();
    
    
    int rs =0;
     
        rs =  mytrip.checkmytitle(title);
        
        
        if(rs == -1){
           out.print(title);
            out.println("은 이미 존재합니다.");
        }else if(rs == 1){
           
            out.println("이름을 입력해주세요");
        }else{
        	out.print(title);
            out.println("은 사용가능합니다.");
        }
         /*  while(rs.next()){
           re = rs.getString("email");
           if(re ==null){
              out.print(re);
              out.println("은 이미 존재합니다.");
           }else{
              out.print(email);
              out.println("은 사용가능합니다.");
           }
              
         }
           */

        
        
        

        // 회원가입에 성공하였으면 첫 페이지로 보낸다
        

 
     
     
  %>
</body>
</html>