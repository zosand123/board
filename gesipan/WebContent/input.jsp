<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/ksy";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
   
   // request값
   request.setCharacterEncoding("utf-8");
   String name="나그네";
   String title="페이지연습";
   String pwd="1234";
   String content="학교종이 땽땽땽";
   String sung="0";
   String hobby="0,1,4";
   String birth="1996";

   // 쿼리 생성
   for(int i=1;i<=2537;i++){
	   String sql="insert into gesipan(name,title,pwd,content,sung,hobby,birth,writeday)";
	   sql=sql+" values(?,?,?,?,?,?,?,now())";
	   // 심부름꾼 생성
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, name+i);
	   pstmt.setString(2, title+" "+i);
	   pstmt.setString(3, pwd);
	   pstmt.setString(4, content);
	   pstmt.setString(5, sung);
	   pstmt.setString(6, hobby);
	   pstmt.setString(7, birth);
	   // 쿼리 실행
	   pstmt.executeUpdate();
   }
   // 이동(list.jsp)
   response.sendRedirect("list1.jsp");
   conn.close();
%>










