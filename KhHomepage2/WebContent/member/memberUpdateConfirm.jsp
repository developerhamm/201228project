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
body{background-image: url(images/back01.jpg)}
ul{list-style-type: none;}
.kh01{
    width:100px; height:50px;
}
#memberUpdateForm{
   position: absolute;
   top:300px;left:600px;
   width:500px;
   border: 1px solid orange;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
String idSearch = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "select id,pw,addr,tel from member where id=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, idSearch);
ResultSet rs=null;
String id = null;
String pw = null;
String addr = null;
String tel = null;
rs=pstmt.executeQuery();
while(rs.next()){
	id=rs.getString("id");
	pw=rs.getString("pw");
	addr=rs.getString("addr");
	tel=rs.getString("tel");
	out.print("변경하기 전 회원목록입니다.<br>");
	out.print("아이디:"+id+"패스워드:"+pw+"주소:"+addr+"전화번호:"+tel);
}
%>
<form action="memberUpdate.jsp" method="get">
  <ul>
     <li><label for="아이디">아&nbsp;이&nbsp;&nbsp;디</label>
         <input type="text" name="id" autofocus="autofocus" required="required" placeholder="변경할아이디입력">
         <input type="hidden" name="idSearch" value="<%=idSearch %>">
     </li>
     <li><label for="패스워드">패스워드</label>
         <input type="password" name="pw" placeholder="변경할패스워드입력">
     </li>
     <li><label for="주소">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
         <input type="text" name="addr" placeholder="변경할주소입력">
     </li>
     <li><label for="전화번호">전화번호</label>
         <input type="text" name="tel" placeholder="변경할전화번호입력">
     </li>
     <li><input type="image" src="../images/update.png" class="kh01"></li>
  </ul>
</form>
</body>
</html>