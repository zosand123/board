<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
	//db
	Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/ksy";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw);
    
	//request
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int guk = Integer.parseInt(request.getParameter("guk"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	int snc = Integer.parseInt(request.getParameter("snc"));

	//쿼리생성 
	String sql="insert into sungjuk (name,guk,eng,math,snc,writeday)"
				+"values(?,?,?,?,?,now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, guk);
	pstmt.setInt(3, eng);
	pstmt.setInt(4, math);
	pstmt.setInt(5, snc);
	
	//쿼리실행
	pstmt.executeUpdate();
	
	//이동할페이지
	response.sendRedirect("sung_view.jsp");
	conn.close();
%>