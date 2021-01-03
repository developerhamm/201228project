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
	int cnt=0;
	ResultSet rs = null;
	String idDelete = (String)session.getAttribute("id");
	String pwDelete = request.getParameter("pw");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
	String sql = "select pw from member where pw=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pwDelete);
	rs=pstmt.executeQuery();
	String pwdb=null;
	while(rs.next()){
		pwdb = rs.getString("pw");
	}
	if(!pwDelete.equals(pwdb)){
	    out.print("<script>alert('패스워드틀렸습니다.')</script>");		
	}else{
	sql = "delete from member where id=? and pw=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, idDelete);
	pstmt.setString(2, pwDelete);
	cnt=pstmt.executeUpdate();
	session.invalidate();
	}
	%>
	<%=cnt %>건 회원님이 탈퇴었습니다.	
    <a href="../index.jsp?page=kh">메인으로</a>

</body>
</html>