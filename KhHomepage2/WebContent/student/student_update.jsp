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
   String hakbun = request.getParameter("hakbun");
   String irumUpdate = request.getParameter("irumUpdate");
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hladagers", "hladagers", "yoon665174db");
   String sql = "update student set age=?,irum=?,hakbun=? where irum=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, age);
   pstmt.setString(2, irum);
   pstmt.setString(3, hakbun);
   pstmt.setString(4, irumUpdate);   
   int cnt=pstmt.executeUpdate();
%>
<%=cnt %>건 학생이 수정되었습니다.<br>
<a href="../haksaInfo.jsp">학사관리</a>&nbsp;<a href="studentList.jsp">학생전체출력</a>
<%
   pstmt.close();
   conn.close();
%>
</body>
</html>