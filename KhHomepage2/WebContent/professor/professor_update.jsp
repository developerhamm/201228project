<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
<h1>학생 수정</h1>
<%
   String irum = request.getParameter("irum");
   String age = request.getParameter("age");
   String subject = request.getParameter("subject");
   String irumUpdate = request.getParameter("irumUpdate");
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hladagers", "hladagers", "yoon665174db");
   String sql = "update professor set age=?,irum=?,subject=? where irum=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, age);
   pstmt.setString(2, irum);
   pstmt.setString(3, subject);
   pstmt.setString(4, irumUpdate);   
   int cnt=pstmt.executeUpdate();
%>
<%=cnt %>건 교수님이 수정되었습니다.<br>
<%response.sendRedirect("professorList.jsp"); %>
<%
   pstmt.close();
   conn.close();
%>
</body>
</html>