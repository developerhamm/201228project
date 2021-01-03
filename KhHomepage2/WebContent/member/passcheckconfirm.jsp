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
String idSearch = request.getParameter("id"); 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql="select pw from member where id=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, idSearch);
rs=pstmt.executeQuery();
String pw = null;
while(rs.next()){
	pw = rs.getString("pw");
}
%>
<%= pw %> 찾으시는 패스워드입니다.<br>
<a href="index.jsp?page=kh">메인으로</a>
</body>
</html>