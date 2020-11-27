<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/ksy";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");//한글처리(request값)
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	//쿼리생성
	String sql="insert into board(title,name,content,pwd,writeday) ";
	sql=sql+" values(?,?,?,?,now())";
	//심부름꾼 생성
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,title);
	pstmt.setString(2,name);
	pstmt.setString(3,content);
	pstmt.setString(4,pwd);
	//쿼리실행
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	//이동하고 싶은 문서 
	response.sendRedirect("list.jsp");
%>