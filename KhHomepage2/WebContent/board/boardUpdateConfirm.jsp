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
ul{list-style-type: none;}
.kh01{
    width:100px; height:50px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
   String titleSearch=request.getParameter("titleSearch");
   int no=0;
   String title=null;
   String content=null;
   String author=null;
   String nal=null;
   String readcount=null;
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
   String sql = "select no,title,content,author,nal,readcount from board where title=?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, titleSearch);
   ResultSet rs=pstmt.executeQuery();
   while(rs.next()){
	   no = rs.getInt("no");
	   title = rs.getString("title");
	   content = rs.getString("content");
	   author = rs.getString("author");
	   nal = rs.getString("nal");
	   readcount = rs.getString("readcount");
   }
   out.print("변경하기 전 내용입니다.<br>");
   out.print("번호="+no+"제목="+title+"내용="+content+"작성자="+author+"날짜="+nal+"조회수"+readcount);
%>
<div id="boardUpdate">
   <form action="boardUpdate.jsp" method="get">
    <ul>
       <li><label for="번호">번호</label>
           <input type="number" readonly="readonly" value="<%=no%>">
           <input type="hidden" name="no" value="<%=no %>"> 
       </li>
       <li><label for="제목">제목</label>
           <input type="text" name="title" autofocus="autofocus" required="required" placeholder="변경할제목을입력해주세요">
           <input type="hidden" name="titleSearch" value="<%=titleSearch %>">
       </li>
       <li><label for="내용">내용</label>
           <textarea rows="20" cols="80" name="content" placeholder="변경할내용을입력해주세요"></textarea>
       </li>
       <li><label for="작성자">작성자</label>
           <input type="text" name="author" placeholder="변경할작성자를입력해주세요">
       </li>
       <li><label for="날짜">날짜</label>
           <input type="date" name="nal">
       </li>
       <li><label for="조회수">조회수</label>
           <input type="text" name="readcount" placeholder="변경할조회수를입력해주세요">
       </li>
       <li><input type="image" src="../images/update.jpg" class="kh01">
       <input type="reset" value="되돌리기">
       </li>
    </ul>    
   </form>   
</div>
</body>
</html>