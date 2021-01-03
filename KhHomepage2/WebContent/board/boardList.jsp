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
body{background-image: url("images/back01.jpg");}
#boardlist{
  position: absolute;
  top:300px;left:400px;
}
table{
   border: 1px solid white; border-collapse: collapse;
}
th{background-color: black; color: white;}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="boardlist">
<h1>커뮤니티 목록</h1>
<table border="1" cellspacing="0" cellpadding="0">
<tr>
    <th>번호</th>
    <th>제목</th>
    <th>내용</th>
    <th>작성자</th>
    <th>날짜</th>
    <th>조회수</th>
    <th>&nbsp;</th>
</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select no,title,content,author,nal,readcount from board";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
int no=0;
String title=null;
String content=null;
String author=null;
String nal=null;
int readcount=0;
while(rs.next()){
	no=rs.getInt("no");
	title=rs.getString("title");
	content=rs.getString("content");
	author=rs.getString("author");
	nal=rs.getString("nal");
	readcount=rs.getInt("readcount");
	out.print("<tr><td>"+no+"</td><td>"+title+"</td><td>"+content+"</td><td>"+author+"</td><td>"+nal+"</td><td>"+readcount+"</td><td><a href=board/boardDelete.jsp?no="+no+">삭제</a></td></tr>");	
}
%>

</table>
<a href="index.jsp?page=board/boardWrite">글쓰기</a>&nbsp;
<a href="index.jsp?page=boardSearchForm">검색</a>&nbsp;
<a href="index.jsp?page=board/boardUpdateForm">수정</a>&nbsp;
</div>
</body>
</html>