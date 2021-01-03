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
<h1>학생전체출력</h1>
번호     나이    이름      학번<br>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hladagers", "hladagers", "yoon665174db");
    String sql = "select no,age,irum,hakbun from student";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    //Statement stmt = conn.createStatement();
    ResultSet rs = pstmt.executeQuery(sql);
    while(rs.next()){
    	int no=rs.getInt("no");
    	String age=rs.getString("age");
    	String irum=rs.getString("irum");
    	String hakbun=rs.getString("hakbun");
    	out.print(no+"&nbsp;&nbsp;&nbsp;"+age+"&nbsp;&nbsp;&nbsp;"+irum+"&nbsp;&nbsp;&nbsp;"+hakbun+"<br>");
    }
    pstmt.close();
    conn.close();
%>
<a href="student.jsp">학생등록</a>
<a href="../haksaInfo.jsp">학사관리</a>
</body>
</html>