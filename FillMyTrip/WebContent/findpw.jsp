<%@page import="board.board"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>


<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String name = request.getParameter("name");
String pw = "a123456789!";

int rs;
boardDAO board = new boardDAO();

rs=board.finduser( id, email, name);

if(rs ==1){
	board.setpw(pw, email);
	
%>	{"aa" : "1"}	



<%	
}else{
	
%>

{"aa" : "0"}

<%	

}





%>