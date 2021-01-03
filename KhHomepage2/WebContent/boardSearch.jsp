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
request.setCharacterEncoding("utf-8");  
String titleSearch = request.getParameter("title");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select no,title,content,author,nal,readcount from board where title=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, titleSearch);
ResultSet rs=pstmt.executeQuery();
int no=0;
String title=null;
String content=null;
String author=null;
String nal=null;
int readcount=0;
while(rs.next()){
	no = rs.getInt("no");
	title = rs.getString("title");
	content = rs.getString("content");
	author = rs.getString("author");
	nal = rs.getString("nal");
	readcount = rs.getInt("readcount");	
}
readcount++;
sql = "update board set readcount=? where title=?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, readcount);
pstmt.setString(2, titleSearch);
int cnt=pstmt.executeUpdate();
%>
<%=cnt %>건 조회수가 수정되었습니다.
<jsp:forward page='<%= request.getParameter("boardTest") %>'>
<jsp:param value="<%=no %>" name="no"/>
<jsp:param value="<%=title %>" name="title"/>
<jsp:param value="<%=content %>" name="content"/>
<jsp:param value="<%=author %>" name="author"/>
<jsp:param value="<%=nal %>" name="nal"/>
<jsp:param value="<%=readcount %>" name="readcount"/>
</jsp:forward>

</body>
</html>