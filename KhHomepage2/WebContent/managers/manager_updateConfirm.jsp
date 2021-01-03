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
<style type="text/css">
.kh01{
   width:100px; height:70px;
}
#managerUpdate{
   border: 1px solid blue;
   border-radius: 20px;
   width:500px; 
}
ul{list-style-type: none;}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
String irumUpdate = request.getParameter("irum");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select age,irum,part from manager where irum=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, irumUpdate);
ResultSet rs=pstmt.executeQuery();
String age=null;
String irum=null;
String part=null;
while(rs.next()){
	age=rs.getString("age");
	irum=rs.getString("irum");
	part=rs.getString("part");
}
%>
<h1>최종수정 하기전 내용입니다.</h1>
<form action="manager_update.jsp" method="get">
<input type="hidden" name="irumUpdate" value="<%=irumUpdate %>">
<ul>
    <li><label for="나이변경">나이변경</label>
        <input type="number" name="age" value="<%=age %>">
    </li>
    <li><label for="이름변경">이름변경</label>
        <input type="text" name="irum" value="<%=irum %>">
    </li>
    <li><label for="부서변경">부서변경</label>
        <input type="text" name="part" value="<%=part %>">
    </li>
    <li><input type="image" src="../images/update.png" class="kh01">
    </li>
</ul>
</form>
</body>
</html>