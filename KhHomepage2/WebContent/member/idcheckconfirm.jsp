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
   ResultSet rs = null;
   String telSearch = request.getParameter("tel");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select id from member where tel=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, telSearch);
rs=pstmt.executeQuery();
String id = null;
while(rs.next()){
	id = rs.getString("id");
}
%>
<%= id %> 찾으신 아이디입니다.<br>
<a href="index.jsp?page=kh">메인으로</a>
</body>
</html>