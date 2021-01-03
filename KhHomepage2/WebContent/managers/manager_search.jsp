<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
<h1>관리자검색</h1>
<%
    String irumSearch = request.getParameter("irum");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select no,age,irum,part from manager where irum=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
 pstmt.setString(1, irumSearch);
 ResultSet rs=pstmt.executeQuery();
int no=0;
String age=null;
String irum=null;
String part=null;
while(rs.next()){
	 no=rs.getInt("no");
	 age = rs.getString("age");
	irum = rs.getString("irum");
	part = rs.getString("part");
}
%>
<%=no %>&nbsp;&nbsp;<%=age %>&nbsp;&nbsp;<%=irum %>&nbsp;&nbsp;<%=part %><br>
<a href="managerList.jsp">관리자전체출력</a>&nbsp;<a href="../haksaInfo.jsp">학사관리</a>
<%
   pstmt.close();
   rs.close();
   conn.close();
%>
</body>
</html>