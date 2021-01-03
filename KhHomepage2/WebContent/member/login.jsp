<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
   String sql = "select id,pw from member where id=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   ResultSet rs = null;
   rs=pstmt.executeQuery();
   String iddb = null;
   String pwdb = null;
   while(rs.next()){
	   iddb = rs.getString("id");
	   pwdb = rs.getString("pw");	  
   }
   if(!id.equals(iddb)){
	   out.print("아이디가틀렸습니다.");
   }else if(!pw.equals(pwdb)){
	   out.print("비밀번호가 일치하지 않습니다.");
   }else{
	   out.print("환영합니다.");
	   session.setAttribute("id", id);
   }
   response.sendRedirect("../index.jsp?page=kh");
%>
</body>
</html>