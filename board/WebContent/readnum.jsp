<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  //조회수올리는 코드를 따로 만들어서 중간에 추가해주면 새로고침해도 조회수 안올라감
	//db연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/ksy";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//request값 불러오기
	String id=request.getParameter("id");
	
	//쿼리생성
	String sql="update board set readnum=readnum+1 where id="+id;
	//심부름꾼
	Statement stmt=conn.createStatement();
	//쿼리실행
	stmt.executeUpdate(sql);
	//이동
	response.sendRedirect("content.jsp?id="+id);
%>