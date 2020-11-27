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
    
   // 업데이트에 필요한 입력값들 가져오기
    request.setCharacterEncoding("utf-8");
    String name=request.getParameter("name");
    String age=request.getParameter("age");
    String juso=request.getParameter("juso");
    String id=request.getParameter("id");
   // 쿼리 생성
    String sql="update member set name='"+name+"',age="+age+",juso='"+juso+"' where id="+id;
   // update member set name='홍길동',age=22,juso='부산' where id=1 
   // 심부름꾼생성
    Statement stmt=conn.createStatement();
   // 쿼리 실행
    stmt.executeUpdate(sql);
   // 보여주고 싶은 문서로 이동
    response.sendRedirect("list.jsp");
%>








