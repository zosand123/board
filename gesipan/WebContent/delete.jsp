<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //db연결
	Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/ksy";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	//reauest값 읽어오기
    String id = request.getParameter("id");
  	//쿼리생성
	String sql="delete from gesipan where id="+id;
	//심부름꾼생성
	Statement stmt=conn.createStatement();
	//쿼리실행
	stmt.executeQuery(sql);
	
	response.sendRedirect("list.jsp");
	conn.close();
	
%>