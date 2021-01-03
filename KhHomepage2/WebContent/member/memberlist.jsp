<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{background-image: url(images/back01.jpg);}
table{border: 1px solid skyblue; border-collapse: collapse;
 text-align: center;
}
th{background-color: black; color: white;}
#memberlist{
  position: absolute;
  top:300px;left:500px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="memberlist">
<h1>회원목록</h1>
<table border="1" cellspacing="0" cellpadding="0">
   <tr>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>주소</th>
      <th>핸드폰번호</th>
   </tr>
   
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select id,pw,addr,tel from member";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs=null; 
String id = null;
String pw = null;
String addr = null;
String tel = null;
rs=pstmt.executeQuery();
while(rs.next()){
	id = rs.getString("id");
	pw = rs.getString("pw");
	addr = rs.getString("addr");
	tel = rs.getString("tel");
	out.print("<tr><td>"+id+"</td><td>"+pw+"</td><td>"+addr+"</td><td>"+tel+"</td></tr>");
}
%>
</table>
<a href="index.jsp?page=member/memberUpdateForm">멤버수정</a>
</div>
</body>
</html>