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
    String idSearch = request.getParameter("idSearch");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String addr = request.getParameter("addr");
    String tel = request.getParameter("tel");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
    String sql = "update member set id=?,pw=?,addr=?,tel=? where id=?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, pw);
    pstmt.setString(3, addr);
    pstmt.setString(4, tel);
    pstmt.setString(5, idSearch);
    int cnt=pstmt.executeUpdate();
%>
   <%=cnt %>건 멤버가 수정되었습니다.
   <%response.sendRedirect("../index.jsp?page=member/memberlist"); %>
</body>
</html>