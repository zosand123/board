<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
    
    // 쿼리 생성
    String sql="select * from member";
    
    // 심부름꾼
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
 %>
<!DOCTYPE html>
<html>
<head>  <!-- list.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
   
   while(rs.next()) 
   {
    out.print(rs.getString("name"));
    out.print(rs.getString("age"));
    out.print(rs.getString("juso"));
    out.print("<p>");
   }
 %>
 <a href="write.jsp">글쓰기</a>
</body>
</html>







