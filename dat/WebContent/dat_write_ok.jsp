<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//db 연결
	Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/ksy";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	//request값
	request.setCharacterEncoding("utf-8");
    String gid=request.getParameter("gid");
    String name=request.getParameter("name");
    String pwd=request.getParameter("pwd");
    String content=request.getParameter("content");
	//쿼리완성
	String sql="insert into dat(name,pwd,content,writeday,gid)";
	sql=sql+"values (?,?,?,now(),?)";
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,pwd);
	pstmt.setString(3,content);
	pstmt.setString(4,gid);
	//쿼리실행
	pstmt.executeUpdate();
	//실행후 이동
	response.sendRedirect("content1.jsp?id="+gid);
%>