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
   String no1 = request.getParameter("no");
   int no=Integer.parseInt(no1);
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "delete from board where no=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, no);
int cnt=pstmt.executeUpdate();
%>
<%=cnt %>건 게시글이 삭제되었습니다.
<%response.sendRedirect("../index.jsp?page=board/boardList"); %>
</body>
</html>