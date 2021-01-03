<%@page import="com.mysql.fabric.Response"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.kh01{
    width:100px; height:50px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
   String title = request.getParameter("title");
   String content  = request.getParameter("content");
   String author = request.getParameter("author");
   String nal  = request.getParameter("nal");
   String readcount = request.getParameter("readcount");      
%>
제목:<%=title %>내용:<%=content %>작성자:<%=author %>날짜:<%=nal %>조회수:<%=readcount %>
<%
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
   String sql = "insert into board(title,content,author,nal,readcount) values(?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, title);
   pstmt.setString(2, content);
   pstmt.setString(3, author);
   pstmt.setString(4, nal);
   pstmt.setString(5, readcount);
   int cnt=pstmt.executeUpdate();
%><br>
<%=cnt %>건 게시글이 등록되었습니다.
<%
   response.sendRedirect("../index.jsp?page=board/boardList");
   pstmt.close();
   conn.close();
%>
</body>
</html>